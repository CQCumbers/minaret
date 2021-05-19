module dram_test (
    input clk, reset,
    output [14:0] dram_addr,
    output [ 2:0] dram_bank,
    inout  [15:0] dram_data,
    output        dram_casn,
    output        dram_cke,
    output        dram_clk,
    output        dram_csn,
    output [ 1:0] dram_mask,
    inout  [ 1:0] dram_stb,
    output        dram_odt,
    output        dram_rasn,
    output        dram_rstn,
    output        dram_wen
);

reg valid;
reg wmask;
reg read;
reg [31:0] addr;
reg [31:0] counter;

wire ready;
reg  [127:0] wdata;
wire [127:0] rdata;

// alternate reads/writes
always @(posedge clk) begin
    if (reset) begin
        valid <= 1'b0;
        read  <= 1'b0;
        counter <= 0;
    end else begin
        valid <= 1'b1;
        addr <= 32'h00000100;
        if (!read) begin
            wmask <= 1'b1;
            wdata <= counter + 1;
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
end

dram_control dram (
    .clk       (clk       ),
    .reset     (reset     ),
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
