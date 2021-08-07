`default_nettype none

module keyboard (
    input  wire        clk,
    input  wire        ps2_data,
    input  wire        ps2_clk,
    input  wire        valid,
    output reg  [31:0] rdata
);

reg [9:0] d_buf = 0;
reg [5:0] d_sum = 32;
reg [5:0] c_sum = 32;
reg [3:0] state = 0;
reg old_clk = 1;
reg new_clk = 1;
reg data = 1;

reg [8:0] fifo [0:15];
reg [4:0] rptr = 0;
reg [4:0] wptr = 0;
reg [7:0] code = 0;
reg keyup = 0;

initial rdata = 0;
wire empty = rptr == wptr;

// receiver state machine
always @(posedge clk) begin
    old_clk <= new_clk;
    // debounce data
    if ( ps2_data & d_sum != 63) d_sum <= d_sum + 6'd1;
    if (!ps2_data & d_sum != 0 ) d_sum <= d_sum - 6'd1;
    if (d_sum == 63) data <= 1;
    if (d_sum ==  0) data <= 0;
    // debounce clock
    if ( ps2_clk & c_sum != 63) c_sum <= c_sum + 6'd1;
    if (!ps2_clk & c_sum != 0 ) c_sum <= c_sum - 6'd1;
    if (c_sum == 63) new_clk <= 1;
    if (c_sum ==  0) new_clk <= 0;
    // consume buffer on read
    if (valid) begin
        rdata[ 8:0] <= fifo[rptr[3:0]];
        rdata[31:9] <= {!empty, 6'h00};
        rptr <= rptr + !empty;
    end
    case (state)
        0: begin
            // wait for start bit
            if (data == 0) begin
                state <= 1;
            end
        end
        11: begin
            // translate scancode
            if (!new_clk & old_clk) begin
                state <= 12;
                case (d_buf[8:1])
                    8'hF0: keyup <= 1'b1;
                    8'h5a: code <= 8'h0d;  // return
                    8'h76: code <= 8'h1b;  // escape
                    8'h29: code <= 8'ha2;  // space
                    8'h14: code <= 8'ha3;  // ctrl
                    8'h12: code <= 8'hb6;  // lshift
                    8'h59: code <= 8'hb6;  // rshift
                    8'h6b: code <= 8'hac;  // left
                    8'h75: code <= 8'had;  // up
                    8'h74: code <= 8'hae;  // right
                    8'h72: code <= 8'haf;  // down
                    8'h0d: code <= 8'h09;  // tab
                    8'h0e: code <= 8'h60;  // `
                    8'h15: code <= 8'h71;  // q
                    8'h16: code <= 8'h31;  // 1
                    8'h1a: code <= 8'h7a;  // z
                    8'h1b: code <= 8'h73;  // s
                    8'h1c: code <= 8'h61;  // a
                    8'h1d: code <= 8'h77;  // w
                    8'h1e: code <= 8'h32;  // 2
                    8'h21: code <= 8'h63;  // c
                    8'h22: code <= 8'h78;  // x
                    8'h23: code <= 8'h64;  // d
                    8'h24: code <= 8'h65;  // e
                    8'h25: code <= 8'h34;  // 4
                    8'h26: code <= 8'h33;  // 3
                    8'h2a: code <= 8'h76;  // v
                    8'h2b: code <= 8'h66;  // f
                    8'h2c: code <= 8'h74;  // t
                    8'h2d: code <= 8'h72;  // r
                    8'h2e: code <= 8'h35;  // 5
                    8'h31: code <= 8'h6e;  // n
                    8'h32: code <= 8'h62;  // b
                    8'h33: code <= 8'h68;  // h
                    8'h34: code <= 8'h67;  // g
                    8'h35: code <= 8'h79;  // y
                    8'h36: code <= 8'h36;  // 6
                    8'h3a: code <= 8'h6d;  // m
                    8'h3b: code <= 8'h6a;  // j
                    8'h3c: code <= 8'h75;  // u
                    8'h3d: code <= 8'h37;  // 7
                    8'h3e: code <= 8'h38;  // 8
                    8'h41: code <= 8'h2c;  // ,
                    8'h42: code <= 8'h6b;  // k
                    8'h43: code <= 8'h69;  // i
                    8'h44: code <= 8'h6f;  // o
                    8'h45: code <= 8'h30;  // 0
                    8'h46: code <= 8'h39;  // 9
                    8'h49: code <= 8'h2e;  // .
                    8'h4a: code <= 8'h2f;  // /
                    8'h4b: code <= 8'h6c;  // l
                    8'h4c: code <= 8'h3b;  // ;
                    8'h4d: code <= 8'h70;  // p
                    8'h4e: code <= 8'h2d;  // -
                    8'h52: code <= 8'h27;  // '
                    8'h54: code <= 8'h5b;  // [
                    8'h55: code <= 8'h3d;  // =
                    8'h5b: code <= 8'h5d;  // ]
                    8'h5d: code <= 8'h5c;  // \
                    8'h66: code <= 8'h08;  // backspace
                    8'h71: code <= 8'h7f;  // delete
                    default: code <= 8'h2e;
                endcase
            end
        end
        12: begin
            // buffer received data
            state <= 0;
            if (code) begin
                {keyup, code} <= 0;
                fifo[wptr[3:0]] <= {keyup, code};
                wptr <= wptr + 5'd1;
            end
        end
        default: begin
            // sample on falling edge
            if (!new_clk & old_clk) begin
                d_buf <= {data, d_buf[9:1]};
                state <= state + 4'd1;
            end
        end
    endcase
end

endmodule
