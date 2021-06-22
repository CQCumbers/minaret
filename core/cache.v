`default_nettype none

// direct-mapped cache
module cache_control (
    input  wire         clk,
    input  wire         valid,
    output reg          ready,
    input  wire [ 31:0] addr,
    input  wire [  3:0] wmask,
    input  wire [ 31:0] wdata,
    output reg  [ 31:0] rdata,
    output reg          mem_valid,
    input  wire         mem_ready,
    output reg  [ 31:0] mem_addr,
    output reg          mem_wmask,
    output reg  [127:0] mem_wdata,
    input  wire [127:0] mem_rdata
);

// cache states
localparam S_IDLE  = 0;
localparam S_FIND  = 1;
localparam S_FLUSH = 2;
localparam S_ALLOC = 3;
localparam S_READ  = 4;
localparam S_WRITE = 5;

// initial register vals
reg [2:0] state = S_IDLE;
reg [1023:0] dirty = {1024{1'b0}};

reg  cram_wen = 0;
reg  [ 17:0] cram_wmask = { 18{1'b0}};
reg  [143:0] cram_wdata = {144{1'b0}};
wire [  9:0] cram_addr = idx;
wire [143:0] cram_rdata;

cram cram (
    .address (cram_addr  ),
    .byteena (cram_wmask ),
    .clock   (clk        ),
    .data    (cram_wdata ),
    .wren    (cram_wen   ),
    .q       (cram_rdata )
);

initial begin
    rdata <= 0;
    ready <= 0;
    mem_valid <= 0;
    mem_addr  <= 0;
    mem_wmask <= 0;
    mem_wdata <= 0;
end

// decode address
wire [15:0] tag = addr[29:14];
wire [ 9:0] idx = addr[13: 4];
wire [ 6:0] off = addr[ 3: 0] << 3;

wire [ 15:0] ctag  = cram_rdata[143:128];
wire [127:0] cdata = cram_rdata[127:  0];

always @(posedge clk) begin
    case (state)
        S_IDLE: begin
            ready <= 1'b0;
            cram_wen <= 1'b0;
            state <= valid ? S_FIND : S_IDLE;
        end
        S_FIND: begin
            state <= dirty[idx] ? S_FLUSH : S_ALLOC;
            if (tag == ctag) begin
                state <= wmask ? S_WRITE : S_READ;
            end
        end
        S_FLUSH: begin
            mem_valid <= 1'b1;
            mem_addr <= {ctag, idx, 4'b0000};
            mem_wmask <= 1'b1;
            mem_wdata <= cdata;
            if (mem_valid & mem_ready) begin
                mem_valid  <= 1'b0;
					 dirty[idx] <= 1'b0;
                state <= S_ALLOC;
            end
        end
        S_ALLOC: begin
            mem_valid <= 1'b1;
            mem_addr  <= {tag, idx, 4'b0000};
            mem_wmask <= 1'b0;
            if (mem_valid & mem_ready) begin
                mem_valid <= 1'b0;
                cram_wen <= 1'b1;
                cram_wmask <= {17{1'b1}};
                cram_wdata <= {tag, mem_rdata};
                state <= wmask ? S_WRITE : S_READ;
            end
        end
        S_READ: begin
            ready <= 1'b1;
            rdata <= cdata >> off;
            state <= S_IDLE;
        end
        S_WRITE: begin
            cram_wen <= 1'b1;
            cram_wmask <= wmask << addr[3:0];
            cram_wdata <= wdata << off;
            dirty[idx] <= 1'b1;
            ready <= 1'b1;
            state <= S_IDLE;
        end
    endcase
end

endmodule
