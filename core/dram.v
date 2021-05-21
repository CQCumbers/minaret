`default_nettype none

// see 4Gb_DDR3L.pdf revI
module dram_control (
    input  wire        clk,
    input  wire        clk_90,
    output reg  [14:0] dram_addr,
    output reg  [ 2:0] dram_bank,k
    inout  wire [15:0] dram_data,
    output wire        dram_casn,
    output reg         dram_cke,
    output reg         dram_clk,
    output wire        dram_csn,
    output wire [ 1:0] dram_mask,
    output wire [ 1:0] dram_stb,
    output wire        dram_odt,
    output wire        dram_rasn,
    output reg         dram_rstn,
    output wire        dram_wen,

    input  wire         valid,
    output reg          ready,
    input  wire [ 31:0] addr,
    input  wire         wmask,
    input  wire [127:0] wdata,
    output wire [127:0] rdata
);

// timings (10ns) - pg 80
localparam T_RST   = 20000;
localparam T_CKE   = 50000;
localparam T_RFC   = 54;
localparam T_MOD   = 24;
localparam T_ZQCL  = 1024;
localparam T_REFI  = 780;
localparam T_RCD   = 4;
localparam T_CAS   = 12;
localparam T_READ  = 18;
localparam T_WRITE = 30;

// commands - pg 113
localparam CMD_NOP     = 4'b0111;
localparam CMD_MRS     = 4'b0000;
localparam CMD_ZQCL    = 4'b0110;
localparam CMD_REFRESH = 4'b0001;
localparam CMD_ACTIVE  = 4'b0011;
localparam CMD_READ    = 4'b0101;
localparam CMD_WRITE   = 4'b0100;

// dram states
localparam S_INIT    = 0;
localparam S_MODE    = 1;
localparam S_IDLE    = 2;
localparam S_REFRESH = 3;
localparam S_ACTIVE  = 4;
localparam S_READ    = 5;
localparam S_WRITE   = 6;

// initial register vals
reg [  3:0] cmd      = CMD_NOP;
reg [  2:0] state    = S_INIT;
reg [127:0] dram_buf = 0;
reg [31 :0] dram_cnt = 0;
reg [31 :0] refr_cnt = 0;

initial begin
    ram_addr  = 15'h0000,
    dram_bank = 3'b000;
    dram_cke  = 1'b0;
    dram_clk  = 1'b0;
    dram_rstn = 1'b0;
    ready     = 1'b0;
end

// align address to 128 bits
wire [ 2:0] addr_bank = addr[28:26];
wire [14:0] addr_row =  addr[25:11];
wire [14:0] addr_col =  addr[10: 1] & ~15'h7;
wire writing = (state == S_WRITE && dram_cnt >= T_CAS-1);

// assign output wires
assign {dram_csn, dram_rasn, dram_casn, dram_wen} = cmd;
assign dram_data = writing ? dram_buf : 16'hZZ;
assign dram_stb  = writing ? clk_90   :  2'b00;
assign {dram_mask, dram_odt} = 3'b000;
assign rdata = dram_buf;

always @(posedge clk) begin
    // default assignments
    cmd <= CMD_NOP;
    ready <= 1'b0;
    dram_clk <= dram_clk ^ 1;
    dram_cnt <= dram_cnt + 1;
    refr_cnt <= refr_cnt + 1;
    // state machine
    case (state)
        S_INIT: begin
            // hold RST low 200us
            if (dram_cnt == T_RST) begin
                dram_rstn <= 1'b1;
            end
            // hold CKE low 500us
            if (dram_cnt == T_RST+T_CKE) begin
                dram_cke <= 1'b1;
            end
            // set MR2 CWL=6
            if (dram_cnt == T_RST+T_CKE+T_RFC) begin
                cmd <= CMD_MRS;
                dram_cnt <= 0;
                dram_bank <= 3'b010;
                dram_addr <= 15'h0008;
                state <= S_MODE;
            end
        end
        S_MODE: begin
            // set MR3 to zeros
            if (dram_cnt == T_MOD*1-1) begin
                cmd <= CMD_MRS;
                dram_bank <= 3'b011;
                dram_addr <= 15'h0000;
            end
            // set MR1 DLL=off
            if (dram_cnt == T_MOD*2-1) begin
                cmd <= CMD_MRS;
                dram_bank <= 3'b001;
                dram_addr <= 15'h0001;
            end
            // set MR0 CAS=6, WR=5
            if (dram_cnt == T_MOD*3-1) begin
                cmd <= CMD_MRS;
                dram_bank <= 3'b000;
                dram_addr <= 15'h0340;
            end
            // ZQ calibration
            if (dram_cnt == T_MOD*4-1) begin
                cmd <= CMD_ZQCL;
                dram_bank <= 3'b000;
                dram_addr <= 15'h0400;
            end
            // start in idle
            if (dram_cnt == T_MOD*4+T_ZQCL-1) begin
                cmd <= CMD_NOP;
                dram_cnt <= 0;
                state <= S_IDLE;
            end
        end
        S_IDLE: begin
            // refresh at avg interval
            if (refr_cnt >= T_REFI-1 && !dram_clk) begin
                cmd <= CMD_REFRESH;
                dram_cnt <= 0;
                refr_cnt <= 0;
                state <= S_REFRESH;
            end else
            // handle read/write reqs
            if (valid & !dram_clk) begin
                cmd <= CMD_ACTIVE;
                dram_bank <= addr_bank;
                dram_addr <= addr_row;
                dram_cnt <= 0;
                state <= S_ACTIVE;
            end
        end
        S_REFRESH: begin
            // wait for refresh
            if (dram_cnt >= T_RFC-1) begin
                state <= S_IDLE;
            end
        end
        S_ACTIVE: begin
            // activate address row
            if (dram_cnt >= T_RCD-1) begin
                dram_addr <= addr_col | 15'h0400;
                if (wmask) dram_buf <= wdata;
                dram_cnt <= 0;
                cmd <= wmask ? CMD_WRITE : CMD_READ;
                state <= wmask ? S_WRITE : S_READ;
            end
        end
        S_READ: begin
            // read 2 clks early (DLL off)
            if (dram_cnt >= T_READ-1) begin
                ready <= 1'b1;
                state <= S_IDLE;
            end else if (dram_cnt >= T_CAS-3) begin
                dram_buf <= {dram_data, dram_buf[127:16]};
            end
        end
        S_WRITE: begin
            // start shifts 1 clk late
            if (dram_cnt >= T_WRITE-1) begin
                ready <= 1'b1;
                state <= S_IDLE;
            end else if (dram_cnt >= T_CAS-0) begin
                dram_buf <= dram_buf >> 16;
            end
        end
    endcase
end

endmodule
