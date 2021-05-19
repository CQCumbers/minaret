`default_nettype none
`define CLKS_PER_BIT 499

module i2c_master (
    input clk, reset,
    inout scl,
    inout sda,

    input       valid,
    output      ready,
    input [7:0] device,
    input [7:0] addr,
    input [7:0] data
);

reg [27:0] buffer;
reg [ 5:0] state;
reg [15:0] i2c_cnt;
wire waited = i2c_cnt >= `CLKS_PER_BIT;

assign scl = ~state[ 0] ? 1'bz : 1'b0;
assign sda = buffer[27] ? 1'bz : 1'b0;
assign ready = !state;

always @(posedge clk) begin
    i2c_cnt <= i2c_cnt + 1;
    if (reset) begin
        i2c_cnt <= 0;
        buffer <= -1;
        state <= 6'd60;
    end else
    case (state)
        6'd00:  // send start signal
        if (valid) begin
            i2c_cnt <= 0;
            buffer <= {1'b0, device, 1'b1,
                addr, 1'b1, data, 1'b1};
            state <= 2;
        end
        6'd58:  // send stop signal
        if (waited && scl) begin
            i2c_cnt <= 0;
            buffer <= -1;
            state <= 6'd60;
        end
        6'd60:  // wait before ready
        if (waited) begin
            i2c_cnt <= 0;
            state <= 6'd00;
        end
        default:  // send data
        if (waited && scl == ~state[0]) begin
            i2c_cnt <= 0;
            state <= state + 1;
            if (scl) buffer <= buffer << 1;
        end
    endcase
end

endmodule
