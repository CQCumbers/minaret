`default_nettype none

module uart (
    input  wire        clk,
    input  wire        rx_bit,
    output wire        tx_bit,

    input  wire        valid,
    output wire        ready,
    input  wire        wmask,
    input  wire [31:0] wdata,
    output reg  [31:0] rdata
);

// clock speed / baud rate
localparam CLKS_PER_BIT = 434;

reg [9:0] rx_clk = 0;
reg [7:0] rx_buf = 0;
reg [3:0] rx_state = 0;

reg tx_ready = 0;
reg [9:0] tx_clk = 0;
reg [8:0] tx_buf = 0;
reg [3:0] tx_state = 0;

reg [7:0] rx_fifo [0:127];
reg [7:0] rx_rptr = 0;
reg [7:0] rx_wptr = 0;
reg [5:0] rx_sum = 32;
reg rx_avg = 1;

initial rdata = 0;
wire rx_empty = rx_rptr == rx_wptr;
assign ready = !wmask | tx_ready;
assign tx_bit = !tx_state | tx_buf[0];

// receiver state machine
always @(posedge clk) begin
    rx_clk <= rx_clk + 10'd1;
    // debounce input
    if ( rx_bit & rx_sum != 63) rx_sum <= rx_sum + 6'd1;
    if (!rx_bit & rx_sum != 0 ) rx_sum <= rx_sum - 6'd1;
    if (rx_sum == 63) rx_avg <= 1;
    if (rx_sum ==  0) rx_avg <= 0;
    // consume buffer on read
    if (valid & !wmask) begin
        rdata[ 7:0] <= rx_fifo[rx_rptr[6:0]];
        rdata[31:8] <= {!rx_empty, 7'h00};
        rx_rptr <= rx_rptr + !rx_empty;
    end
    case (rx_state)
        0: begin
            // wait for start bit
            if (rx_avg == 0) begin
                rx_clk <= 0;
                rx_state <= 1;
            end
        end
        1: begin
            // wait to middle of start bit
            if (rx_clk >= CLKS_PER_BIT / 2) begin
                rx_clk <= 0;
                rx_state <= 2;
            end
        end
        10: begin
            // buffer received data
            if (rx_clk >= CLKS_PER_BIT) begin
                rx_state <= 0;
                rx_fifo[rx_wptr[6:0]] <= rx_buf;
                rx_wptr <= rx_wptr + 8'd1;
            end
        end
        default: begin
            // sample middle of data bits
            if (rx_clk >= CLKS_PER_BIT) begin
                rx_clk <= 0;
                rx_buf <= {rx_avg, rx_buf[7:1]};
                rx_state <= rx_state + 4'd1;
            end
        end
    endcase
end

// transmitter state machine
always @(posedge clk) begin
    tx_clk <= tx_clk + 10'd1;
    tx_ready <= 0;
    if (tx_clk >= CLKS_PER_BIT) begin
        case (tx_state)
            0: begin
                // wait for write data
                if (valid & wmask) begin
                    tx_clk <= 0;
                    tx_buf[8:1] <= wdata[7:0];
                    tx_state <= 1;
                    tx_ready <= 1;
                end
            end
            9: begin
                // end transmission
                tx_clk <= 0;
                tx_state <= 0;
            end
            default: begin
                // transmit data bits
                tx_clk <= 0;
                tx_buf <= tx_buf >> 1;
                tx_state <= tx_state + 4'd1;
            end
        endcase
    end
end

endmodule
