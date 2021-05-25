`default_nettype none

// see 4Gb_DDR3L.pdf revI
module dram_control (
    input  wire        clk,
    output reg  [14:0] dfi_addr,
    output reg  [ 2:0] dfi_bank,
    input  wire [31:0] dfi_rdata,
    output wire [31:0] dfi_wdata,
    output reg         dfi_wmask,
    output wire        dfi_casn,
    output reg         dfi_cke,
    output wire        dfi_csn,
    output wire        dfi_rasn,
    output reg         dfi_rstn,
    output wire        dfi_wen,

    input  wire         valid,
    output reg          ready,
    input  wire [ 31:0] addr,
    input  wire         wmask,
    input  wire [127:0] wdata,
    output wire [127:0] rdata
);

// timings (10ns) - pg 80
localparam T_RST   = 10000;
localparam T_CKE   = 25000;
localparam T_RFC   = 27;
localparam T_MOD   = 12;
localparam T_ZQCL  = 512;
localparam T_REFI  = 390;
localparam T_RCD   = 2;
localparam T_CAS   = 6;
localparam T_READ  = 10;
localparam T_WRITE = 15;

// commands - pg 113
localparam CMD_NOP     = 4'b0111;
localparam CMD_MRS     = 4'b0000;
localparam CMD_ZQCL    = 4'b0110;
localparam CMD_REFRESH = 4'b0001;
localparam CMD_ACTIVE  = 4'b0011;
localparam CMD_READ    = 4'b0101;
localparam CMD_WRITE   = 4'b0100;

// dfi states
localparam S_INIT    = 0;
localparam S_MODE    = 1;
localparam S_IDLE    = 2;
localparam S_REFRESH = 3;
localparam S_ACTIVE  = 4;
localparam S_READ    = 5;
localparam S_WRITE   = 6;

// initial register vals
reg [  3:0] cmd       = CMD_NOP;
reg [  2:0] state     = S_INIT;
reg [127:0] dram_buf  = 0;
reg [  4:0] dram_cnt  = 0;
reg [ 19:0] refr_cnt  = 0;
reg         dfi_rmask = 0;

initial begin
    dfi_addr  = 15'h0000;
    dfi_bank  = 3'b000;
    dfi_cke   = 1'b0;
    dfi_rstn  = 1'b0;
	 dfi_wmask = 1'b0;
    ready     = 1'b0;
end

// align address to 128 bits
wire [ 2:0] addr_bank = addr[28:26];
wire [14:0] addr_row =  addr[25:11];
wire [14:0] addr_col =  addr[10: 1] & ~15'h7;

// assign output wires
assign {dfi_csn, dfi_rasn, dfi_casn, dfi_wen} = cmd;
assign dfi_wdata = dram_buf[31:0];
assign rdata = dram_buf;

always @(posedge clk) begin
    // default assignments
    cmd <= CMD_NOP;
    ready <= 1'b0;
    dram_cnt <= dram_cnt + 1;
    refr_cnt <= refr_cnt + 1;
    // state machine
    case (state)
        S_INIT: begin
            // hold RST low 200us
            if (refr_cnt == T_RST) begin
                dfi_rstn <= 1'b1;
            end
            // hold CKE low 500us
            if (refr_cnt == T_RST+T_CKE) begin
                dfi_cke <= 1'b1;
            end
            // set MR2 CWL=6
            if (refr_cnt == T_RST+T_CKE+T_RFC) begin
                cmd <= CMD_MRS;
                refr_cnt <= 0;
                dfi_bank <= 3'b010;
                dfi_addr <= 15'h0008;
                state <= S_MODE;
            end
        end
        S_MODE: begin
            // set MR3 to zeros
            if (refr_cnt == T_MOD*1-1) begin
                cmd <= CMD_MRS;
                dfi_bank <= 3'b011;
                dfi_addr <= 15'h0000;
            end
            // set MR1 DLL=off
            if (refr_cnt == T_MOD*2-1) begin
                cmd <= CMD_MRS;
                dfi_bank <= 3'b001;
                dfi_addr <= 15'h0001;
            end
            // set MR0 CAS=6, WR=5
            if (refr_cnt == T_MOD*3-1) begin
                cmd <= CMD_MRS;
                dfi_bank <= 3'b000;
                dfi_addr <= 15'h0310;
            end
            // ZQ calibration
            if (refr_cnt == T_MOD*4-1) begin
                cmd <= CMD_ZQCL;
                dfi_bank <= 3'b000;
                dfi_addr <= 15'h0400;
            end
            // start in idle
            if (refr_cnt == T_MOD*4+T_ZQCL-1) begin
                cmd <= CMD_NOP;
                refr_cnt <= 0;
                state <= S_IDLE;
            end
        end
        S_IDLE: begin
            // refresh at avg interval
            if (refr_cnt >= T_REFI-1) begin
                cmd <= CMD_REFRESH;
                dram_cnt <= 0;
                refr_cnt <= 0;
                state <= S_REFRESH;
            end else
            // handle read/write reqs
            if (valid) begin
                cmd <= CMD_ACTIVE;
                dfi_bank <= addr_bank;
                dfi_addr <= addr_row;
                dram_cnt <= 0;
                state <= S_ACTIVE;
            end
        end
        S_REFRESH: begin
            // wait for refresh
            if (dram_cnt == T_RFC-1) begin
                state <= S_IDLE;
            end
        end
        S_ACTIVE: begin
            // activate address row
            if (dram_cnt == T_RCD-1) begin
                dfi_addr <= addr_col | 15'h0400;
                if (wmask) dram_buf <= wdata;
                dram_cnt <= 0;
                cmd <= wmask ? CMD_WRITE : CMD_READ;
                state <= wmask ? S_WRITE : S_READ;
            end
        end
        S_READ: begin
            // read dram to buffer
            if (dram_cnt == T_READ-1) begin
				    dfi_rmask <= 1'b0;
                ready <= 1'b1;
                state <= S_IDLE;
            end
				if (dram_cnt == T_CAS-1) begin
				    dfi_rmask <= 1'b1;
				end else if (dfi_rmask) begin
                dram_buf <= {dfi_rdata, dram_buf[127:32]};
			   end
        end
        S_WRITE: begin
            // write buffer to dram
            if (dram_cnt == T_WRITE-1) begin
				    dfi_wmask <= 1'b0;
                ready <= 1'b1;
                state <= S_IDLE;
            end
				if (dram_cnt == T_CAS-1) begin
				    dfi_wmask <= 1'b1;
				end else if (dfi_wmask) begin
                dram_buf <= dram_buf[127:32];
				end
        end
    endcase
end

endmodule
