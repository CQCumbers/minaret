`default_nettype none

// i2c one-master, write-only
module i2c_write #(
    parameter CLKS_PER_BIT = 500
) (
    input  wire       clk,
    inout  wire       scl,
    inout  wire       sda,
    input  wire       valid,
    output wire       ready,
    input  wire [7:0] device,
    input  wire [7:0] addr,
    input  wire [7:0] data
);

// i2c states
localparam S_WIDTH = 6;
localparam S_IDLE  = 0;
localparam S_START = 2;
localparam S_STOP  = S_START + 28 * 2;
localparam S_WAIT  = S_START + 29 * 2;

reg [15:0] d_cnt = 0;
reg [27:0] d_buf = -1;
reg [ 5:0] state = S_WAIT;

wire done = d_cnt >= CLKS_PER_BIT - 1;
assign scl = !state[ 0] ? 1'bz : 1'b0;
assign sda =  d_buf[27] ? 1'bz : 1'b0;
assign ready = state == S_IDLE;

always @(posedge clk) begin
    d_cnt <= d_cnt + 16'd1;
    case (state)
        S_IDLE:  // send start signal
        if (valid) begin
            d_cnt <= 0;
            d_buf <= {1'b0, device, 1'b1,
                addr, 1'b1, data, 1'b1};
            state <= S_START;
        end
        S_STOP:  // send stop signal
        if (done && scl) begin
            d_cnt <= 0;
            d_buf <= -1;
            state <= S_WAIT;
        end
        S_WAIT:  // wait before ready
        if (done) begin
            d_cnt <= 0;
            state <= S_IDLE;
        end
        default: // send data bits
        if (done && scl != state[0]) begin
            d_cnt <= 0;
            d_buf <= d_buf << scl;
            state <= state + 1;
        end
    endcase
end

endmodule
