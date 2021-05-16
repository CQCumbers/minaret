// DO NOT EDIT -- auto-generated from insts/generate.py

module mfi_inst_cmpi.lo (
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

  // CMPI.LO instruction
  wire result = mfi_src1_rdata < inst_imms;
  assign spec_valid = mfi_valid && !inst_padding && inst_opcode == 8'b 00100001;
  assign spec_src1_addr = inst_src1;
  assign spec_mcr_wdata = {mfi_mcr_rdata[31:19], result, mfi_mcr_rdata[17:0]};
  assign spec_pc_wdata = mfi_pc_rdata + 4;

  // default assignments
  assign spec_src2_addr = 0;
  assign spec_src3_addr = 0;
  assign spec_dest_addr = 0;
  assign spec_dest_wdata = 0;
  assign spec_trap = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule
