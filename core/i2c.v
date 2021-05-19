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
reg [15:0] i2c_clk;

assign scl = ~state[ 0] ? 1'bz : 1'b0;
assign sda = buffer[27] ? 1'bz : 1'b0;
assign ready = !state;

always @(posedge clk) begin
    i2c_clk <= i2c_clk + 1;
    if (reset) begin
        i2c_clk <= 0;
        buffer <= -1;
        state <= 6'd60;
    end else
    case (state)
        6'd00:   // send start signal
        if (valid) begin
            i2c_clk <= 0;
            buffer <= {1'b0, device, 1'b1,
                addr, 1'b1, data, 1'b1};
            state <= 2;
        end
        6'd58:   // send stop signal
        if (i2c_clk >= `CLKS_PER_BIT) begin
            if (scl) begin
                i2c_clk <= 0;
                buffer <= -1;
                state <= 6'd60;
            end
        end
        6'd60:   // wait before ready
        if (i2c_clk >= `CLKS_PER_BIT) begin
            state <= 0;
        end
        default: // send data
        if (i2c_clk >= `CLKS_PER_BIT) begin
            if (~state[0] && scl)
                buffer <= buffer << 1;
            if (~state[0] == scl) begin
                i2c_clk <= 0;
                state <= state + 1;
            end
        end
    endcase
end

endmodule
