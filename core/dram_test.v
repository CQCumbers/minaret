`default_nettype none

module dram_test (
    input  wire        clk_in,
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

reg valid = 1'b0;
reg wmask = 1'b0;
reg read  = 1'b0;
reg [127:0] counter = 0;
reg [127:0] wdata   = 0;

wire ready;
wire [127:0] rdata;
wire [ 31:0] addr = 0;

// 100 MHz from 50 MHz
wire clk, clk_90;
pll dram_pll (
    .inclk0 (clk_in ),
    .c0     (clk    ),
    .c1     (clk_90 )
);

// alternate reads/writes
always @(posedge clk) begin
    valid <= 1'b1;
    if (!read) begin
        wmask <= 1'b1;
        //wdata <= counter + 12345678;
        wdata <= 128'h0123456789abcdefdeadbeefabad1dea;
        if (valid & ready) begin
            valid <= 1'b0;
            read <= 1'b1;
        end
    end else begin
        wmask <= 1'b0;
        if (valid & ready) begin
            valid <= 1'b0;
            counter <= rdata;
            read <= 1'b0;
        end
    end
end

dram_control dram (
    .clk       (clk       ),
    .clk_90    (clk_90    ),
    .dram_addr (dram_addr ),
    .dram_bank (dram_bank ),
    .dram_data (dram_data ),
    .dram_casn (dram_casn ),
    .dram_cke  (dram_cke  ),
    .dram_clk  (dram_clk  ),
    .dram_csn  (dram_csn  ),
    .dram_mask (dram_mask ),
    .dram_stb  (dram_stb  ),
    .dram_odt  (dram_odt  ),
    .dram_rasn (dram_rasn ),
    .dram_rstn (dram_rstn ),
    .dram_wen  (dram_wen  ),
    .valid     (valid     ),
    .ready     (ready     ),
    .addr      (addr      ),
    .wmask     (wmask     ),
    .wdata     (wdata     ),
    .rdata     (rdata     )
);

endmodule
