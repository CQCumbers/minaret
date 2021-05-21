`default_nettype none

// adapted from Project F
module display #(
    parameter CLKS_PER_PIX = 4
) (
    input wire         clk,
    inout wire         hdmi_i2c_scl,
    inout wire         hdmi_i2c_sda,
    output wire        hdmi_tx_pclk,
    output wire [23:0] hdmi_tx_data,
    output wire        hdmi_tx_de,
    output wire        hdmi_tx_hs,
    output wire        hdmi_tx_vs
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
reg [7:0] pix_cnt = 0;
reg [9:0] sx = 0;
reg [9:0] sy = 0;

always @(posedge clk) begin
    pix_cnt <= pix_cnt + 1;
    if (pix_cnt == CLKS_PER_PIX - 1) begin
        pix_cnt <= 0;
        sx <= sx + 1;
        if (sx == LINE) begin
            sx <= 0;
            sy <= (sy == SCREEN ? 0 : sy + 1);
        end
    end
end

// timing signals
wire de = (sx <= HA_END && sy <= VA_END);
wire hsync = !(sx >= HS_STA && sx < HS_END);
wire vsync = !(sx >= VS_STA && sx < VS_END);

assign hdmi_tx_pclk = sx[0];
assign hdmi_tx_de = de;
assign hdmi_tx_vs = vsync;
assign hdmi_tx_hs = hsync;

// color data signals
wire [7:0] vga_r = !de ? 8'h00 : sx[4] ^ sy[4] ? 8'hff : 8'h00;
wire [7:0] vga_g = !de ? 8'h00 : sx[4] ^ sy[4] ? 8'h80 : 8'h80;
wire [7:0] vga_b = !de ? 8'h00 : sx[4] ^ sy[4] ? 8'h00 : 8'hff;

assign hdmi_tx_data = {vga_r, vga_g, vga_b};

// configure over i2c
reg [ 3:0] cmd_idx  = 0;
reg [ 7:0] i2c_addr = 0;
reg [ 7:0] i2c_data = 0;
wire valid = cmd_idx < 13;
wire ready;

always @* begin
    case (cmd_idx)
        // fixed registers
        0:  {i2c_addr, i2c_data} = 16'h9803;
        1:  {i2c_addr, i2c_data} = 16'h9ae0;
        2:  {i2c_addr, i2c_data} = 16'h9c30;
        3:  {i2c_addr, i2c_data} = 16'h9d61;
        4:  {i2c_addr, i2c_data} = 16'ha2a4;
        5:  {i2c_addr, i2c_data} = 16'ha3a4;
        6:  {i2c_addr, i2c_data} = 16'he0d0;
        7:  {i2c_addr, i2c_data} = 16'hf900;
        // input/output video format
        8:  {i2c_addr, i2c_data} = 16'h1500;
        9:  {i2c_addr, i2c_data} = 16'h1670;
        10: {i2c_addr, i2c_data} = 16'h1846;
        // power control
        11: {i2c_addr, i2c_data} = 16'h4110;
        12: {i2c_addr, i2c_data} = 16'haf04;
        default: {i2c_addr, i2c_data} = 27'h9803;
    endcase
end

always @(posedge clk) begin
    if (ready & valid)
        cmd_idx <= cmd_idx + 1;
end

i2c_write hdmi_i2c (
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
