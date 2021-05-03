// DO NOT EDIT -- auto-generated from insts/generate.py

module mfi_isa_m32 (
  input           mfi_valid,
  input  [31 : 0] mfi_inst,
  input  [31 : 0] mfi_pc_rdata,
  input  [31 : 0] mfi_src1_rdata,
  input  [31 : 0] mfi_src2_rdata,
  input  [31 : 0] mfi_mem_rdata,

  output          spec_valid,
  output          spec_trap,
  output [ 3 : 0] spec_src1_addr,
  output [ 3 : 0] spec_src2_addr,
  output [ 3 : 0] spec_dest_addr,
  output [31 : 0] spec_dest_wdata,
  output [31 : 0] spec_pc_wdata,
  output [31 : 0] spec_mem_addr,
  output [ 3 : 0] spec_mem_rmask,
  output [ 3 : 0] spec_mem_wmask,
  output [31 : 0] spec_mem_wdata
);
  wire          spec_inst_add_valid;
  wire          spec_inst_add_trap;
  wire [ 3 : 0] spec_inst_add_src1_addr;
  wire [ 3 : 0] spec_inst_add_src2_addr;
  wire [ 3 : 0] spec_inst_add_dest_addr;
  wire [31 : 0] spec_inst_add_dest_wdata;
  wire [31 : 0] spec_inst_add_pc_wdata;
  wire [31 : 0] spec_inst_add_mem_addr;
  wire [ 3 : 0] spec_inst_add_mem_rmask;
  wire [ 3 : 0] spec_inst_add_mem_wmask;
  wire [31 : 0] spec_inst_add_mem_wdata;

  mfi_inst_add inst_add (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_add_valid),
    .spec_trap(spec_inst_add_trap),
    .spec_src1_addr(spec_inst_add_src1_addr),
    .spec_src2_addr(spec_inst_add_src2_addr),
    .spec_dest_addr(spec_inst_add_dest_addr),
    .spec_dest_wdata(spec_inst_add_dest_wdata),
    .spec_pc_wdata(spec_inst_add_pc_wdata),
    .spec_mem_addr(spec_inst_add_mem_addr),
    .spec_mem_rmask(spec_inst_add_mem_rmask),
    .spec_mem_wmask(spec_inst_add_mem_wmask),
    .spec_mem_wdata(spec_inst_add_mem_wdata)
  );

  wire          spec_inst_and_valid;
  wire          spec_inst_and_trap;
  wire [ 3 : 0] spec_inst_and_src1_addr;
  wire [ 3 : 0] spec_inst_and_src2_addr;
  wire [ 3 : 0] spec_inst_and_dest_addr;
  wire [31 : 0] spec_inst_and_dest_wdata;
  wire [31 : 0] spec_inst_and_pc_wdata;
  wire [31 : 0] spec_inst_and_mem_addr;
  wire [ 3 : 0] spec_inst_and_mem_rmask;
  wire [ 3 : 0] spec_inst_and_mem_wmask;
  wire [31 : 0] spec_inst_and_mem_wdata;

  mfi_inst_and inst_and (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_and_valid),
    .spec_trap(spec_inst_and_trap),
    .spec_src1_addr(spec_inst_and_src1_addr),
    .spec_src2_addr(spec_inst_and_src2_addr),
    .spec_dest_addr(spec_inst_and_dest_addr),
    .spec_dest_wdata(spec_inst_and_dest_wdata),
    .spec_pc_wdata(spec_inst_and_pc_wdata),
    .spec_mem_addr(spec_inst_and_mem_addr),
    .spec_mem_rmask(spec_inst_and_mem_rmask),
    .spec_mem_wmask(spec_inst_and_mem_wmask),
    .spec_mem_wdata(spec_inst_and_mem_wdata)
  );

  wire          spec_inst_ld_valid;
  wire          spec_inst_ld_trap;
  wire [ 3 : 0] spec_inst_ld_src1_addr;
  wire [ 3 : 0] spec_inst_ld_src2_addr;
  wire [ 3 : 0] spec_inst_ld_dest_addr;
  wire [31 : 0] spec_inst_ld_dest_wdata;
  wire [31 : 0] spec_inst_ld_pc_wdata;
  wire [31 : 0] spec_inst_ld_mem_addr;
  wire [ 3 : 0] spec_inst_ld_mem_rmask;
  wire [ 3 : 0] spec_inst_ld_mem_wmask;
  wire [31 : 0] spec_inst_ld_mem_wdata;

  mfi_inst_ld inst_ld (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_ld_valid),
    .spec_trap(spec_inst_ld_trap),
    .spec_src1_addr(spec_inst_ld_src1_addr),
    .spec_src2_addr(spec_inst_ld_src2_addr),
    .spec_dest_addr(spec_inst_ld_dest_addr),
    .spec_dest_wdata(spec_inst_ld_dest_wdata),
    .spec_pc_wdata(spec_inst_ld_pc_wdata),
    .spec_mem_addr(spec_inst_ld_mem_addr),
    .spec_mem_rmask(spec_inst_ld_mem_rmask),
    .spec_mem_wmask(spec_inst_ld_mem_wmask),
    .spec_mem_wdata(spec_inst_ld_mem_wdata)
  );

  wire          spec_inst_or_valid;
  wire          spec_inst_or_trap;
  wire [ 3 : 0] spec_inst_or_src1_addr;
  wire [ 3 : 0] spec_inst_or_src2_addr;
  wire [ 3 : 0] spec_inst_or_dest_addr;
  wire [31 : 0] spec_inst_or_dest_wdata;
  wire [31 : 0] spec_inst_or_pc_wdata;
  wire [31 : 0] spec_inst_or_mem_addr;
  wire [ 3 : 0] spec_inst_or_mem_rmask;
  wire [ 3 : 0] spec_inst_or_mem_wmask;
  wire [31 : 0] spec_inst_or_mem_wdata;

  mfi_inst_or inst_or (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_or_valid),
    .spec_trap(spec_inst_or_trap),
    .spec_src1_addr(spec_inst_or_src1_addr),
    .spec_src2_addr(spec_inst_or_src2_addr),
    .spec_dest_addr(spec_inst_or_dest_addr),
    .spec_dest_wdata(spec_inst_or_dest_wdata),
    .spec_pc_wdata(spec_inst_or_pc_wdata),
    .spec_mem_addr(spec_inst_or_mem_addr),
    .spec_mem_rmask(spec_inst_or_mem_rmask),
    .spec_mem_wmask(spec_inst_or_mem_wmask),
    .spec_mem_wdata(spec_inst_or_mem_wdata)
  );

  wire          spec_inst_st_valid;
  wire          spec_inst_st_trap;
  wire [ 3 : 0] spec_inst_st_src1_addr;
  wire [ 3 : 0] spec_inst_st_src2_addr;
  wire [ 3 : 0] spec_inst_st_dest_addr;
  wire [31 : 0] spec_inst_st_dest_wdata;
  wire [31 : 0] spec_inst_st_pc_wdata;
  wire [31 : 0] spec_inst_st_mem_addr;
  wire [ 3 : 0] spec_inst_st_mem_rmask;
  wire [ 3 : 0] spec_inst_st_mem_wmask;
  wire [31 : 0] spec_inst_st_mem_wdata;

  mfi_inst_st inst_st (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_st_valid),
    .spec_trap(spec_inst_st_trap),
    .spec_src1_addr(spec_inst_st_src1_addr),
    .spec_src2_addr(spec_inst_st_src2_addr),
    .spec_dest_addr(spec_inst_st_dest_addr),
    .spec_dest_wdata(spec_inst_st_dest_wdata),
    .spec_pc_wdata(spec_inst_st_pc_wdata),
    .spec_mem_addr(spec_inst_st_mem_addr),
    .spec_mem_rmask(spec_inst_st_mem_rmask),
    .spec_mem_wmask(spec_inst_st_mem_wmask),
    .spec_mem_wdata(spec_inst_st_mem_wdata)
  );

  wire          spec_inst_sub_valid;
  wire          spec_inst_sub_trap;
  wire [ 3 : 0] spec_inst_sub_src1_addr;
  wire [ 3 : 0] spec_inst_sub_src2_addr;
  wire [ 3 : 0] spec_inst_sub_dest_addr;
  wire [31 : 0] spec_inst_sub_dest_wdata;
  wire [31 : 0] spec_inst_sub_pc_wdata;
  wire [31 : 0] spec_inst_sub_mem_addr;
  wire [ 3 : 0] spec_inst_sub_mem_rmask;
  wire [ 3 : 0] spec_inst_sub_mem_wmask;
  wire [31 : 0] spec_inst_sub_mem_wdata;

  mfi_inst_sub inst_sub (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_sub_valid),
    .spec_trap(spec_inst_sub_trap),
    .spec_src1_addr(spec_inst_sub_src1_addr),
    .spec_src2_addr(spec_inst_sub_src2_addr),
    .spec_dest_addr(spec_inst_sub_dest_addr),
    .spec_dest_wdata(spec_inst_sub_dest_wdata),
    .spec_pc_wdata(spec_inst_sub_pc_wdata),
    .spec_mem_addr(spec_inst_sub_mem_addr),
    .spec_mem_rmask(spec_inst_sub_mem_rmask),
    .spec_mem_wmask(spec_inst_sub_mem_wmask),
    .spec_mem_wdata(spec_inst_sub_mem_wdata)
  );

  assign spec_valid =
		spec_inst_add_valid ? spec_inst_add_valid :
		spec_inst_and_valid ? spec_inst_and_valid :
		spec_inst_ld_valid ? spec_inst_ld_valid :
		spec_inst_or_valid ? spec_inst_or_valid :
		spec_inst_st_valid ? spec_inst_st_valid :
		spec_inst_sub_valid ? spec_inst_sub_valid : 0;
  assign spec_trap =
		spec_inst_add_valid ? spec_inst_add_trap :
		spec_inst_and_valid ? spec_inst_and_trap :
		spec_inst_ld_valid ? spec_inst_ld_trap :
		spec_inst_or_valid ? spec_inst_or_trap :
		spec_inst_st_valid ? spec_inst_st_trap :
		spec_inst_sub_valid ? spec_inst_sub_trap : 0;
  assign spec_src1_addr =
		spec_inst_add_valid ? spec_inst_add_src1_addr :
		spec_inst_and_valid ? spec_inst_and_src1_addr :
		spec_inst_ld_valid ? spec_inst_ld_src1_addr :
		spec_inst_or_valid ? spec_inst_or_src1_addr :
		spec_inst_st_valid ? spec_inst_st_src1_addr :
		spec_inst_sub_valid ? spec_inst_sub_src1_addr : 0;
  assign spec_src2_addr =
		spec_inst_add_valid ? spec_inst_add_src2_addr :
		spec_inst_and_valid ? spec_inst_and_src2_addr :
		spec_inst_ld_valid ? spec_inst_ld_src2_addr :
		spec_inst_or_valid ? spec_inst_or_src2_addr :
		spec_inst_st_valid ? spec_inst_st_src2_addr :
		spec_inst_sub_valid ? spec_inst_sub_src2_addr : 0;
  assign spec_dest_addr =
		spec_inst_add_valid ? spec_inst_add_dest_addr :
		spec_inst_and_valid ? spec_inst_and_dest_addr :
		spec_inst_ld_valid ? spec_inst_ld_dest_addr :
		spec_inst_or_valid ? spec_inst_or_dest_addr :
		spec_inst_st_valid ? spec_inst_st_dest_addr :
		spec_inst_sub_valid ? spec_inst_sub_dest_addr : 0;
  assign spec_dest_wdata =
		spec_inst_add_valid ? spec_inst_add_dest_wdata :
		spec_inst_and_valid ? spec_inst_and_dest_wdata :
		spec_inst_ld_valid ? spec_inst_ld_dest_wdata :
		spec_inst_or_valid ? spec_inst_or_dest_wdata :
		spec_inst_st_valid ? spec_inst_st_dest_wdata :
		spec_inst_sub_valid ? spec_inst_sub_dest_wdata : 0;
  assign spec_pc_wdata =
		spec_inst_add_valid ? spec_inst_add_pc_wdata :
		spec_inst_and_valid ? spec_inst_and_pc_wdata :
		spec_inst_ld_valid ? spec_inst_ld_pc_wdata :
		spec_inst_or_valid ? spec_inst_or_pc_wdata :
		spec_inst_st_valid ? spec_inst_st_pc_wdata :
		spec_inst_sub_valid ? spec_inst_sub_pc_wdata : 0;
  assign spec_mem_addr =
		spec_inst_add_valid ? spec_inst_add_mem_addr :
		spec_inst_and_valid ? spec_inst_and_mem_addr :
		spec_inst_ld_valid ? spec_inst_ld_mem_addr :
		spec_inst_or_valid ? spec_inst_or_mem_addr :
		spec_inst_st_valid ? spec_inst_st_mem_addr :
		spec_inst_sub_valid ? spec_inst_sub_mem_addr : 0;
  assign spec_mem_rmask =
		spec_inst_add_valid ? spec_inst_add_mem_rmask :
		spec_inst_and_valid ? spec_inst_and_mem_rmask :
		spec_inst_ld_valid ? spec_inst_ld_mem_rmask :
		spec_inst_or_valid ? spec_inst_or_mem_rmask :
		spec_inst_st_valid ? spec_inst_st_mem_rmask :
		spec_inst_sub_valid ? spec_inst_sub_mem_rmask : 0;
  assign spec_mem_wmask =
		spec_inst_add_valid ? spec_inst_add_mem_wmask :
		spec_inst_and_valid ? spec_inst_and_mem_wmask :
		spec_inst_ld_valid ? spec_inst_ld_mem_wmask :
		spec_inst_or_valid ? spec_inst_or_mem_wmask :
		spec_inst_st_valid ? spec_inst_st_mem_wmask :
		spec_inst_sub_valid ? spec_inst_sub_mem_wmask : 0;
  assign spec_mem_wdata =
		spec_inst_add_valid ? spec_inst_add_mem_wdata :
		spec_inst_and_valid ? spec_inst_and_mem_wdata :
		spec_inst_ld_valid ? spec_inst_ld_mem_wdata :
		spec_inst_or_valid ? spec_inst_or_mem_wdata :
		spec_inst_st_valid ? spec_inst_st_mem_wdata :
		spec_inst_sub_valid ? spec_inst_sub_mem_wdata : 0;
endmodule
