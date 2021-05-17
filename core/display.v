`default_nettype none

// adapted from Project F
module display (
    input clk, reset,
    output dvi_r,
    output dvi_g,
    output dvi_b,
    output dvi_c
);

// horizontal timings
localparam HA_END = 639;          // end of active pixels
localparam HS_STA = HA_END + 16;  // sync starts after front porch
localparam HS_END = HS_STA + 96;  // sync ends
localparam LINE   = 799;          // last pixel on line (after back porch)

// vertical timings
localparam VA_END = 479;          // end of active pixels
localparam VS_STA = VA_END + 10;  // sync starts after front porch
localparam VS_END = VS_STA + 2;   // sync ends
localparam SCREEN = 524;          // last line on screen (after back porch)

// screen position
reg [31:0] pix_clk;
reg [ 9:0] sx, sy;

always @(posedge clk) begin
    pix_clk <= pix_clk + 1;
    if (reset) begin
        pix_clk <= 0;
        sx <= 0;
        sy <= 0;
    end else
    if (pix_clk >= 9) begin
        pix_clk <= 0;
        sx <= sx + 1;
        if (sx == LINE) begin
            sx <= 0;
            sy <= (sy == SCREEN ? 0 : sy + 1);
        end
    end
end

// timing signals
wire de = (sx <= HA_END && sy <= VA_END);
wire hsync = ~(sx >= HS_STA && sx < HS_END);
wire vsync = ~(sx >= VS_STA && sx < VS_END);
wire [1:0] ctrl = {vsync, hsync};

// color data signals
wire [7:0] vga_r = !de ? 4'h0 : sx[4] ^ sy[4] ? 4'hf : 4'h0;
wire [7:0] vga_g = !de ? 4'h0 : sx[4] ^ sy[4] ? 4'h8 : 4'h8;
wire [7:0] vga_b = !de ? 4'h0 : sx[4] ^ sy[4] ? 4'h0 : 4'hf;

// tmds encoders
assign dvi_c = pix_clk > 4;

tmds_encoder tmds_r (
    .clk   (clk   ),
    .reset (reset ),
    .de    (de    ),
    .ctrl  (2'b00 ),
    .dec   (vga_r ),
    .enc   (dvi_r )
);

tmds_encoder tmds_g (
    .clk   (clk   ),
    .reset (reset ),
    .de    (de    ),
    .ctrl  (2'b00 ),
    .dec   (vga_g ),
    .enc   (dvi_g )
);

tmds_encoder tmds_b (
    .clk   (clk   ),
    .reset (reset ),
    .de    (de    ),
    .ctrl  (ctrl  ),
    .dec   (vga_b ),
    .enc   (dvi_b )
);

endmodule
