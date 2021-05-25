`default_nettype none

module dram_test (
    input  wire        clk,
    output wire [14:0] dram_addr,
    output wire [ 2:0] dram_bank,
    inout  wire [15:0] dram_data,
    output wire        dram_casn,
    output wire        dram_cke,
    output wire        dram_clk,
    output wire        dram_csn,
    output wire [ 1:0] dram_mask,
    output wire [ 1:0] dram_stb,
    output wire        dram_odt,
    output wire        dram_rasn,
    output wire        dram_rstn,
    output wire        dram_wen
);

// Generate test pattern

reg valid = 1'b0;
reg wmask = 1'b0;
reg read  = 1'b0;
reg [127:0] count = 0;
reg [127:0] wdata = 0;
reg [ 31:0] addr  = 0;

wire ready;
wire [127:0] rdata;

always @(posedge clk) begin
    valid <= 1'b1;
    if (!read) begin
        wmask <= 1'b1;
        wdata <= count + 12345678;
        //wdata <= 128'h0123456789abcdefdeadbeefabad1dea;
        if (valid & ready) begin
            valid <= 1'b0;
            read  <= 1'b1;
        end
    end else begin
        wmask <= 1'b0;
        if (valid & ready) begin
            valid <= 1'b0;
            count <= rdata;
            read  <= 1'b0;
        end
    end
end

// Compute DRAM commands

wire dfi_wmask;
wire [31:0] dfi_rdata;
wire [31:0] dfi_wdata;

dram_control dram (
    .clk       (clk       ),
    .dfi_addr  (dram_addr ),
    .dfi_bank  (dram_bank ),
    .dfi_rdata (dfi_rdata ),
    .dfi_wdata (dfi_wdata ),
    .dfi_wmask (dfi_wmask ),
    .dfi_casn  (dram_casn ),
    .dfi_cke   (dram_cke  ),
    .dfi_csn   (dram_csn  ),
    .dfi_rasn  (dram_rasn ),
    .dfi_rstn  (dram_rstn ),
    .dfi_wen   (dram_wen  ),
    .valid     (valid     ),
    .ready     (ready     ),
    .addr      (addr      ),
    .wmask     (wmask     ),
    .wdata     (wdata     ),
    .rdata     (rdata     )
);

// Physical Interface

wire shift_clk;
wire [ 3:0] dfi_stb;
wire [15:0] dfi_oe = {16{dfi_wmask}};

pll dram_pll (
    .inclk0 (clk       ),
    .c0     (dram_clk  ),
    .c1     (shift_clk )
);

ddio dram_ddio (
    .inclock  (shift_clk ),
    .outclock (clk       ),
    .dout     (dfi_rdata ),
    .din      (dfi_wdata ),
    .pad_io   (dram_data ),
    .oe       (dfi_oe    )
);

assign dram_mask = 2'b00;
assign dram_odt  = 1'b0;
assign dram_stb[0] = dfi_wmask && shift_clk;
assign dram_stb[1] = dfi_wmask && shift_clk;

endmodule
