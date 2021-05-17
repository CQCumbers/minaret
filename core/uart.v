`default_nettype none

module uart (
    input  clk, reset,
    input  rx_bit,
    output tx_bit,
    output available,

    input        valid,
    output       ready,
    input        wmask,
    input  [7:0] wdata,
    output [7:0] rdata,
);

// clock speed / baud rate
localparam CLKS_PER_BIT = 16;

reg [31:0] rx_clk;
reg [ 7:0] rx_buf;
reg [ 3:0] rx_state;

reg [31:0] tx_clk;
reg [ 8:0] tx_buf;
reg [ 3:0] tx_state;

assign ready = wmask ? !tx_state : rx_state == 10;
assign tx_bit = !tx_state | tx_buf[0];
assign rdata = rx_buf;

// receiver state machine
always @(posedge clk) begin
    rx_clk <= rx_clk + 1;
    if (reset) begin
        rx_buf <= -1;
        rx_state <= 0;
    end else
    case (rx_state)
        0: begin
            // wait for start bit
            if (rx_bit == 0) begin
                rx_clk <= 0;
                rx_state <= 1;
            end
        end
        1: begin
            // wait to middle of start bit
            if (rx_clk * 2 >= `CLKS_PER_BIT) begin
                rx_clk <= 0;
                rx_state <= rx_state + 1;
            end
        end
        10: begin
            // block until byte read
            if (valid & !wmask) begin
                rx_state <= 0;
            end
        end
        default: begin
            // sample middle of data bits
            if (rx_clk >= `CLKS_PER_BIT) begin
                rx_clk <= 0;
                rx_buf <= {rx_bit, rx_buf[7:1]};
                rx_state <= rx_state + 1;
            end
        end
    endcase
end

// transmitter state machine
always @(posedge clk) begin
    tx_clk <= tx_clk + 1;
    if (reset) begin
        tx_buf <= 0;
        tx_state <= 0;
    end else
    case (tx_state)
        0: begin
            // wait for write data
            if (valid & wmask) begin
                tx_clk <= 0;
                tx_buf[8:1] <= wdata;
                tx_state <= 1;
            end
        end
        9: begin
            // end transmission
            if (tx_clk >= `CLKS_PER_BIT) begin
                tx_state <= 0;
            end
        end
        default: begin
            // transmit data bits
            if (tx_clk >= `CLKS_PER_BIT) begin
                tx_clk <= 0;
                tx_buf <= tx_buf >> 1;
                tx_state <= tx_state + 1;
            end
        end
    endcase
end

endmodule
