`default_nettype none
`define CLKS_PER_BIT 20

module i2c_master (
    input clk, reset,
    inout  scl,
    output sda,

    input       valid,
    output      ready,
    input [7:0] device,
    input [7:0] addr,
    input [7:0] data
);

reg [28:0] buffer;
reg [ 5:0] state;
reg [15:0] i2c_clk;

assign scl = ~state[ 0] ? 1'bz : 1'b0;
assign sda = buffer[28] ? 1'bz : 1'b0;
assign ready = state == 0;

always @(posedge clk) begin
    i2c_clk <= i2c_clk + 1;
    if (reset) begin
        i2c_clk <= 0;
        buffer <= -1;
        state <= 0;
    end else
    if (i2c_clk >= `CLKS_PER_BIT) begin
        i2c_clk <= 0;
        case (state)
            0: if (valid) begin
                // send start signal
                buffer <= {1'b0, device, 1'b1,
                    addr, 1'b1, data, 2'b10};
                state <= 2;
            end 
            60: begin
                // send stop signal
                buffer <= -1;
                state <= 0;
            end
            default: begin
                // wait for SCL to respond
                if (state[0] && ~scl)
                    buffer <= buffer << 1;
                if (state[0] == ~scl)
                    state <= state + 1;
            end
        endcase
    end
end

endmodule
