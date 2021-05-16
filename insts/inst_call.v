// DO NOT EDIT -- auto-generated from insts/generate.py

module mfi_inst_call (
  input           mfi_valid,
  input  [31 : 0] mfi_inst,
  input  [31 : 0] mfi_pc_rdata,
  input  [31 : 0] mfi_mcr_rdata,
  input  [31 : 0] mfi_src1_rdata,
  input  [31 : 0] mfi_src2_rdata,
  input  [31 : 0] mfi_src3_rdata,
  input  [31 : 0] mfi_mem_rdata,

  output          spec_valid,
  output          spec_trap,
  output [ 3 : 0] spec_src1_addr,
  output [ 3 : 0] spec_src2_addr,
  output [ 3 : 0] spec_src3_addr,
  output [ 3 : 0] spec_dest_addr,
  output [31 : 0] spec_dest_wdata,
  output [31 : 0] spec_pc_wdata,
  output [31 : 0] spec_mcr_wdata,
  output [31 : 0] spec_mem_addr,
  output [ 3 : 0] spec_mem_rmask,
  output [ 3 : 0] spec_mem_wmask,
  output [31 : 0] spec_mem_wdata
);

  // branch instruction format
  wire [31:0] inst_padding = mfi_inst >> 32;
  wire [7:0] inst_opcode  = mfi_inst[31:24];
  wire [31:0] inst_offset = $signed(mfi_inst[23:0]);

  // CALL instruction
  wire cond = 1;
  wire [31:0] result = mfi_pc_rdata + 4 * inst_offset;
  wire [31:0] nextpc = cond ? result : mfi_pc_rdata + 4;
  wire [31:0] addr = mfi_src3_rdata - 4;
  assign spec_valid = mfi_valid && !inst_padding && inst_opcode == 8'b 10001000;
  assign spec_src3_addr = 15;
  assign spec_dest_addr = cond ? 15 : 0;
  assign spec_dest_wdata = cond ? addr : 0;
  assign spec_mem_addr = cond ? addr & ~3 : 0;
  assign spec_mem_wmask = cond ? 4'b1111 << (addr-spec_mem_addr) : 0;
  assign spec_mem_wdata = cond ? (mfi_pc_rdata + 4) << (8*(addr-spec_mem_addr)) : 0;
  assign spec_pc_wdata = nextpc;
  assign spec_mcr_wdata = mfi_mcr_rdata;
  assign spec_trap = cond && addr[1:0] != 0 || nextpc[1:0] != 0;

  // default assignments
  assign spec_src1_addr = 0;
  assign spec_src2_addr = 0;
  assign spec_mem_rmask = 0;
endmodule
