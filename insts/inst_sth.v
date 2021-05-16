// DO NOT EDIT -- auto-generated from insts/generate.py

module mfi_inst_sth (
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

  // immediate instruction format
  wire [31:0] inst_padding = mfi_inst >> 32;
  wire [7:0] inst_opcode = mfi_inst[31:24];
  wire [3:0] inst_src1   = mfi_inst[23:20];
  wire [3:0] inst_shift  = mfi_inst[19:16];
  wire [3:0] inst_dest   = mfi_inst[15:12];
  wire [11:0] inst_imm   = mfi_inst[11: 0];
  wire [31:0] inst_imms  = $signed(inst_imm) << inst_shift;

  // STH instruction
  wire [31:0] addr = mfi_src1_rdata + 2 * inst_imms;
  assign spec_valid = mfi_valid && !inst_padding && inst_opcode == 8'b 01000100;
  assign spec_src1_addr = inst_src1;
  assign spec_src3_addr = inst_dest;
  assign spec_mem_addr = addr & ~(2-1);
  assign spec_mem_wmask = ((1 << 2)-1) << (addr-spec_mem_addr);
  assign spec_mem_wdata = mfi_src3_rdata << (8*(addr-spec_mem_addr));
  assign spec_pc_wdata = mfi_pc_rdata + 4;
  assign spec_mcr_wdata = mfi_mcr_rdata;
  assign spec_trap = (addr & (2-1)) != 0;

  // default assignments
  assign spec_src2_addr = 0;
  assign spec_dest_addr = 0;
  assign spec_dest_wdata = 0;
  assign spec_mem_rmask = 0;
endmodule
