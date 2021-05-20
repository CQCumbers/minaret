`default_nettype none

`define T_RST   20000
`define T_CKE   50000
`define T_RFC   54
`define T_MOD   22
`define T_ZQCL  1024
`define T_REFI  780
`define T_ACTV  4
`define T_CAS   10
`define T_READ  18
`define T_WRITE 22

// commands
`define CMD_NOP     4'b0111
`define CMD_MRS     4'b0000
`define CMD_ZQCL    4'b0110
`define CMD_REFRESH 4'b0001
`define CMD_ACTIVE  4'b0011
`define CMD_READ    4'b0101
`define CMD_WRITE   4'b0100

// states
`define S_INIT    3'b000
`define S_MODE    3'b001
`define S_IDLE    3'b010
`define S_REFRESH 3'b011
`define S_ACTIVE  3'b100
`define S_READ    3'b101
`define S_WRITE   3'b110

module dram_control (
    input clk, reset,
    output reg [14:0] dram_addr,
    output reg [ 2:0] dram_bank,
    inout      [15:0] dram_data,
    output            dram_casn,
    output reg        dram_cke,
    output reg        dram_clk,
    output            dram_csn,
    output     [ 1:0] dram_mask,
    output     [ 1:0] dram_stb,
    output reg        dram_odt,
    output            dram_rasn,
    output reg        dram_rstn,
    output            dram_wen,

    input              valid,
    output reg         ready,
    input      [ 31:0] addr,
    input              wmask,
    input      [127:0] wdata,
    output reg [127:0] rdata
);

reg [  3:0] cmd;
reg [  2:0] state;
reg [127:0] dram_buf;
reg [31 :0] dram_cnt;
reg [31 :0] refr_cnt;

reg clk_align;

// align address to 128 bits
wire [ 2:0] addr_bank = addr[28:26];
wire [14:0] addr_row =  addr[25:11];
wire [14:0] addr_col =  addr[10: 1] & ~14'h7;

assign {dram_csn, dram_rasn, dram_casn, dram_wen} = cmd;
assign dram_data = state == `S_WRITE && dram_cnt >= `T_CAS+2 ? dram_buf : 16'hZZ;
assign dram_stb =  state == `S_WRITE && dram_cnt >= `T_CAS-1 ? {2{clk_align}} : 2'b00;
assign dram_mask = 2'b00;

always @(negedge clk) begin
    clk_align <= dram_clk;
end

always @(posedge clk) begin
    cmd <= `CMD_NOP;
    ready <= 1'b0;
    dram_clk <= dram_clk ^ 1;
    dram_cnt <= dram_cnt + 1;
    refr_cnt <= refr_cnt + 1;
    if (reset) begin
        // see TN-41-07
        dram_rstn <= 1'b0;
        dram_cke <= 1'b0;
        dram_clk <= 1'b0;
        dram_cnt <= 0;
        refr_cnt <= 0;
        state <= `S_INIT;
    end else
    case (state)
        `S_INIT: begin
            // hold RST low 200us
            if (dram_cnt == `T_RST) begin
                dram_rstn <= 1'b1;
                dram_odt <= 1'b0;
            end
            // hold CKE low 500us
            if (dram_cnt == `T_RST+`T_CKE) begin
                dram_cke <= 1'b1;
            end
            // hold CKE high T_RFC
            if (dram_cnt == `T_RST+`T_CKE+`T_RFC) begin
                dram_cnt <= 0;
                state <= `S_MODE;
            end
        end
        `S_MODE: begin
            // set MR2 CWL=6
            if (dram_cnt == 0) begin
                cmd <= `CMD_MRS;
                dram_bank <= 3'b010;
                dram_addr <= 15'h0008;
            end
            // set MR3 to zeros
            if (dram_cnt == `T_MOD*1-1) begin
                cmd <= `CMD_MRS;
                dram_bank <= 3'b011;
                dram_addr <= 15'h0000;
            end
            // set MR1 DLL=off
            if (dram_cnt == `T_MOD*2-1) begin
                cmd <= `CMD_MRS;
                dram_bank <= 3'b001;
                dram_addr <= 15'h0001;
            end
            // set MR0 CAS=6, DLL reset
            if (dram_cnt == `T_MOD*3-1) begin
                cmd <= `CMD_MRS;
                dram_bank <= 3'b000;
                dram_addr <= 15'h0120;
            end
            // ZQ calibration
            if (dram_cnt == `T_MOD*4-1) begin
                cmd <= `CMD_ZQCL;
                dram_bank <= 3'b000;
                dram_addr <= 15'h0400;
            end
            // start in idle
            if (dram_cnt == `T_MOD*4+`T_ZQCL-1) begin
                cmd <= `CMD_NOP;
                dram_cnt <= 0;
                state <= `S_IDLE;
            end
        end
        `S_IDLE: begin
            // refresh at avg interval
            if (refr_cnt >= `T_REFI-1 && !dram_clk) begin
                cmd <= `CMD_REFRESH;
                dram_cnt <= 0;
                refr_cnt <= 0;
                state <= `S_REFRESH;
            end else
            // handle read/write reqs
            if (valid & !dram_clk) begin
                cmd <= `CMD_ACTIVE;
                dram_bank <= addr_bank;
                dram_addr <= addr_row;
                dram_cnt <= 0;
                state <= `S_ACTIVE;
            end
        end
        `S_REFRESH: begin
            // wait for refresh
            if (dram_cnt >= `T_RFC-1) begin
                dram_cnt <= 0;
                state <= `S_IDLE;
            end
        end
        `S_ACTIVE: begin
            // wait for active
            if (dram_cnt >= `T_ACTV-1) begin
                dram_addr <= addr_col | 15'h0400;
                if (wmask) dram_buf <= wdata;
                dram_cnt <= 0;
                cmd <= wmask ? `CMD_WRITE : `CMD_READ;
                state <= wmask ? `S_WRITE : `S_READ;
            end
        end
        `S_READ: begin
            // buffer read burst
            if (dram_cnt >= `T_CAS-1)
                dram_buf <= {dram_data, dram_buf[127:16]};
            if (dram_cnt >= `T_READ-1) begin
                rdata <= dram_buf;
                ready <= 1'b1;
                state <= `S_IDLE;
            end
        end
        `S_WRITE: begin
            // buffer write burst
            if (dram_cnt >= `T_CAS+2)
                dram_buf <= dram_buf >> 16;
            if (dram_cnt >= `T_WRITE-1) begin
                ready <= 1'b1;
                state <= `S_IDLE;
            end
        end
    endcase
end

endmodule
