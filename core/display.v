`default_nettype none

// adapted from Project F
module display (
    input clk, reset,
    inout hdmi_i2c_scl,
    inout hdmi_i2c_sda,

    output        hdmi_tx_pclk,
    output [23:0] hdmi_tx_data,
    output        hdmi_tx_de,
    output        hdmi_tx_hs,
    output        hdmi_tx_vs
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
reg [15:0] pix_clk;
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

// color data signals
wire [7:0] vga_r = !de ? 4'h0 : sx[4] ^ sy[4] ? 4'hf : 4'h0;
wire [7:0] vga_g = !de ? 4'h0 : sx[4] ^ sy[4] ? 4'h8 : 4'h8;
wire [7:0] vga_b = !de ? 4'h0 : sx[4] ^ sy[4] ? 4'h0 : 4'hf;

// connect video generator
assign hdmi_tx_pclk = pix_clk > 4;
assign hdmi_tx_data = {vga_r, vga_g, vga_b};
assign hdmi_tx_de = de;
assign {hdmi_tx_vs, hdmi_tx_hs} = {vsync, hsync};

// configure over i2c
reg [3:0] cmd_idx;
reg [7:0] i2c_addr;
reg [7:0] i2c_data;
wire valid = cmd_idx < 10;
wire ready;

always @* begin
    case (cmd_idx)
        // fixed registers
         0: {i2c_addr, i2c_data} = 16'h9803;
         1: {i2c_addr, i2c_data} = 16'h9ae0;
         2: {i2c_addr, i2c_data} = 16'h9c30;
         3: {i2c_addr, i2c_data} = 16'h9d61;
         4: {i2c_addr, i2c_data} = 16'ha2a4;
         5: {i2c_addr, i2c_data} = 16'ha3a4;
         6: {i2c_addr, i2c_data} = 16'he0d0;
         7: {i2c_addr, i2c_data} = 16'hf900;
        // input/output video format
         8: {i2c_addr, i2c_data} = 16'h1500;
         9: {i2c_addr, i2c_data} = 16'h1630;
    endcase
end

always @(posedge clk) begin
    cmd_idx <= cmd_idx + ready;
    if (reset) cmd_idx <= 0;
end

i2c_master controller (
    .clk    (clk          ),
    .reset  (reset        ),
    .scl    (hdmi_i2c_scl ),
    .sda    (hdmi_i2c_sda ),
    .valid  (valid        ),
    .ready  (ready        ),
    .device (8'h72        ),
    .addr   (i2c_addr     ),
    .data   (i2c_data     )
);

endmodule
