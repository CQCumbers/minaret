// DO NOT EDIT -- auto-generated from insts/generate.py

module mfi_isa_m32 (
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
  wire          spec_inst_add_valid;
  wire          spec_inst_add_trap;
  wire [ 3 : 0] spec_inst_add_src1_addr;
  wire [ 3 : 0] spec_inst_add_src2_addr;
  wire [ 3 : 0] spec_inst_add_src3_addr;
  wire [ 3 : 0] spec_inst_add_dest_addr;
  wire [31 : 0] spec_inst_add_dest_wdata;
  wire [31 : 0] spec_inst_add_pc_wdata;
  wire [ 3 : 0] spec_inst_add_mcr_wmask;
  wire [31 : 0] spec_inst_add_mcr_wdata;
  wire [31 : 0] spec_inst_add_mem_addr;
  wire [ 3 : 0] spec_inst_add_mem_rmask;
  wire [ 3 : 0] spec_inst_add_mem_wmask;
  wire [31 : 0] spec_inst_add_mem_wdata;

  mfi_inst_add inst_add (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_add_valid),
    .spec_trap(spec_inst_add_trap),
    .spec_src1_addr(spec_inst_add_src1_addr),
    .spec_src2_addr(spec_inst_add_src2_addr),
    .spec_src3_addr(spec_inst_add_src3_addr),
    .spec_dest_addr(spec_inst_add_dest_addr),
    .spec_dest_wdata(spec_inst_add_dest_wdata),
    .spec_pc_wdata(spec_inst_add_pc_wdata),
    .spec_mcr_wdata(spec_inst_add_mcr_wdata)
    .spec_mem_addr(spec_inst_add_mem_addr),
    .spec_mem_rmask(spec_inst_add_mem_rmask),
    .spec_mem_wmask(spec_inst_add_mem_wmask),
    .spec_mem_wdata(spec_inst_add_mem_wdata)
  );

  wire          spec_inst_addi_valid;
  wire          spec_inst_addi_trap;
  wire [ 3 : 0] spec_inst_addi_src1_addr;
  wire [ 3 : 0] spec_inst_addi_src2_addr;
  wire [ 3 : 0] spec_inst_addi_src3_addr;
  wire [ 3 : 0] spec_inst_addi_dest_addr;
  wire [31 : 0] spec_inst_addi_dest_wdata;
  wire [31 : 0] spec_inst_addi_pc_wdata;
  wire [ 3 : 0] spec_inst_addi_mcr_wmask;
  wire [31 : 0] spec_inst_addi_mcr_wdata;
  wire [31 : 0] spec_inst_addi_mem_addr;
  wire [ 3 : 0] spec_inst_addi_mem_rmask;
  wire [ 3 : 0] spec_inst_addi_mem_wmask;
  wire [31 : 0] spec_inst_addi_mem_wdata;

  mfi_inst_addi inst_addi (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_addi_valid),
    .spec_trap(spec_inst_addi_trap),
    .spec_src1_addr(spec_inst_addi_src1_addr),
    .spec_src2_addr(spec_inst_addi_src2_addr),
    .spec_src3_addr(spec_inst_addi_src3_addr),
    .spec_dest_addr(spec_inst_addi_dest_addr),
    .spec_dest_wdata(spec_inst_addi_dest_wdata),
    .spec_pc_wdata(spec_inst_addi_pc_wdata),
    .spec_mcr_wdata(spec_inst_addi_mcr_wdata)
    .spec_mem_addr(spec_inst_addi_mem_addr),
    .spec_mem_rmask(spec_inst_addi_mem_rmask),
    .spec_mem_wmask(spec_inst_addi_mem_wmask),
    .spec_mem_wdata(spec_inst_addi_mem_wdata)
  );

  wire          spec_inst_and_valid;
  wire          spec_inst_and_trap;
  wire [ 3 : 0] spec_inst_and_src1_addr;
  wire [ 3 : 0] spec_inst_and_src2_addr;
  wire [ 3 : 0] spec_inst_and_src3_addr;
  wire [ 3 : 0] spec_inst_and_dest_addr;
  wire [31 : 0] spec_inst_and_dest_wdata;
  wire [31 : 0] spec_inst_and_pc_wdata;
  wire [ 3 : 0] spec_inst_and_mcr_wmask;
  wire [31 : 0] spec_inst_and_mcr_wdata;
  wire [31 : 0] spec_inst_and_mem_addr;
  wire [ 3 : 0] spec_inst_and_mem_rmask;
  wire [ 3 : 0] spec_inst_and_mem_wmask;
  wire [31 : 0] spec_inst_and_mem_wdata;

  mfi_inst_and inst_and (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_and_valid),
    .spec_trap(spec_inst_and_trap),
    .spec_src1_addr(spec_inst_and_src1_addr),
    .spec_src2_addr(spec_inst_and_src2_addr),
    .spec_src3_addr(spec_inst_and_src3_addr),
    .spec_dest_addr(spec_inst_and_dest_addr),
    .spec_dest_wdata(spec_inst_and_dest_wdata),
    .spec_pc_wdata(spec_inst_and_pc_wdata),
    .spec_mcr_wdata(spec_inst_and_mcr_wdata)
    .spec_mem_addr(spec_inst_and_mem_addr),
    .spec_mem_rmask(spec_inst_and_mem_rmask),
    .spec_mem_wmask(spec_inst_and_mem_wmask),
    .spec_mem_wdata(spec_inst_and_mem_wdata)
  );

  wire          spec_inst_andi_valid;
  wire          spec_inst_andi_trap;
  wire [ 3 : 0] spec_inst_andi_src1_addr;
  wire [ 3 : 0] spec_inst_andi_src2_addr;
  wire [ 3 : 0] spec_inst_andi_src3_addr;
  wire [ 3 : 0] spec_inst_andi_dest_addr;
  wire [31 : 0] spec_inst_andi_dest_wdata;
  wire [31 : 0] spec_inst_andi_pc_wdata;
  wire [ 3 : 0] spec_inst_andi_mcr_wmask;
  wire [31 : 0] spec_inst_andi_mcr_wdata;
  wire [31 : 0] spec_inst_andi_mem_addr;
  wire [ 3 : 0] spec_inst_andi_mem_rmask;
  wire [ 3 : 0] spec_inst_andi_mem_wmask;
  wire [31 : 0] spec_inst_andi_mem_wdata;

  mfi_inst_andi inst_andi (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_andi_valid),
    .spec_trap(spec_inst_andi_trap),
    .spec_src1_addr(spec_inst_andi_src1_addr),
    .spec_src2_addr(spec_inst_andi_src2_addr),
    .spec_src3_addr(spec_inst_andi_src3_addr),
    .spec_dest_addr(spec_inst_andi_dest_addr),
    .spec_dest_wdata(spec_inst_andi_dest_wdata),
    .spec_pc_wdata(spec_inst_andi_pc_wdata),
    .spec_mcr_wdata(spec_inst_andi_mcr_wdata)
    .spec_mem_addr(spec_inst_andi_mem_addr),
    .spec_mem_rmask(spec_inst_andi_mem_rmask),
    .spec_mem_wmask(spec_inst_andi_mem_wmask),
    .spec_mem_wdata(spec_inst_andi_mem_wdata)
  );

  wire          spec_inst_asr_valid;
  wire          spec_inst_asr_trap;
  wire [ 3 : 0] spec_inst_asr_src1_addr;
  wire [ 3 : 0] spec_inst_asr_src2_addr;
  wire [ 3 : 0] spec_inst_asr_src3_addr;
  wire [ 3 : 0] spec_inst_asr_dest_addr;
  wire [31 : 0] spec_inst_asr_dest_wdata;
  wire [31 : 0] spec_inst_asr_pc_wdata;
  wire [ 3 : 0] spec_inst_asr_mcr_wmask;
  wire [31 : 0] spec_inst_asr_mcr_wdata;
  wire [31 : 0] spec_inst_asr_mem_addr;
  wire [ 3 : 0] spec_inst_asr_mem_rmask;
  wire [ 3 : 0] spec_inst_asr_mem_wmask;
  wire [31 : 0] spec_inst_asr_mem_wdata;

  mfi_inst_asr inst_asr (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_asr_valid),
    .spec_trap(spec_inst_asr_trap),
    .spec_src1_addr(spec_inst_asr_src1_addr),
    .spec_src2_addr(spec_inst_asr_src2_addr),
    .spec_src3_addr(spec_inst_asr_src3_addr),
    .spec_dest_addr(spec_inst_asr_dest_addr),
    .spec_dest_wdata(spec_inst_asr_dest_wdata),
    .spec_pc_wdata(spec_inst_asr_pc_wdata),
    .spec_mcr_wdata(spec_inst_asr_mcr_wdata)
    .spec_mem_addr(spec_inst_asr_mem_addr),
    .spec_mem_rmask(spec_inst_asr_mem_rmask),
    .spec_mem_wmask(spec_inst_asr_mem_wmask),
    .spec_mem_wdata(spec_inst_asr_mem_wdata)
  );

  wire          spec_inst_bf_valid;
  wire          spec_inst_bf_trap;
  wire [ 3 : 0] spec_inst_bf_src1_addr;
  wire [ 3 : 0] spec_inst_bf_src2_addr;
  wire [ 3 : 0] spec_inst_bf_src3_addr;
  wire [ 3 : 0] spec_inst_bf_dest_addr;
  wire [31 : 0] spec_inst_bf_dest_wdata;
  wire [31 : 0] spec_inst_bf_pc_wdata;
  wire [ 3 : 0] spec_inst_bf_mcr_wmask;
  wire [31 : 0] spec_inst_bf_mcr_wdata;
  wire [31 : 0] spec_inst_bf_mem_addr;
  wire [ 3 : 0] spec_inst_bf_mem_rmask;
  wire [ 3 : 0] spec_inst_bf_mem_wmask;
  wire [31 : 0] spec_inst_bf_mem_wdata;

  mfi_inst_bf inst_bf (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_bf_valid),
    .spec_trap(spec_inst_bf_trap),
    .spec_src1_addr(spec_inst_bf_src1_addr),
    .spec_src2_addr(spec_inst_bf_src2_addr),
    .spec_src3_addr(spec_inst_bf_src3_addr),
    .spec_dest_addr(spec_inst_bf_dest_addr),
    .spec_dest_wdata(spec_inst_bf_dest_wdata),
    .spec_pc_wdata(spec_inst_bf_pc_wdata),
    .spec_mcr_wdata(spec_inst_bf_mcr_wdata)
    .spec_mem_addr(spec_inst_bf_mem_addr),
    .spec_mem_rmask(spec_inst_bf_mem_rmask),
    .spec_mem_wmask(spec_inst_bf_mem_wmask),
    .spec_mem_wdata(spec_inst_bf_mem_wdata)
  );

  wire          spec_inst_bra_valid;
  wire          spec_inst_bra_trap;
  wire [ 3 : 0] spec_inst_bra_src1_addr;
  wire [ 3 : 0] spec_inst_bra_src2_addr;
  wire [ 3 : 0] spec_inst_bra_src3_addr;
  wire [ 3 : 0] spec_inst_bra_dest_addr;
  wire [31 : 0] spec_inst_bra_dest_wdata;
  wire [31 : 0] spec_inst_bra_pc_wdata;
  wire [ 3 : 0] spec_inst_bra_mcr_wmask;
  wire [31 : 0] spec_inst_bra_mcr_wdata;
  wire [31 : 0] spec_inst_bra_mem_addr;
  wire [ 3 : 0] spec_inst_bra_mem_rmask;
  wire [ 3 : 0] spec_inst_bra_mem_wmask;
  wire [31 : 0] spec_inst_bra_mem_wdata;

  mfi_inst_bra inst_bra (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_bra_valid),
    .spec_trap(spec_inst_bra_trap),
    .spec_src1_addr(spec_inst_bra_src1_addr),
    .spec_src2_addr(spec_inst_bra_src2_addr),
    .spec_src3_addr(spec_inst_bra_src3_addr),
    .spec_dest_addr(spec_inst_bra_dest_addr),
    .spec_dest_wdata(spec_inst_bra_dest_wdata),
    .spec_pc_wdata(spec_inst_bra_pc_wdata),
    .spec_mcr_wdata(spec_inst_bra_mcr_wdata)
    .spec_mem_addr(spec_inst_bra_mem_addr),
    .spec_mem_rmask(spec_inst_bra_mem_rmask),
    .spec_mem_wmask(spec_inst_bra_mem_wmask),
    .spec_mem_wdata(spec_inst_bra_mem_wdata)
  );

  wire          spec_inst_bt_valid;
  wire          spec_inst_bt_trap;
  wire [ 3 : 0] spec_inst_bt_src1_addr;
  wire [ 3 : 0] spec_inst_bt_src2_addr;
  wire [ 3 : 0] spec_inst_bt_src3_addr;
  wire [ 3 : 0] spec_inst_bt_dest_addr;
  wire [31 : 0] spec_inst_bt_dest_wdata;
  wire [31 : 0] spec_inst_bt_pc_wdata;
  wire [ 3 : 0] spec_inst_bt_mcr_wmask;
  wire [31 : 0] spec_inst_bt_mcr_wdata;
  wire [31 : 0] spec_inst_bt_mem_addr;
  wire [ 3 : 0] spec_inst_bt_mem_rmask;
  wire [ 3 : 0] spec_inst_bt_mem_wmask;
  wire [31 : 0] spec_inst_bt_mem_wdata;

  mfi_inst_bt inst_bt (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_bt_valid),
    .spec_trap(spec_inst_bt_trap),
    .spec_src1_addr(spec_inst_bt_src1_addr),
    .spec_src2_addr(spec_inst_bt_src2_addr),
    .spec_src3_addr(spec_inst_bt_src3_addr),
    .spec_dest_addr(spec_inst_bt_dest_addr),
    .spec_dest_wdata(spec_inst_bt_dest_wdata),
    .spec_pc_wdata(spec_inst_bt_pc_wdata),
    .spec_mcr_wdata(spec_inst_bt_mcr_wdata)
    .spec_mem_addr(spec_inst_bt_mem_addr),
    .spec_mem_rmask(spec_inst_bt_mem_rmask),
    .spec_mem_wmask(spec_inst_bt_mem_wmask),
    .spec_mem_wdata(spec_inst_bt_mem_wdata)
  );

  wire          spec_inst_call_valid;
  wire          spec_inst_call_trap;
  wire [ 3 : 0] spec_inst_call_src1_addr;
  wire [ 3 : 0] spec_inst_call_src2_addr;
  wire [ 3 : 0] spec_inst_call_src3_addr;
  wire [ 3 : 0] spec_inst_call_dest_addr;
  wire [31 : 0] spec_inst_call_dest_wdata;
  wire [31 : 0] spec_inst_call_pc_wdata;
  wire [ 3 : 0] spec_inst_call_mcr_wmask;
  wire [31 : 0] spec_inst_call_mcr_wdata;
  wire [31 : 0] spec_inst_call_mem_addr;
  wire [ 3 : 0] spec_inst_call_mem_rmask;
  wire [ 3 : 0] spec_inst_call_mem_wmask;
  wire [31 : 0] spec_inst_call_mem_wdata;

  mfi_inst_call inst_call (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_call_valid),
    .spec_trap(spec_inst_call_trap),
    .spec_src1_addr(spec_inst_call_src1_addr),
    .spec_src2_addr(spec_inst_call_src2_addr),
    .spec_src3_addr(spec_inst_call_src3_addr),
    .spec_dest_addr(spec_inst_call_dest_addr),
    .spec_dest_wdata(spec_inst_call_dest_wdata),
    .spec_pc_wdata(spec_inst_call_pc_wdata),
    .spec_mcr_wdata(spec_inst_call_mcr_wdata)
    .spec_mem_addr(spec_inst_call_mem_addr),
    .spec_mem_rmask(spec_inst_call_mem_rmask),
    .spec_mem_wmask(spec_inst_call_mem_wmask),
    .spec_mem_wdata(spec_inst_call_mem_wdata)
  );

  wire          spec_inst_cf_valid;
  wire          spec_inst_cf_trap;
  wire [ 3 : 0] spec_inst_cf_src1_addr;
  wire [ 3 : 0] spec_inst_cf_src2_addr;
  wire [ 3 : 0] spec_inst_cf_src3_addr;
  wire [ 3 : 0] spec_inst_cf_dest_addr;
  wire [31 : 0] spec_inst_cf_dest_wdata;
  wire [31 : 0] spec_inst_cf_pc_wdata;
  wire [ 3 : 0] spec_inst_cf_mcr_wmask;
  wire [31 : 0] spec_inst_cf_mcr_wdata;
  wire [31 : 0] spec_inst_cf_mem_addr;
  wire [ 3 : 0] spec_inst_cf_mem_rmask;
  wire [ 3 : 0] spec_inst_cf_mem_wmask;
  wire [31 : 0] spec_inst_cf_mem_wdata;

  mfi_inst_cf inst_cf (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cf_valid),
    .spec_trap(spec_inst_cf_trap),
    .spec_src1_addr(spec_inst_cf_src1_addr),
    .spec_src2_addr(spec_inst_cf_src2_addr),
    .spec_src3_addr(spec_inst_cf_src3_addr),
    .spec_dest_addr(spec_inst_cf_dest_addr),
    .spec_dest_wdata(spec_inst_cf_dest_wdata),
    .spec_pc_wdata(spec_inst_cf_pc_wdata),
    .spec_mcr_wdata(spec_inst_cf_mcr_wdata)
    .spec_mem_addr(spec_inst_cf_mem_addr),
    .spec_mem_rmask(spec_inst_cf_mem_rmask),
    .spec_mem_wmask(spec_inst_cf_mem_wmask),
    .spec_mem_wdata(spec_inst_cf_mem_wdata)
  );

  wire          spec_inst_cmp.eq_valid;
  wire          spec_inst_cmp.eq_trap;
  wire [ 3 : 0] spec_inst_cmp.eq_src1_addr;
  wire [ 3 : 0] spec_inst_cmp.eq_src2_addr;
  wire [ 3 : 0] spec_inst_cmp.eq_src3_addr;
  wire [ 3 : 0] spec_inst_cmp.eq_dest_addr;
  wire [31 : 0] spec_inst_cmp.eq_dest_wdata;
  wire [31 : 0] spec_inst_cmp.eq_pc_wdata;
  wire [ 3 : 0] spec_inst_cmp.eq_mcr_wmask;
  wire [31 : 0] spec_inst_cmp.eq_mcr_wdata;
  wire [31 : 0] spec_inst_cmp.eq_mem_addr;
  wire [ 3 : 0] spec_inst_cmp.eq_mem_rmask;
  wire [ 3 : 0] spec_inst_cmp.eq_mem_wmask;
  wire [31 : 0] spec_inst_cmp.eq_mem_wdata;

  mfi_inst_cmp.eq inst_cmp.eq (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmp.eq_valid),
    .spec_trap(spec_inst_cmp.eq_trap),
    .spec_src1_addr(spec_inst_cmp.eq_src1_addr),
    .spec_src2_addr(spec_inst_cmp.eq_src2_addr),
    .spec_src3_addr(spec_inst_cmp.eq_src3_addr),
    .spec_dest_addr(spec_inst_cmp.eq_dest_addr),
    .spec_dest_wdata(spec_inst_cmp.eq_dest_wdata),
    .spec_pc_wdata(spec_inst_cmp.eq_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmp.eq_mcr_wdata)
    .spec_mem_addr(spec_inst_cmp.eq_mem_addr),
    .spec_mem_rmask(spec_inst_cmp.eq_mem_rmask),
    .spec_mem_wmask(spec_inst_cmp.eq_mem_wmask),
    .spec_mem_wdata(spec_inst_cmp.eq_mem_wdata)
  );

  wire          spec_inst_cmp.le_valid;
  wire          spec_inst_cmp.le_trap;
  wire [ 3 : 0] spec_inst_cmp.le_src1_addr;
  wire [ 3 : 0] spec_inst_cmp.le_src2_addr;
  wire [ 3 : 0] spec_inst_cmp.le_src3_addr;
  wire [ 3 : 0] spec_inst_cmp.le_dest_addr;
  wire [31 : 0] spec_inst_cmp.le_dest_wdata;
  wire [31 : 0] spec_inst_cmp.le_pc_wdata;
  wire [ 3 : 0] spec_inst_cmp.le_mcr_wmask;
  wire [31 : 0] spec_inst_cmp.le_mcr_wdata;
  wire [31 : 0] spec_inst_cmp.le_mem_addr;
  wire [ 3 : 0] spec_inst_cmp.le_mem_rmask;
  wire [ 3 : 0] spec_inst_cmp.le_mem_wmask;
  wire [31 : 0] spec_inst_cmp.le_mem_wdata;

  mfi_inst_cmp.le inst_cmp.le (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmp.le_valid),
    .spec_trap(spec_inst_cmp.le_trap),
    .spec_src1_addr(spec_inst_cmp.le_src1_addr),
    .spec_src2_addr(spec_inst_cmp.le_src2_addr),
    .spec_src3_addr(spec_inst_cmp.le_src3_addr),
    .spec_dest_addr(spec_inst_cmp.le_dest_addr),
    .spec_dest_wdata(spec_inst_cmp.le_dest_wdata),
    .spec_pc_wdata(spec_inst_cmp.le_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmp.le_mcr_wdata)
    .spec_mem_addr(spec_inst_cmp.le_mem_addr),
    .spec_mem_rmask(spec_inst_cmp.le_mem_rmask),
    .spec_mem_wmask(spec_inst_cmp.le_mem_wmask),
    .spec_mem_wdata(spec_inst_cmp.le_mem_wdata)
  );

  wire          spec_inst_cmp.lo_valid;
  wire          spec_inst_cmp.lo_trap;
  wire [ 3 : 0] spec_inst_cmp.lo_src1_addr;
  wire [ 3 : 0] spec_inst_cmp.lo_src2_addr;
  wire [ 3 : 0] spec_inst_cmp.lo_src3_addr;
  wire [ 3 : 0] spec_inst_cmp.lo_dest_addr;
  wire [31 : 0] spec_inst_cmp.lo_dest_wdata;
  wire [31 : 0] spec_inst_cmp.lo_pc_wdata;
  wire [ 3 : 0] spec_inst_cmp.lo_mcr_wmask;
  wire [31 : 0] spec_inst_cmp.lo_mcr_wdata;
  wire [31 : 0] spec_inst_cmp.lo_mem_addr;
  wire [ 3 : 0] spec_inst_cmp.lo_mem_rmask;
  wire [ 3 : 0] spec_inst_cmp.lo_mem_wmask;
  wire [31 : 0] spec_inst_cmp.lo_mem_wdata;

  mfi_inst_cmp.lo inst_cmp.lo (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmp.lo_valid),
    .spec_trap(spec_inst_cmp.lo_trap),
    .spec_src1_addr(spec_inst_cmp.lo_src1_addr),
    .spec_src2_addr(spec_inst_cmp.lo_src2_addr),
    .spec_src3_addr(spec_inst_cmp.lo_src3_addr),
    .spec_dest_addr(spec_inst_cmp.lo_dest_addr),
    .spec_dest_wdata(spec_inst_cmp.lo_dest_wdata),
    .spec_pc_wdata(spec_inst_cmp.lo_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmp.lo_mcr_wdata)
    .spec_mem_addr(spec_inst_cmp.lo_mem_addr),
    .spec_mem_rmask(spec_inst_cmp.lo_mem_rmask),
    .spec_mem_wmask(spec_inst_cmp.lo_mem_wmask),
    .spec_mem_wdata(spec_inst_cmp.lo_mem_wdata)
  );

  wire          spec_inst_cmp.ls_valid;
  wire          spec_inst_cmp.ls_trap;
  wire [ 3 : 0] spec_inst_cmp.ls_src1_addr;
  wire [ 3 : 0] spec_inst_cmp.ls_src2_addr;
  wire [ 3 : 0] spec_inst_cmp.ls_src3_addr;
  wire [ 3 : 0] spec_inst_cmp.ls_dest_addr;
  wire [31 : 0] spec_inst_cmp.ls_dest_wdata;
  wire [31 : 0] spec_inst_cmp.ls_pc_wdata;
  wire [ 3 : 0] spec_inst_cmp.ls_mcr_wmask;
  wire [31 : 0] spec_inst_cmp.ls_mcr_wdata;
  wire [31 : 0] spec_inst_cmp.ls_mem_addr;
  wire [ 3 : 0] spec_inst_cmp.ls_mem_rmask;
  wire [ 3 : 0] spec_inst_cmp.ls_mem_wmask;
  wire [31 : 0] spec_inst_cmp.ls_mem_wdata;

  mfi_inst_cmp.ls inst_cmp.ls (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmp.ls_valid),
    .spec_trap(spec_inst_cmp.ls_trap),
    .spec_src1_addr(spec_inst_cmp.ls_src1_addr),
    .spec_src2_addr(spec_inst_cmp.ls_src2_addr),
    .spec_src3_addr(spec_inst_cmp.ls_src3_addr),
    .spec_dest_addr(spec_inst_cmp.ls_dest_addr),
    .spec_dest_wdata(spec_inst_cmp.ls_dest_wdata),
    .spec_pc_wdata(spec_inst_cmp.ls_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmp.ls_mcr_wdata)
    .spec_mem_addr(spec_inst_cmp.ls_mem_addr),
    .spec_mem_rmask(spec_inst_cmp.ls_mem_rmask),
    .spec_mem_wmask(spec_inst_cmp.ls_mem_wmask),
    .spec_mem_wdata(spec_inst_cmp.ls_mem_wdata)
  );

  wire          spec_inst_cmp.lt_valid;
  wire          spec_inst_cmp.lt_trap;
  wire [ 3 : 0] spec_inst_cmp.lt_src1_addr;
  wire [ 3 : 0] spec_inst_cmp.lt_src2_addr;
  wire [ 3 : 0] spec_inst_cmp.lt_src3_addr;
  wire [ 3 : 0] spec_inst_cmp.lt_dest_addr;
  wire [31 : 0] spec_inst_cmp.lt_dest_wdata;
  wire [31 : 0] spec_inst_cmp.lt_pc_wdata;
  wire [ 3 : 0] spec_inst_cmp.lt_mcr_wmask;
  wire [31 : 0] spec_inst_cmp.lt_mcr_wdata;
  wire [31 : 0] spec_inst_cmp.lt_mem_addr;
  wire [ 3 : 0] spec_inst_cmp.lt_mem_rmask;
  wire [ 3 : 0] spec_inst_cmp.lt_mem_wmask;
  wire [31 : 0] spec_inst_cmp.lt_mem_wdata;

  mfi_inst_cmp.lt inst_cmp.lt (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmp.lt_valid),
    .spec_trap(spec_inst_cmp.lt_trap),
    .spec_src1_addr(spec_inst_cmp.lt_src1_addr),
    .spec_src2_addr(spec_inst_cmp.lt_src2_addr),
    .spec_src3_addr(spec_inst_cmp.lt_src3_addr),
    .spec_dest_addr(spec_inst_cmp.lt_dest_addr),
    .spec_dest_wdata(spec_inst_cmp.lt_dest_wdata),
    .spec_pc_wdata(spec_inst_cmp.lt_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmp.lt_mcr_wdata)
    .spec_mem_addr(spec_inst_cmp.lt_mem_addr),
    .spec_mem_rmask(spec_inst_cmp.lt_mem_rmask),
    .spec_mem_wmask(spec_inst_cmp.lt_mem_wmask),
    .spec_mem_wdata(spec_inst_cmp.lt_mem_wdata)
  );

  wire          spec_inst_cmpi.eq_valid;
  wire          spec_inst_cmpi.eq_trap;
  wire [ 3 : 0] spec_inst_cmpi.eq_src1_addr;
  wire [ 3 : 0] spec_inst_cmpi.eq_src2_addr;
  wire [ 3 : 0] spec_inst_cmpi.eq_src3_addr;
  wire [ 3 : 0] spec_inst_cmpi.eq_dest_addr;
  wire [31 : 0] spec_inst_cmpi.eq_dest_wdata;
  wire [31 : 0] spec_inst_cmpi.eq_pc_wdata;
  wire [ 3 : 0] spec_inst_cmpi.eq_mcr_wmask;
  wire [31 : 0] spec_inst_cmpi.eq_mcr_wdata;
  wire [31 : 0] spec_inst_cmpi.eq_mem_addr;
  wire [ 3 : 0] spec_inst_cmpi.eq_mem_rmask;
  wire [ 3 : 0] spec_inst_cmpi.eq_mem_wmask;
  wire [31 : 0] spec_inst_cmpi.eq_mem_wdata;

  mfi_inst_cmpi.eq inst_cmpi.eq (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmpi.eq_valid),
    .spec_trap(spec_inst_cmpi.eq_trap),
    .spec_src1_addr(spec_inst_cmpi.eq_src1_addr),
    .spec_src2_addr(spec_inst_cmpi.eq_src2_addr),
    .spec_src3_addr(spec_inst_cmpi.eq_src3_addr),
    .spec_dest_addr(spec_inst_cmpi.eq_dest_addr),
    .spec_dest_wdata(spec_inst_cmpi.eq_dest_wdata),
    .spec_pc_wdata(spec_inst_cmpi.eq_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmpi.eq_mcr_wdata)
    .spec_mem_addr(spec_inst_cmpi.eq_mem_addr),
    .spec_mem_rmask(spec_inst_cmpi.eq_mem_rmask),
    .spec_mem_wmask(spec_inst_cmpi.eq_mem_wmask),
    .spec_mem_wdata(spec_inst_cmpi.eq_mem_wdata)
  );

  wire          spec_inst_cmpi.le_valid;
  wire          spec_inst_cmpi.le_trap;
  wire [ 3 : 0] spec_inst_cmpi.le_src1_addr;
  wire [ 3 : 0] spec_inst_cmpi.le_src2_addr;
  wire [ 3 : 0] spec_inst_cmpi.le_src3_addr;
  wire [ 3 : 0] spec_inst_cmpi.le_dest_addr;
  wire [31 : 0] spec_inst_cmpi.le_dest_wdata;
  wire [31 : 0] spec_inst_cmpi.le_pc_wdata;
  wire [ 3 : 0] spec_inst_cmpi.le_mcr_wmask;
  wire [31 : 0] spec_inst_cmpi.le_mcr_wdata;
  wire [31 : 0] spec_inst_cmpi.le_mem_addr;
  wire [ 3 : 0] spec_inst_cmpi.le_mem_rmask;
  wire [ 3 : 0] spec_inst_cmpi.le_mem_wmask;
  wire [31 : 0] spec_inst_cmpi.le_mem_wdata;

  mfi_inst_cmpi.le inst_cmpi.le (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmpi.le_valid),
    .spec_trap(spec_inst_cmpi.le_trap),
    .spec_src1_addr(spec_inst_cmpi.le_src1_addr),
    .spec_src2_addr(spec_inst_cmpi.le_src2_addr),
    .spec_src3_addr(spec_inst_cmpi.le_src3_addr),
    .spec_dest_addr(spec_inst_cmpi.le_dest_addr),
    .spec_dest_wdata(spec_inst_cmpi.le_dest_wdata),
    .spec_pc_wdata(spec_inst_cmpi.le_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmpi.le_mcr_wdata)
    .spec_mem_addr(spec_inst_cmpi.le_mem_addr),
    .spec_mem_rmask(spec_inst_cmpi.le_mem_rmask),
    .spec_mem_wmask(spec_inst_cmpi.le_mem_wmask),
    .spec_mem_wdata(spec_inst_cmpi.le_mem_wdata)
  );

  wire          spec_inst_cmpi.lo_valid;
  wire          spec_inst_cmpi.lo_trap;
  wire [ 3 : 0] spec_inst_cmpi.lo_src1_addr;
  wire [ 3 : 0] spec_inst_cmpi.lo_src2_addr;
  wire [ 3 : 0] spec_inst_cmpi.lo_src3_addr;
  wire [ 3 : 0] spec_inst_cmpi.lo_dest_addr;
  wire [31 : 0] spec_inst_cmpi.lo_dest_wdata;
  wire [31 : 0] spec_inst_cmpi.lo_pc_wdata;
  wire [ 3 : 0] spec_inst_cmpi.lo_mcr_wmask;
  wire [31 : 0] spec_inst_cmpi.lo_mcr_wdata;
  wire [31 : 0] spec_inst_cmpi.lo_mem_addr;
  wire [ 3 : 0] spec_inst_cmpi.lo_mem_rmask;
  wire [ 3 : 0] spec_inst_cmpi.lo_mem_wmask;
  wire [31 : 0] spec_inst_cmpi.lo_mem_wdata;

  mfi_inst_cmpi.lo inst_cmpi.lo (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmpi.lo_valid),
    .spec_trap(spec_inst_cmpi.lo_trap),
    .spec_src1_addr(spec_inst_cmpi.lo_src1_addr),
    .spec_src2_addr(spec_inst_cmpi.lo_src2_addr),
    .spec_src3_addr(spec_inst_cmpi.lo_src3_addr),
    .spec_dest_addr(spec_inst_cmpi.lo_dest_addr),
    .spec_dest_wdata(spec_inst_cmpi.lo_dest_wdata),
    .spec_pc_wdata(spec_inst_cmpi.lo_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmpi.lo_mcr_wdata)
    .spec_mem_addr(spec_inst_cmpi.lo_mem_addr),
    .spec_mem_rmask(spec_inst_cmpi.lo_mem_rmask),
    .spec_mem_wmask(spec_inst_cmpi.lo_mem_wmask),
    .spec_mem_wdata(spec_inst_cmpi.lo_mem_wdata)
  );

  wire          spec_inst_cmpi.ls_valid;
  wire          spec_inst_cmpi.ls_trap;
  wire [ 3 : 0] spec_inst_cmpi.ls_src1_addr;
  wire [ 3 : 0] spec_inst_cmpi.ls_src2_addr;
  wire [ 3 : 0] spec_inst_cmpi.ls_src3_addr;
  wire [ 3 : 0] spec_inst_cmpi.ls_dest_addr;
  wire [31 : 0] spec_inst_cmpi.ls_dest_wdata;
  wire [31 : 0] spec_inst_cmpi.ls_pc_wdata;
  wire [ 3 : 0] spec_inst_cmpi.ls_mcr_wmask;
  wire [31 : 0] spec_inst_cmpi.ls_mcr_wdata;
  wire [31 : 0] spec_inst_cmpi.ls_mem_addr;
  wire [ 3 : 0] spec_inst_cmpi.ls_mem_rmask;
  wire [ 3 : 0] spec_inst_cmpi.ls_mem_wmask;
  wire [31 : 0] spec_inst_cmpi.ls_mem_wdata;

  mfi_inst_cmpi.ls inst_cmpi.ls (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmpi.ls_valid),
    .spec_trap(spec_inst_cmpi.ls_trap),
    .spec_src1_addr(spec_inst_cmpi.ls_src1_addr),
    .spec_src2_addr(spec_inst_cmpi.ls_src2_addr),
    .spec_src3_addr(spec_inst_cmpi.ls_src3_addr),
    .spec_dest_addr(spec_inst_cmpi.ls_dest_addr),
    .spec_dest_wdata(spec_inst_cmpi.ls_dest_wdata),
    .spec_pc_wdata(spec_inst_cmpi.ls_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmpi.ls_mcr_wdata)
    .spec_mem_addr(spec_inst_cmpi.ls_mem_addr),
    .spec_mem_rmask(spec_inst_cmpi.ls_mem_rmask),
    .spec_mem_wmask(spec_inst_cmpi.ls_mem_wmask),
    .spec_mem_wdata(spec_inst_cmpi.ls_mem_wdata)
  );

  wire          spec_inst_cmpi.lt_valid;
  wire          spec_inst_cmpi.lt_trap;
  wire [ 3 : 0] spec_inst_cmpi.lt_src1_addr;
  wire [ 3 : 0] spec_inst_cmpi.lt_src2_addr;
  wire [ 3 : 0] spec_inst_cmpi.lt_src3_addr;
  wire [ 3 : 0] spec_inst_cmpi.lt_dest_addr;
  wire [31 : 0] spec_inst_cmpi.lt_dest_wdata;
  wire [31 : 0] spec_inst_cmpi.lt_pc_wdata;
  wire [ 3 : 0] spec_inst_cmpi.lt_mcr_wmask;
  wire [31 : 0] spec_inst_cmpi.lt_mcr_wdata;
  wire [31 : 0] spec_inst_cmpi.lt_mem_addr;
  wire [ 3 : 0] spec_inst_cmpi.lt_mem_rmask;
  wire [ 3 : 0] spec_inst_cmpi.lt_mem_wmask;
  wire [31 : 0] spec_inst_cmpi.lt_mem_wdata;

  mfi_inst_cmpi.lt inst_cmpi.lt (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_cmpi.lt_valid),
    .spec_trap(spec_inst_cmpi.lt_trap),
    .spec_src1_addr(spec_inst_cmpi.lt_src1_addr),
    .spec_src2_addr(spec_inst_cmpi.lt_src2_addr),
    .spec_src3_addr(spec_inst_cmpi.lt_src3_addr),
    .spec_dest_addr(spec_inst_cmpi.lt_dest_addr),
    .spec_dest_wdata(spec_inst_cmpi.lt_dest_wdata),
    .spec_pc_wdata(spec_inst_cmpi.lt_pc_wdata),
    .spec_mcr_wdata(spec_inst_cmpi.lt_mcr_wdata)
    .spec_mem_addr(spec_inst_cmpi.lt_mem_addr),
    .spec_mem_rmask(spec_inst_cmpi.lt_mem_rmask),
    .spec_mem_wmask(spec_inst_cmpi.lt_mem_wmask),
    .spec_mem_wdata(spec_inst_cmpi.lt_mem_wdata)
  );

  wire          spec_inst_ct_valid;
  wire          spec_inst_ct_trap;
  wire [ 3 : 0] spec_inst_ct_src1_addr;
  wire [ 3 : 0] spec_inst_ct_src2_addr;
  wire [ 3 : 0] spec_inst_ct_src3_addr;
  wire [ 3 : 0] spec_inst_ct_dest_addr;
  wire [31 : 0] spec_inst_ct_dest_wdata;
  wire [31 : 0] spec_inst_ct_pc_wdata;
  wire [ 3 : 0] spec_inst_ct_mcr_wmask;
  wire [31 : 0] spec_inst_ct_mcr_wdata;
  wire [31 : 0] spec_inst_ct_mem_addr;
  wire [ 3 : 0] spec_inst_ct_mem_rmask;
  wire [ 3 : 0] spec_inst_ct_mem_wmask;
  wire [31 : 0] spec_inst_ct_mem_wdata;

  mfi_inst_ct inst_ct (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_ct_valid),
    .spec_trap(spec_inst_ct_trap),
    .spec_src1_addr(spec_inst_ct_src1_addr),
    .spec_src2_addr(spec_inst_ct_src2_addr),
    .spec_src3_addr(spec_inst_ct_src3_addr),
    .spec_dest_addr(spec_inst_ct_dest_addr),
    .spec_dest_wdata(spec_inst_ct_dest_wdata),
    .spec_pc_wdata(spec_inst_ct_pc_wdata),
    .spec_mcr_wdata(spec_inst_ct_mcr_wdata)
    .spec_mem_addr(spec_inst_ct_mem_addr),
    .spec_mem_rmask(spec_inst_ct_mem_rmask),
    .spec_mem_wmask(spec_inst_ct_mem_wmask),
    .spec_mem_wdata(spec_inst_ct_mem_wdata)
  );

  wire          spec_inst_flsl_valid;
  wire          spec_inst_flsl_trap;
  wire [ 3 : 0] spec_inst_flsl_src1_addr;
  wire [ 3 : 0] spec_inst_flsl_src2_addr;
  wire [ 3 : 0] spec_inst_flsl_src3_addr;
  wire [ 3 : 0] spec_inst_flsl_dest_addr;
  wire [31 : 0] spec_inst_flsl_dest_wdata;
  wire [31 : 0] spec_inst_flsl_pc_wdata;
  wire [ 3 : 0] spec_inst_flsl_mcr_wmask;
  wire [31 : 0] spec_inst_flsl_mcr_wdata;
  wire [31 : 0] spec_inst_flsl_mem_addr;
  wire [ 3 : 0] spec_inst_flsl_mem_rmask;
  wire [ 3 : 0] spec_inst_flsl_mem_wmask;
  wire [31 : 0] spec_inst_flsl_mem_wdata;

  mfi_inst_flsl inst_flsl (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_flsl_valid),
    .spec_trap(spec_inst_flsl_trap),
    .spec_src1_addr(spec_inst_flsl_src1_addr),
    .spec_src2_addr(spec_inst_flsl_src2_addr),
    .spec_src3_addr(spec_inst_flsl_src3_addr),
    .spec_dest_addr(spec_inst_flsl_dest_addr),
    .spec_dest_wdata(spec_inst_flsl_dest_wdata),
    .spec_pc_wdata(spec_inst_flsl_pc_wdata),
    .spec_mcr_wdata(spec_inst_flsl_mcr_wdata)
    .spec_mem_addr(spec_inst_flsl_mem_addr),
    .spec_mem_rmask(spec_inst_flsl_mem_rmask),
    .spec_mem_wmask(spec_inst_flsl_mem_wmask),
    .spec_mem_wdata(spec_inst_flsl_mem_wdata)
  );

  wire          spec_inst_flsr_valid;
  wire          spec_inst_flsr_trap;
  wire [ 3 : 0] spec_inst_flsr_src1_addr;
  wire [ 3 : 0] spec_inst_flsr_src2_addr;
  wire [ 3 : 0] spec_inst_flsr_src3_addr;
  wire [ 3 : 0] spec_inst_flsr_dest_addr;
  wire [31 : 0] spec_inst_flsr_dest_wdata;
  wire [31 : 0] spec_inst_flsr_pc_wdata;
  wire [ 3 : 0] spec_inst_flsr_mcr_wmask;
  wire [31 : 0] spec_inst_flsr_mcr_wdata;
  wire [31 : 0] spec_inst_flsr_mem_addr;
  wire [ 3 : 0] spec_inst_flsr_mem_rmask;
  wire [ 3 : 0] spec_inst_flsr_mem_wmask;
  wire [31 : 0] spec_inst_flsr_mem_wdata;

  mfi_inst_flsr inst_flsr (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_flsr_valid),
    .spec_trap(spec_inst_flsr_trap),
    .spec_src1_addr(spec_inst_flsr_src1_addr),
    .spec_src2_addr(spec_inst_flsr_src2_addr),
    .spec_src3_addr(spec_inst_flsr_src3_addr),
    .spec_dest_addr(spec_inst_flsr_dest_addr),
    .spec_dest_wdata(spec_inst_flsr_dest_wdata),
    .spec_pc_wdata(spec_inst_flsr_pc_wdata),
    .spec_mcr_wdata(spec_inst_flsr_mcr_wdata)
    .spec_mem_addr(spec_inst_flsr_mem_addr),
    .spec_mem_rmask(spec_inst_flsr_mem_rmask),
    .spec_mem_wmask(spec_inst_flsr_mem_wmask),
    .spec_mem_wdata(spec_inst_flsr_mem_wdata)
  );

  wire          spec_inst_ld_valid;
  wire          spec_inst_ld_trap;
  wire [ 3 : 0] spec_inst_ld_src1_addr;
  wire [ 3 : 0] spec_inst_ld_src2_addr;
  wire [ 3 : 0] spec_inst_ld_src3_addr;
  wire [ 3 : 0] spec_inst_ld_dest_addr;
  wire [31 : 0] spec_inst_ld_dest_wdata;
  wire [31 : 0] spec_inst_ld_pc_wdata;
  wire [ 3 : 0] spec_inst_ld_mcr_wmask;
  wire [31 : 0] spec_inst_ld_mcr_wdata;
  wire [31 : 0] spec_inst_ld_mem_addr;
  wire [ 3 : 0] spec_inst_ld_mem_rmask;
  wire [ 3 : 0] spec_inst_ld_mem_wmask;
  wire [31 : 0] spec_inst_ld_mem_wdata;

  mfi_inst_ld inst_ld (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_ld_valid),
    .spec_trap(spec_inst_ld_trap),
    .spec_src1_addr(spec_inst_ld_src1_addr),
    .spec_src2_addr(spec_inst_ld_src2_addr),
    .spec_src3_addr(spec_inst_ld_src3_addr),
    .spec_dest_addr(spec_inst_ld_dest_addr),
    .spec_dest_wdata(spec_inst_ld_dest_wdata),
    .spec_pc_wdata(spec_inst_ld_pc_wdata),
    .spec_mcr_wdata(spec_inst_ld_mcr_wdata)
    .spec_mem_addr(spec_inst_ld_mem_addr),
    .spec_mem_rmask(spec_inst_ld_mem_rmask),
    .spec_mem_wmask(spec_inst_ld_mem_wmask),
    .spec_mem_wdata(spec_inst_ld_mem_wdata)
  );

  wire          spec_inst_ldb_valid;
  wire          spec_inst_ldb_trap;
  wire [ 3 : 0] spec_inst_ldb_src1_addr;
  wire [ 3 : 0] spec_inst_ldb_src2_addr;
  wire [ 3 : 0] spec_inst_ldb_src3_addr;
  wire [ 3 : 0] spec_inst_ldb_dest_addr;
  wire [31 : 0] spec_inst_ldb_dest_wdata;
  wire [31 : 0] spec_inst_ldb_pc_wdata;
  wire [ 3 : 0] spec_inst_ldb_mcr_wmask;
  wire [31 : 0] spec_inst_ldb_mcr_wdata;
  wire [31 : 0] spec_inst_ldb_mem_addr;
  wire [ 3 : 0] spec_inst_ldb_mem_rmask;
  wire [ 3 : 0] spec_inst_ldb_mem_wmask;
  wire [31 : 0] spec_inst_ldb_mem_wdata;

  mfi_inst_ldb inst_ldb (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_ldb_valid),
    .spec_trap(spec_inst_ldb_trap),
    .spec_src1_addr(spec_inst_ldb_src1_addr),
    .spec_src2_addr(spec_inst_ldb_src2_addr),
    .spec_src3_addr(spec_inst_ldb_src3_addr),
    .spec_dest_addr(spec_inst_ldb_dest_addr),
    .spec_dest_wdata(spec_inst_ldb_dest_wdata),
    .spec_pc_wdata(spec_inst_ldb_pc_wdata),
    .spec_mcr_wdata(spec_inst_ldb_mcr_wdata)
    .spec_mem_addr(spec_inst_ldb_mem_addr),
    .spec_mem_rmask(spec_inst_ldb_mem_rmask),
    .spec_mem_wmask(spec_inst_ldb_mem_wmask),
    .spec_mem_wdata(spec_inst_ldb_mem_wdata)
  );

  wire          spec_inst_ldh_valid;
  wire          spec_inst_ldh_trap;
  wire [ 3 : 0] spec_inst_ldh_src1_addr;
  wire [ 3 : 0] spec_inst_ldh_src2_addr;
  wire [ 3 : 0] spec_inst_ldh_src3_addr;
  wire [ 3 : 0] spec_inst_ldh_dest_addr;
  wire [31 : 0] spec_inst_ldh_dest_wdata;
  wire [31 : 0] spec_inst_ldh_pc_wdata;
  wire [ 3 : 0] spec_inst_ldh_mcr_wmask;
  wire [31 : 0] spec_inst_ldh_mcr_wdata;
  wire [31 : 0] spec_inst_ldh_mem_addr;
  wire [ 3 : 0] spec_inst_ldh_mem_rmask;
  wire [ 3 : 0] spec_inst_ldh_mem_wmask;
  wire [31 : 0] spec_inst_ldh_mem_wdata;

  mfi_inst_ldh inst_ldh (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_ldh_valid),
    .spec_trap(spec_inst_ldh_trap),
    .spec_src1_addr(spec_inst_ldh_src1_addr),
    .spec_src2_addr(spec_inst_ldh_src2_addr),
    .spec_src3_addr(spec_inst_ldh_src3_addr),
    .spec_dest_addr(spec_inst_ldh_dest_addr),
    .spec_dest_wdata(spec_inst_ldh_dest_wdata),
    .spec_pc_wdata(spec_inst_ldh_pc_wdata),
    .spec_mcr_wdata(spec_inst_ldh_mcr_wdata)
    .spec_mem_addr(spec_inst_ldh_mem_addr),
    .spec_mem_rmask(spec_inst_ldh_mem_rmask),
    .spec_mem_wmask(spec_inst_ldh_mem_wmask),
    .spec_mem_wdata(spec_inst_ldh_mem_wdata)
  );

  wire          spec_inst_lsl_valid;
  wire          spec_inst_lsl_trap;
  wire [ 3 : 0] spec_inst_lsl_src1_addr;
  wire [ 3 : 0] spec_inst_lsl_src2_addr;
  wire [ 3 : 0] spec_inst_lsl_src3_addr;
  wire [ 3 : 0] spec_inst_lsl_dest_addr;
  wire [31 : 0] spec_inst_lsl_dest_wdata;
  wire [31 : 0] spec_inst_lsl_pc_wdata;
  wire [ 3 : 0] spec_inst_lsl_mcr_wmask;
  wire [31 : 0] spec_inst_lsl_mcr_wdata;
  wire [31 : 0] spec_inst_lsl_mem_addr;
  wire [ 3 : 0] spec_inst_lsl_mem_rmask;
  wire [ 3 : 0] spec_inst_lsl_mem_wmask;
  wire [31 : 0] spec_inst_lsl_mem_wdata;

  mfi_inst_lsl inst_lsl (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_lsl_valid),
    .spec_trap(spec_inst_lsl_trap),
    .spec_src1_addr(spec_inst_lsl_src1_addr),
    .spec_src2_addr(spec_inst_lsl_src2_addr),
    .spec_src3_addr(spec_inst_lsl_src3_addr),
    .spec_dest_addr(spec_inst_lsl_dest_addr),
    .spec_dest_wdata(spec_inst_lsl_dest_wdata),
    .spec_pc_wdata(spec_inst_lsl_pc_wdata),
    .spec_mcr_wdata(spec_inst_lsl_mcr_wdata)
    .spec_mem_addr(spec_inst_lsl_mem_addr),
    .spec_mem_rmask(spec_inst_lsl_mem_rmask),
    .spec_mem_wmask(spec_inst_lsl_mem_wmask),
    .spec_mem_wdata(spec_inst_lsl_mem_wdata)
  );

  wire          spec_inst_lsr_valid;
  wire          spec_inst_lsr_trap;
  wire [ 3 : 0] spec_inst_lsr_src1_addr;
  wire [ 3 : 0] spec_inst_lsr_src2_addr;
  wire [ 3 : 0] spec_inst_lsr_src3_addr;
  wire [ 3 : 0] spec_inst_lsr_dest_addr;
  wire [31 : 0] spec_inst_lsr_dest_wdata;
  wire [31 : 0] spec_inst_lsr_pc_wdata;
  wire [ 3 : 0] spec_inst_lsr_mcr_wmask;
  wire [31 : 0] spec_inst_lsr_mcr_wdata;
  wire [31 : 0] spec_inst_lsr_mem_addr;
  wire [ 3 : 0] spec_inst_lsr_mem_rmask;
  wire [ 3 : 0] spec_inst_lsr_mem_wmask;
  wire [31 : 0] spec_inst_lsr_mem_wdata;

  mfi_inst_lsr inst_lsr (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_lsr_valid),
    .spec_trap(spec_inst_lsr_trap),
    .spec_src1_addr(spec_inst_lsr_src1_addr),
    .spec_src2_addr(spec_inst_lsr_src2_addr),
    .spec_src3_addr(spec_inst_lsr_src3_addr),
    .spec_dest_addr(spec_inst_lsr_dest_addr),
    .spec_dest_wdata(spec_inst_lsr_dest_wdata),
    .spec_pc_wdata(spec_inst_lsr_pc_wdata),
    .spec_mcr_wdata(spec_inst_lsr_mcr_wdata)
    .spec_mem_addr(spec_inst_lsr_mem_addr),
    .spec_mem_rmask(spec_inst_lsr_mem_rmask),
    .spec_mem_wmask(spec_inst_lsr_mem_wmask),
    .spec_mem_wdata(spec_inst_lsr_mem_wdata)
  );

  wire          spec_inst_mf_valid;
  wire          spec_inst_mf_trap;
  wire [ 3 : 0] spec_inst_mf_src1_addr;
  wire [ 3 : 0] spec_inst_mf_src2_addr;
  wire [ 3 : 0] spec_inst_mf_src3_addr;
  wire [ 3 : 0] spec_inst_mf_dest_addr;
  wire [31 : 0] spec_inst_mf_dest_wdata;
  wire [31 : 0] spec_inst_mf_pc_wdata;
  wire [ 3 : 0] spec_inst_mf_mcr_wmask;
  wire [31 : 0] spec_inst_mf_mcr_wdata;
  wire [31 : 0] spec_inst_mf_mem_addr;
  wire [ 3 : 0] spec_inst_mf_mem_rmask;
  wire [ 3 : 0] spec_inst_mf_mem_wmask;
  wire [31 : 0] spec_inst_mf_mem_wdata;

  mfi_inst_mf inst_mf (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_mf_valid),
    .spec_trap(spec_inst_mf_trap),
    .spec_src1_addr(spec_inst_mf_src1_addr),
    .spec_src2_addr(spec_inst_mf_src2_addr),
    .spec_src3_addr(spec_inst_mf_src3_addr),
    .spec_dest_addr(spec_inst_mf_dest_addr),
    .spec_dest_wdata(spec_inst_mf_dest_wdata),
    .spec_pc_wdata(spec_inst_mf_pc_wdata),
    .spec_mcr_wdata(spec_inst_mf_mcr_wdata)
    .spec_mem_addr(spec_inst_mf_mem_addr),
    .spec_mem_rmask(spec_inst_mf_mem_rmask),
    .spec_mem_wmask(spec_inst_mf_mem_wmask),
    .spec_mem_wdata(spec_inst_mf_mem_wdata)
  );

  wire          spec_inst_mfi_valid;
  wire          spec_inst_mfi_trap;
  wire [ 3 : 0] spec_inst_mfi_src1_addr;
  wire [ 3 : 0] spec_inst_mfi_src2_addr;
  wire [ 3 : 0] spec_inst_mfi_src3_addr;
  wire [ 3 : 0] spec_inst_mfi_dest_addr;
  wire [31 : 0] spec_inst_mfi_dest_wdata;
  wire [31 : 0] spec_inst_mfi_pc_wdata;
  wire [ 3 : 0] spec_inst_mfi_mcr_wmask;
  wire [31 : 0] spec_inst_mfi_mcr_wdata;
  wire [31 : 0] spec_inst_mfi_mem_addr;
  wire [ 3 : 0] spec_inst_mfi_mem_rmask;
  wire [ 3 : 0] spec_inst_mfi_mem_wmask;
  wire [31 : 0] spec_inst_mfi_mem_wdata;

  mfi_inst_mfi inst_mfi (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_mfi_valid),
    .spec_trap(spec_inst_mfi_trap),
    .spec_src1_addr(spec_inst_mfi_src1_addr),
    .spec_src2_addr(spec_inst_mfi_src2_addr),
    .spec_src3_addr(spec_inst_mfi_src3_addr),
    .spec_dest_addr(spec_inst_mfi_dest_addr),
    .spec_dest_wdata(spec_inst_mfi_dest_wdata),
    .spec_pc_wdata(spec_inst_mfi_pc_wdata),
    .spec_mcr_wdata(spec_inst_mfi_mcr_wdata)
    .spec_mem_addr(spec_inst_mfi_mem_addr),
    .spec_mem_rmask(spec_inst_mfi_mem_rmask),
    .spec_mem_wmask(spec_inst_mfi_mem_wmask),
    .spec_mem_wdata(spec_inst_mfi_mem_wdata)
  );

  wire          spec_inst_mfrc_valid;
  wire          spec_inst_mfrc_trap;
  wire [ 3 : 0] spec_inst_mfrc_src1_addr;
  wire [ 3 : 0] spec_inst_mfrc_src2_addr;
  wire [ 3 : 0] spec_inst_mfrc_src3_addr;
  wire [ 3 : 0] spec_inst_mfrc_dest_addr;
  wire [31 : 0] spec_inst_mfrc_dest_wdata;
  wire [31 : 0] spec_inst_mfrc_pc_wdata;
  wire [ 3 : 0] spec_inst_mfrc_mcr_wmask;
  wire [31 : 0] spec_inst_mfrc_mcr_wdata;
  wire [31 : 0] spec_inst_mfrc_mem_addr;
  wire [ 3 : 0] spec_inst_mfrc_mem_rmask;
  wire [ 3 : 0] spec_inst_mfrc_mem_wmask;
  wire [31 : 0] spec_inst_mfrc_mem_wdata;

  mfi_inst_mfrc inst_mfrc (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_mfrc_valid),
    .spec_trap(spec_inst_mfrc_trap),
    .spec_src1_addr(spec_inst_mfrc_src1_addr),
    .spec_src2_addr(spec_inst_mfrc_src2_addr),
    .spec_src3_addr(spec_inst_mfrc_src3_addr),
    .spec_dest_addr(spec_inst_mfrc_dest_addr),
    .spec_dest_wdata(spec_inst_mfrc_dest_wdata),
    .spec_pc_wdata(spec_inst_mfrc_pc_wdata),
    .spec_mcr_wdata(spec_inst_mfrc_mcr_wdata)
    .spec_mem_addr(spec_inst_mfrc_mem_addr),
    .spec_mem_rmask(spec_inst_mfrc_mem_rmask),
    .spec_mem_wmask(spec_inst_mfrc_mem_wmask),
    .spec_mem_wdata(spec_inst_mfrc_mem_wdata)
  );

  wire          spec_inst_mov_valid;
  wire          spec_inst_mov_trap;
  wire [ 3 : 0] spec_inst_mov_src1_addr;
  wire [ 3 : 0] spec_inst_mov_src2_addr;
  wire [ 3 : 0] spec_inst_mov_src3_addr;
  wire [ 3 : 0] spec_inst_mov_dest_addr;
  wire [31 : 0] spec_inst_mov_dest_wdata;
  wire [31 : 0] spec_inst_mov_pc_wdata;
  wire [ 3 : 0] spec_inst_mov_mcr_wmask;
  wire [31 : 0] spec_inst_mov_mcr_wdata;
  wire [31 : 0] spec_inst_mov_mem_addr;
  wire [ 3 : 0] spec_inst_mov_mem_rmask;
  wire [ 3 : 0] spec_inst_mov_mem_wmask;
  wire [31 : 0] spec_inst_mov_mem_wdata;

  mfi_inst_mov inst_mov (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_mov_valid),
    .spec_trap(spec_inst_mov_trap),
    .spec_src1_addr(spec_inst_mov_src1_addr),
    .spec_src2_addr(spec_inst_mov_src2_addr),
    .spec_src3_addr(spec_inst_mov_src3_addr),
    .spec_dest_addr(spec_inst_mov_dest_addr),
    .spec_dest_wdata(spec_inst_mov_dest_wdata),
    .spec_pc_wdata(spec_inst_mov_pc_wdata),
    .spec_mcr_wdata(spec_inst_mov_mcr_wdata)
    .spec_mem_addr(spec_inst_mov_mem_addr),
    .spec_mem_rmask(spec_inst_mov_mem_rmask),
    .spec_mem_wmask(spec_inst_mov_mem_wmask),
    .spec_mem_wdata(spec_inst_mov_mem_wdata)
  );

  wire          spec_inst_movi_valid;
  wire          spec_inst_movi_trap;
  wire [ 3 : 0] spec_inst_movi_src1_addr;
  wire [ 3 : 0] spec_inst_movi_src2_addr;
  wire [ 3 : 0] spec_inst_movi_src3_addr;
  wire [ 3 : 0] spec_inst_movi_dest_addr;
  wire [31 : 0] spec_inst_movi_dest_wdata;
  wire [31 : 0] spec_inst_movi_pc_wdata;
  wire [ 3 : 0] spec_inst_movi_mcr_wmask;
  wire [31 : 0] spec_inst_movi_mcr_wdata;
  wire [31 : 0] spec_inst_movi_mem_addr;
  wire [ 3 : 0] spec_inst_movi_mem_rmask;
  wire [ 3 : 0] spec_inst_movi_mem_wmask;
  wire [31 : 0] spec_inst_movi_mem_wdata;

  mfi_inst_movi inst_movi (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_movi_valid),
    .spec_trap(spec_inst_movi_trap),
    .spec_src1_addr(spec_inst_movi_src1_addr),
    .spec_src2_addr(spec_inst_movi_src2_addr),
    .spec_src3_addr(spec_inst_movi_src3_addr),
    .spec_dest_addr(spec_inst_movi_dest_addr),
    .spec_dest_wdata(spec_inst_movi_dest_wdata),
    .spec_pc_wdata(spec_inst_movi_pc_wdata),
    .spec_mcr_wdata(spec_inst_movi_mcr_wdata)
    .spec_mem_addr(spec_inst_movi_mem_addr),
    .spec_mem_rmask(spec_inst_movi_mem_rmask),
    .spec_mem_wmask(spec_inst_movi_mem_wmask),
    .spec_mem_wdata(spec_inst_movi_mem_wdata)
  );

  wire          spec_inst_movl_valid;
  wire          spec_inst_movl_trap;
  wire [ 3 : 0] spec_inst_movl_src1_addr;
  wire [ 3 : 0] spec_inst_movl_src2_addr;
  wire [ 3 : 0] spec_inst_movl_src3_addr;
  wire [ 3 : 0] spec_inst_movl_dest_addr;
  wire [31 : 0] spec_inst_movl_dest_wdata;
  wire [31 : 0] spec_inst_movl_pc_wdata;
  wire [ 3 : 0] spec_inst_movl_mcr_wmask;
  wire [31 : 0] spec_inst_movl_mcr_wdata;
  wire [31 : 0] spec_inst_movl_mem_addr;
  wire [ 3 : 0] spec_inst_movl_mem_rmask;
  wire [ 3 : 0] spec_inst_movl_mem_wmask;
  wire [31 : 0] spec_inst_movl_mem_wdata;

  mfi_inst_movl inst_movl (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_movl_valid),
    .spec_trap(spec_inst_movl_trap),
    .spec_src1_addr(spec_inst_movl_src1_addr),
    .spec_src2_addr(spec_inst_movl_src2_addr),
    .spec_src3_addr(spec_inst_movl_src3_addr),
    .spec_dest_addr(spec_inst_movl_dest_addr),
    .spec_dest_wdata(spec_inst_movl_dest_wdata),
    .spec_pc_wdata(spec_inst_movl_pc_wdata),
    .spec_mcr_wdata(spec_inst_movl_mcr_wdata)
    .spec_mem_addr(spec_inst_movl_mem_addr),
    .spec_mem_rmask(spec_inst_movl_mem_rmask),
    .spec_mem_wmask(spec_inst_movl_mem_wmask),
    .spec_mem_wdata(spec_inst_movl_mem_wdata)
  );

  wire          spec_inst_movu_valid;
  wire          spec_inst_movu_trap;
  wire [ 3 : 0] spec_inst_movu_src1_addr;
  wire [ 3 : 0] spec_inst_movu_src2_addr;
  wire [ 3 : 0] spec_inst_movu_src3_addr;
  wire [ 3 : 0] spec_inst_movu_dest_addr;
  wire [31 : 0] spec_inst_movu_dest_wdata;
  wire [31 : 0] spec_inst_movu_pc_wdata;
  wire [ 3 : 0] spec_inst_movu_mcr_wmask;
  wire [31 : 0] spec_inst_movu_mcr_wdata;
  wire [31 : 0] spec_inst_movu_mem_addr;
  wire [ 3 : 0] spec_inst_movu_mem_rmask;
  wire [ 3 : 0] spec_inst_movu_mem_wmask;
  wire [31 : 0] spec_inst_movu_mem_wdata;

  mfi_inst_movu inst_movu (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_movu_valid),
    .spec_trap(spec_inst_movu_trap),
    .spec_src1_addr(spec_inst_movu_src1_addr),
    .spec_src2_addr(spec_inst_movu_src2_addr),
    .spec_src3_addr(spec_inst_movu_src3_addr),
    .spec_dest_addr(spec_inst_movu_dest_addr),
    .spec_dest_wdata(spec_inst_movu_dest_wdata),
    .spec_pc_wdata(spec_inst_movu_pc_wdata),
    .spec_mcr_wdata(spec_inst_movu_mcr_wdata)
    .spec_mem_addr(spec_inst_movu_mem_addr),
    .spec_mem_rmask(spec_inst_movu_mem_rmask),
    .spec_mem_wmask(spec_inst_movu_mem_wmask),
    .spec_mem_wdata(spec_inst_movu_mem_wdata)
  );

  wire          spec_inst_mt_valid;
  wire          spec_inst_mt_trap;
  wire [ 3 : 0] spec_inst_mt_src1_addr;
  wire [ 3 : 0] spec_inst_mt_src2_addr;
  wire [ 3 : 0] spec_inst_mt_src3_addr;
  wire [ 3 : 0] spec_inst_mt_dest_addr;
  wire [31 : 0] spec_inst_mt_dest_wdata;
  wire [31 : 0] spec_inst_mt_pc_wdata;
  wire [ 3 : 0] spec_inst_mt_mcr_wmask;
  wire [31 : 0] spec_inst_mt_mcr_wdata;
  wire [31 : 0] spec_inst_mt_mem_addr;
  wire [ 3 : 0] spec_inst_mt_mem_rmask;
  wire [ 3 : 0] spec_inst_mt_mem_wmask;
  wire [31 : 0] spec_inst_mt_mem_wdata;

  mfi_inst_mt inst_mt (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_mt_valid),
    .spec_trap(spec_inst_mt_trap),
    .spec_src1_addr(spec_inst_mt_src1_addr),
    .spec_src2_addr(spec_inst_mt_src2_addr),
    .spec_src3_addr(spec_inst_mt_src3_addr),
    .spec_dest_addr(spec_inst_mt_dest_addr),
    .spec_dest_wdata(spec_inst_mt_dest_wdata),
    .spec_pc_wdata(spec_inst_mt_pc_wdata),
    .spec_mcr_wdata(spec_inst_mt_mcr_wdata)
    .spec_mem_addr(spec_inst_mt_mem_addr),
    .spec_mem_rmask(spec_inst_mt_mem_rmask),
    .spec_mem_wmask(spec_inst_mt_mem_wmask),
    .spec_mem_wdata(spec_inst_mt_mem_wdata)
  );

  wire          spec_inst_mti_valid;
  wire          spec_inst_mti_trap;
  wire [ 3 : 0] spec_inst_mti_src1_addr;
  wire [ 3 : 0] spec_inst_mti_src2_addr;
  wire [ 3 : 0] spec_inst_mti_src3_addr;
  wire [ 3 : 0] spec_inst_mti_dest_addr;
  wire [31 : 0] spec_inst_mti_dest_wdata;
  wire [31 : 0] spec_inst_mti_pc_wdata;
  wire [ 3 : 0] spec_inst_mti_mcr_wmask;
  wire [31 : 0] spec_inst_mti_mcr_wdata;
  wire [31 : 0] spec_inst_mti_mem_addr;
  wire [ 3 : 0] spec_inst_mti_mem_rmask;
  wire [ 3 : 0] spec_inst_mti_mem_wmask;
  wire [31 : 0] spec_inst_mti_mem_wdata;

  mfi_inst_mti inst_mti (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_mti_valid),
    .spec_trap(spec_inst_mti_trap),
    .spec_src1_addr(spec_inst_mti_src1_addr),
    .spec_src2_addr(spec_inst_mti_src2_addr),
    .spec_src3_addr(spec_inst_mti_src3_addr),
    .spec_dest_addr(spec_inst_mti_dest_addr),
    .spec_dest_wdata(spec_inst_mti_dest_wdata),
    .spec_pc_wdata(spec_inst_mti_pc_wdata),
    .spec_mcr_wdata(spec_inst_mti_mcr_wdata)
    .spec_mem_addr(spec_inst_mti_mem_addr),
    .spec_mem_rmask(spec_inst_mti_mem_rmask),
    .spec_mem_wmask(spec_inst_mti_mem_wmask),
    .spec_mem_wdata(spec_inst_mti_mem_wdata)
  );

  wire          spec_inst_nand_valid;
  wire          spec_inst_nand_trap;
  wire [ 3 : 0] spec_inst_nand_src1_addr;
  wire [ 3 : 0] spec_inst_nand_src2_addr;
  wire [ 3 : 0] spec_inst_nand_src3_addr;
  wire [ 3 : 0] spec_inst_nand_dest_addr;
  wire [31 : 0] spec_inst_nand_dest_wdata;
  wire [31 : 0] spec_inst_nand_pc_wdata;
  wire [ 3 : 0] spec_inst_nand_mcr_wmask;
  wire [31 : 0] spec_inst_nand_mcr_wdata;
  wire [31 : 0] spec_inst_nand_mem_addr;
  wire [ 3 : 0] spec_inst_nand_mem_rmask;
  wire [ 3 : 0] spec_inst_nand_mem_wmask;
  wire [31 : 0] spec_inst_nand_mem_wdata;

  mfi_inst_nand inst_nand (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_nand_valid),
    .spec_trap(spec_inst_nand_trap),
    .spec_src1_addr(spec_inst_nand_src1_addr),
    .spec_src2_addr(spec_inst_nand_src2_addr),
    .spec_src3_addr(spec_inst_nand_src3_addr),
    .spec_dest_addr(spec_inst_nand_dest_addr),
    .spec_dest_wdata(spec_inst_nand_dest_wdata),
    .spec_pc_wdata(spec_inst_nand_pc_wdata),
    .spec_mcr_wdata(spec_inst_nand_mcr_wdata)
    .spec_mem_addr(spec_inst_nand_mem_addr),
    .spec_mem_rmask(spec_inst_nand_mem_rmask),
    .spec_mem_wmask(spec_inst_nand_mem_wmask),
    .spec_mem_wdata(spec_inst_nand_mem_wdata)
  );

  wire          spec_inst_nandi_valid;
  wire          spec_inst_nandi_trap;
  wire [ 3 : 0] spec_inst_nandi_src1_addr;
  wire [ 3 : 0] spec_inst_nandi_src2_addr;
  wire [ 3 : 0] spec_inst_nandi_src3_addr;
  wire [ 3 : 0] spec_inst_nandi_dest_addr;
  wire [31 : 0] spec_inst_nandi_dest_wdata;
  wire [31 : 0] spec_inst_nandi_pc_wdata;
  wire [ 3 : 0] spec_inst_nandi_mcr_wmask;
  wire [31 : 0] spec_inst_nandi_mcr_wdata;
  wire [31 : 0] spec_inst_nandi_mem_addr;
  wire [ 3 : 0] spec_inst_nandi_mem_rmask;
  wire [ 3 : 0] spec_inst_nandi_mem_wmask;
  wire [31 : 0] spec_inst_nandi_mem_wdata;

  mfi_inst_nandi inst_nandi (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_nandi_valid),
    .spec_trap(spec_inst_nandi_trap),
    .spec_src1_addr(spec_inst_nandi_src1_addr),
    .spec_src2_addr(spec_inst_nandi_src2_addr),
    .spec_src3_addr(spec_inst_nandi_src3_addr),
    .spec_dest_addr(spec_inst_nandi_dest_addr),
    .spec_dest_wdata(spec_inst_nandi_dest_wdata),
    .spec_pc_wdata(spec_inst_nandi_pc_wdata),
    .spec_mcr_wdata(spec_inst_nandi_mcr_wdata)
    .spec_mem_addr(spec_inst_nandi_mem_addr),
    .spec_mem_rmask(spec_inst_nandi_mem_rmask),
    .spec_mem_wmask(spec_inst_nandi_mem_wmask),
    .spec_mem_wdata(spec_inst_nandi_mem_wdata)
  );

  wire          spec_inst_nop_valid;
  wire          spec_inst_nop_trap;
  wire [ 3 : 0] spec_inst_nop_src1_addr;
  wire [ 3 : 0] spec_inst_nop_src2_addr;
  wire [ 3 : 0] spec_inst_nop_src3_addr;
  wire [ 3 : 0] spec_inst_nop_dest_addr;
  wire [31 : 0] spec_inst_nop_dest_wdata;
  wire [31 : 0] spec_inst_nop_pc_wdata;
  wire [ 3 : 0] spec_inst_nop_mcr_wmask;
  wire [31 : 0] spec_inst_nop_mcr_wdata;
  wire [31 : 0] spec_inst_nop_mem_addr;
  wire [ 3 : 0] spec_inst_nop_mem_rmask;
  wire [ 3 : 0] spec_inst_nop_mem_wmask;
  wire [31 : 0] spec_inst_nop_mem_wdata;

  mfi_inst_nop inst_nop (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_nop_valid),
    .spec_trap(spec_inst_nop_trap),
    .spec_src1_addr(spec_inst_nop_src1_addr),
    .spec_src2_addr(spec_inst_nop_src2_addr),
    .spec_src3_addr(spec_inst_nop_src3_addr),
    .spec_dest_addr(spec_inst_nop_dest_addr),
    .spec_dest_wdata(spec_inst_nop_dest_wdata),
    .spec_pc_wdata(spec_inst_nop_pc_wdata),
    .spec_mcr_wdata(spec_inst_nop_mcr_wdata)
    .spec_mem_addr(spec_inst_nop_mem_addr),
    .spec_mem_rmask(spec_inst_nop_mem_rmask),
    .spec_mem_wmask(spec_inst_nop_mem_wmask),
    .spec_mem_wdata(spec_inst_nop_mem_wdata)
  );

  wire          spec_inst_or_valid;
  wire          spec_inst_or_trap;
  wire [ 3 : 0] spec_inst_or_src1_addr;
  wire [ 3 : 0] spec_inst_or_src2_addr;
  wire [ 3 : 0] spec_inst_or_src3_addr;
  wire [ 3 : 0] spec_inst_or_dest_addr;
  wire [31 : 0] spec_inst_or_dest_wdata;
  wire [31 : 0] spec_inst_or_pc_wdata;
  wire [ 3 : 0] spec_inst_or_mcr_wmask;
  wire [31 : 0] spec_inst_or_mcr_wdata;
  wire [31 : 0] spec_inst_or_mem_addr;
  wire [ 3 : 0] spec_inst_or_mem_rmask;
  wire [ 3 : 0] spec_inst_or_mem_wmask;
  wire [31 : 0] spec_inst_or_mem_wdata;

  mfi_inst_or inst_or (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_or_valid),
    .spec_trap(spec_inst_or_trap),
    .spec_src1_addr(spec_inst_or_src1_addr),
    .spec_src2_addr(spec_inst_or_src2_addr),
    .spec_src3_addr(spec_inst_or_src3_addr),
    .spec_dest_addr(spec_inst_or_dest_addr),
    .spec_dest_wdata(spec_inst_or_dest_wdata),
    .spec_pc_wdata(spec_inst_or_pc_wdata),
    .spec_mcr_wdata(spec_inst_or_mcr_wdata)
    .spec_mem_addr(spec_inst_or_mem_addr),
    .spec_mem_rmask(spec_inst_or_mem_rmask),
    .spec_mem_wmask(spec_inst_or_mem_wmask),
    .spec_mem_wdata(spec_inst_or_mem_wdata)
  );

  wire          spec_inst_ori_valid;
  wire          spec_inst_ori_trap;
  wire [ 3 : 0] spec_inst_ori_src1_addr;
  wire [ 3 : 0] spec_inst_ori_src2_addr;
  wire [ 3 : 0] spec_inst_ori_src3_addr;
  wire [ 3 : 0] spec_inst_ori_dest_addr;
  wire [31 : 0] spec_inst_ori_dest_wdata;
  wire [31 : 0] spec_inst_ori_pc_wdata;
  wire [ 3 : 0] spec_inst_ori_mcr_wmask;
  wire [31 : 0] spec_inst_ori_mcr_wdata;
  wire [31 : 0] spec_inst_ori_mem_addr;
  wire [ 3 : 0] spec_inst_ori_mem_rmask;
  wire [ 3 : 0] spec_inst_ori_mem_wmask;
  wire [31 : 0] spec_inst_ori_mem_wdata;

  mfi_inst_ori inst_ori (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_ori_valid),
    .spec_trap(spec_inst_ori_trap),
    .spec_src1_addr(spec_inst_ori_src1_addr),
    .spec_src2_addr(spec_inst_ori_src2_addr),
    .spec_src3_addr(spec_inst_ori_src3_addr),
    .spec_dest_addr(spec_inst_ori_dest_addr),
    .spec_dest_wdata(spec_inst_ori_dest_wdata),
    .spec_pc_wdata(spec_inst_ori_pc_wdata),
    .spec_mcr_wdata(spec_inst_ori_mcr_wdata)
    .spec_mem_addr(spec_inst_ori_mem_addr),
    .spec_mem_rmask(spec_inst_ori_mem_rmask),
    .spec_mem_wmask(spec_inst_ori_mem_wmask),
    .spec_mem_wdata(spec_inst_ori_mem_wdata)
  );

  wire          spec_inst_pcaddi_valid;
  wire          spec_inst_pcaddi_trap;
  wire [ 3 : 0] spec_inst_pcaddi_src1_addr;
  wire [ 3 : 0] spec_inst_pcaddi_src2_addr;
  wire [ 3 : 0] spec_inst_pcaddi_src3_addr;
  wire [ 3 : 0] spec_inst_pcaddi_dest_addr;
  wire [31 : 0] spec_inst_pcaddi_dest_wdata;
  wire [31 : 0] spec_inst_pcaddi_pc_wdata;
  wire [ 3 : 0] spec_inst_pcaddi_mcr_wmask;
  wire [31 : 0] spec_inst_pcaddi_mcr_wdata;
  wire [31 : 0] spec_inst_pcaddi_mem_addr;
  wire [ 3 : 0] spec_inst_pcaddi_mem_rmask;
  wire [ 3 : 0] spec_inst_pcaddi_mem_wmask;
  wire [31 : 0] spec_inst_pcaddi_mem_wdata;

  mfi_inst_pcaddi inst_pcaddi (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_pcaddi_valid),
    .spec_trap(spec_inst_pcaddi_trap),
    .spec_src1_addr(spec_inst_pcaddi_src1_addr),
    .spec_src2_addr(spec_inst_pcaddi_src2_addr),
    .spec_src3_addr(spec_inst_pcaddi_src3_addr),
    .spec_dest_addr(spec_inst_pcaddi_dest_addr),
    .spec_dest_wdata(spec_inst_pcaddi_dest_wdata),
    .spec_pc_wdata(spec_inst_pcaddi_pc_wdata),
    .spec_mcr_wdata(spec_inst_pcaddi_mcr_wdata)
    .spec_mem_addr(spec_inst_pcaddi_mem_addr),
    .spec_mem_rmask(spec_inst_pcaddi_mem_rmask),
    .spec_mem_wmask(spec_inst_pcaddi_mem_wmask),
    .spec_mem_wdata(spec_inst_pcaddi_mem_wdata)
  );

  wire          spec_inst_rasr_valid;
  wire          spec_inst_rasr_trap;
  wire [ 3 : 0] spec_inst_rasr_src1_addr;
  wire [ 3 : 0] spec_inst_rasr_src2_addr;
  wire [ 3 : 0] spec_inst_rasr_src3_addr;
  wire [ 3 : 0] spec_inst_rasr_dest_addr;
  wire [31 : 0] spec_inst_rasr_dest_wdata;
  wire [31 : 0] spec_inst_rasr_pc_wdata;
  wire [ 3 : 0] spec_inst_rasr_mcr_wmask;
  wire [31 : 0] spec_inst_rasr_mcr_wdata;
  wire [31 : 0] spec_inst_rasr_mem_addr;
  wire [ 3 : 0] spec_inst_rasr_mem_rmask;
  wire [ 3 : 0] spec_inst_rasr_mem_wmask;
  wire [31 : 0] spec_inst_rasr_mem_wdata;

  mfi_inst_rasr inst_rasr (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rasr_valid),
    .spec_trap(spec_inst_rasr_trap),
    .spec_src1_addr(spec_inst_rasr_src1_addr),
    .spec_src2_addr(spec_inst_rasr_src2_addr),
    .spec_src3_addr(spec_inst_rasr_src3_addr),
    .spec_dest_addr(spec_inst_rasr_dest_addr),
    .spec_dest_wdata(spec_inst_rasr_dest_wdata),
    .spec_pc_wdata(spec_inst_rasr_pc_wdata),
    .spec_mcr_wdata(spec_inst_rasr_mcr_wdata)
    .spec_mem_addr(spec_inst_rasr_mem_addr),
    .spec_mem_rmask(spec_inst_rasr_mem_rmask),
    .spec_mem_wmask(spec_inst_rasr_mem_wmask),
    .spec_mem_wdata(spec_inst_rasr_mem_wdata)
  );

  wire          spec_inst_rbra_valid;
  wire          spec_inst_rbra_trap;
  wire [ 3 : 0] spec_inst_rbra_src1_addr;
  wire [ 3 : 0] spec_inst_rbra_src2_addr;
  wire [ 3 : 0] spec_inst_rbra_src3_addr;
  wire [ 3 : 0] spec_inst_rbra_dest_addr;
  wire [31 : 0] spec_inst_rbra_dest_wdata;
  wire [31 : 0] spec_inst_rbra_pc_wdata;
  wire [ 3 : 0] spec_inst_rbra_mcr_wmask;
  wire [31 : 0] spec_inst_rbra_mcr_wdata;
  wire [31 : 0] spec_inst_rbra_mem_addr;
  wire [ 3 : 0] spec_inst_rbra_mem_rmask;
  wire [ 3 : 0] spec_inst_rbra_mem_wmask;
  wire [31 : 0] spec_inst_rbra_mem_wdata;

  mfi_inst_rbra inst_rbra (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rbra_valid),
    .spec_trap(spec_inst_rbra_trap),
    .spec_src1_addr(spec_inst_rbra_src1_addr),
    .spec_src2_addr(spec_inst_rbra_src2_addr),
    .spec_src3_addr(spec_inst_rbra_src3_addr),
    .spec_dest_addr(spec_inst_rbra_dest_addr),
    .spec_dest_wdata(spec_inst_rbra_dest_wdata),
    .spec_pc_wdata(spec_inst_rbra_pc_wdata),
    .spec_mcr_wdata(spec_inst_rbra_mcr_wdata)
    .spec_mem_addr(spec_inst_rbra_mem_addr),
    .spec_mem_rmask(spec_inst_rbra_mem_rmask),
    .spec_mem_wmask(spec_inst_rbra_mem_wmask),
    .spec_mem_wdata(spec_inst_rbra_mem_wdata)
  );

  wire          spec_inst_rcall_valid;
  wire          spec_inst_rcall_trap;
  wire [ 3 : 0] spec_inst_rcall_src1_addr;
  wire [ 3 : 0] spec_inst_rcall_src2_addr;
  wire [ 3 : 0] spec_inst_rcall_src3_addr;
  wire [ 3 : 0] spec_inst_rcall_dest_addr;
  wire [31 : 0] spec_inst_rcall_dest_wdata;
  wire [31 : 0] spec_inst_rcall_pc_wdata;
  wire [ 3 : 0] spec_inst_rcall_mcr_wmask;
  wire [31 : 0] spec_inst_rcall_mcr_wdata;
  wire [31 : 0] spec_inst_rcall_mem_addr;
  wire [ 3 : 0] spec_inst_rcall_mem_rmask;
  wire [ 3 : 0] spec_inst_rcall_mem_wmask;
  wire [31 : 0] spec_inst_rcall_mem_wdata;

  mfi_inst_rcall inst_rcall (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rcall_valid),
    .spec_trap(spec_inst_rcall_trap),
    .spec_src1_addr(spec_inst_rcall_src1_addr),
    .spec_src2_addr(spec_inst_rcall_src2_addr),
    .spec_src3_addr(spec_inst_rcall_src3_addr),
    .spec_dest_addr(spec_inst_rcall_dest_addr),
    .spec_dest_wdata(spec_inst_rcall_dest_wdata),
    .spec_pc_wdata(spec_inst_rcall_pc_wdata),
    .spec_mcr_wdata(spec_inst_rcall_mcr_wdata)
    .spec_mem_addr(spec_inst_rcall_mem_addr),
    .spec_mem_rmask(spec_inst_rcall_mem_rmask),
    .spec_mem_wmask(spec_inst_rcall_mem_wmask),
    .spec_mem_wdata(spec_inst_rcall_mem_wdata)
  );

  wire          spec_inst_ret_valid;
  wire          spec_inst_ret_trap;
  wire [ 3 : 0] spec_inst_ret_src1_addr;
  wire [ 3 : 0] spec_inst_ret_src2_addr;
  wire [ 3 : 0] spec_inst_ret_src3_addr;
  wire [ 3 : 0] spec_inst_ret_dest_addr;
  wire [31 : 0] spec_inst_ret_dest_wdata;
  wire [31 : 0] spec_inst_ret_pc_wdata;
  wire [ 3 : 0] spec_inst_ret_mcr_wmask;
  wire [31 : 0] spec_inst_ret_mcr_wdata;
  wire [31 : 0] spec_inst_ret_mem_addr;
  wire [ 3 : 0] spec_inst_ret_mem_rmask;
  wire [ 3 : 0] spec_inst_ret_mem_wmask;
  wire [31 : 0] spec_inst_ret_mem_wdata;

  mfi_inst_ret inst_ret (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_ret_valid),
    .spec_trap(spec_inst_ret_trap),
    .spec_src1_addr(spec_inst_ret_src1_addr),
    .spec_src2_addr(spec_inst_ret_src2_addr),
    .spec_src3_addr(spec_inst_ret_src3_addr),
    .spec_dest_addr(spec_inst_ret_dest_addr),
    .spec_dest_wdata(spec_inst_ret_dest_wdata),
    .spec_pc_wdata(spec_inst_ret_pc_wdata),
    .spec_mcr_wdata(spec_inst_ret_mcr_wdata)
    .spec_mem_addr(spec_inst_ret_mem_addr),
    .spec_mem_rmask(spec_inst_ret_mem_rmask),
    .spec_mem_wmask(spec_inst_ret_mem_wmask),
    .spec_mem_wdata(spec_inst_ret_mem_wdata)
  );

  wire          spec_inst_rld_valid;
  wire          spec_inst_rld_trap;
  wire [ 3 : 0] spec_inst_rld_src1_addr;
  wire [ 3 : 0] spec_inst_rld_src2_addr;
  wire [ 3 : 0] spec_inst_rld_src3_addr;
  wire [ 3 : 0] spec_inst_rld_dest_addr;
  wire [31 : 0] spec_inst_rld_dest_wdata;
  wire [31 : 0] spec_inst_rld_pc_wdata;
  wire [ 3 : 0] spec_inst_rld_mcr_wmask;
  wire [31 : 0] spec_inst_rld_mcr_wdata;
  wire [31 : 0] spec_inst_rld_mem_addr;
  wire [ 3 : 0] spec_inst_rld_mem_rmask;
  wire [ 3 : 0] spec_inst_rld_mem_wmask;
  wire [31 : 0] spec_inst_rld_mem_wdata;

  mfi_inst_rld inst_rld (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rld_valid),
    .spec_trap(spec_inst_rld_trap),
    .spec_src1_addr(spec_inst_rld_src1_addr),
    .spec_src2_addr(spec_inst_rld_src2_addr),
    .spec_src3_addr(spec_inst_rld_src3_addr),
    .spec_dest_addr(spec_inst_rld_dest_addr),
    .spec_dest_wdata(spec_inst_rld_dest_wdata),
    .spec_pc_wdata(spec_inst_rld_pc_wdata),
    .spec_mcr_wdata(spec_inst_rld_mcr_wdata)
    .spec_mem_addr(spec_inst_rld_mem_addr),
    .spec_mem_rmask(spec_inst_rld_mem_rmask),
    .spec_mem_wmask(spec_inst_rld_mem_wmask),
    .spec_mem_wdata(spec_inst_rld_mem_wdata)
  );

  wire          spec_inst_rldb_valid;
  wire          spec_inst_rldb_trap;
  wire [ 3 : 0] spec_inst_rldb_src1_addr;
  wire [ 3 : 0] spec_inst_rldb_src2_addr;
  wire [ 3 : 0] spec_inst_rldb_src3_addr;
  wire [ 3 : 0] spec_inst_rldb_dest_addr;
  wire [31 : 0] spec_inst_rldb_dest_wdata;
  wire [31 : 0] spec_inst_rldb_pc_wdata;
  wire [ 3 : 0] spec_inst_rldb_mcr_wmask;
  wire [31 : 0] spec_inst_rldb_mcr_wdata;
  wire [31 : 0] spec_inst_rldb_mem_addr;
  wire [ 3 : 0] spec_inst_rldb_mem_rmask;
  wire [ 3 : 0] spec_inst_rldb_mem_wmask;
  wire [31 : 0] spec_inst_rldb_mem_wdata;

  mfi_inst_rldb inst_rldb (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rldb_valid),
    .spec_trap(spec_inst_rldb_trap),
    .spec_src1_addr(spec_inst_rldb_src1_addr),
    .spec_src2_addr(spec_inst_rldb_src2_addr),
    .spec_src3_addr(spec_inst_rldb_src3_addr),
    .spec_dest_addr(spec_inst_rldb_dest_addr),
    .spec_dest_wdata(spec_inst_rldb_dest_wdata),
    .spec_pc_wdata(spec_inst_rldb_pc_wdata),
    .spec_mcr_wdata(spec_inst_rldb_mcr_wdata)
    .spec_mem_addr(spec_inst_rldb_mem_addr),
    .spec_mem_rmask(spec_inst_rldb_mem_rmask),
    .spec_mem_wmask(spec_inst_rldb_mem_wmask),
    .spec_mem_wdata(spec_inst_rldb_mem_wdata)
  );

  wire          spec_inst_rldh_valid;
  wire          spec_inst_rldh_trap;
  wire [ 3 : 0] spec_inst_rldh_src1_addr;
  wire [ 3 : 0] spec_inst_rldh_src2_addr;
  wire [ 3 : 0] spec_inst_rldh_src3_addr;
  wire [ 3 : 0] spec_inst_rldh_dest_addr;
  wire [31 : 0] spec_inst_rldh_dest_wdata;
  wire [31 : 0] spec_inst_rldh_pc_wdata;
  wire [ 3 : 0] spec_inst_rldh_mcr_wmask;
  wire [31 : 0] spec_inst_rldh_mcr_wdata;
  wire [31 : 0] spec_inst_rldh_mem_addr;
  wire [ 3 : 0] spec_inst_rldh_mem_rmask;
  wire [ 3 : 0] spec_inst_rldh_mem_wmask;
  wire [31 : 0] spec_inst_rldh_mem_wdata;

  mfi_inst_rldh inst_rldh (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rldh_valid),
    .spec_trap(spec_inst_rldh_trap),
    .spec_src1_addr(spec_inst_rldh_src1_addr),
    .spec_src2_addr(spec_inst_rldh_src2_addr),
    .spec_src3_addr(spec_inst_rldh_src3_addr),
    .spec_dest_addr(spec_inst_rldh_dest_addr),
    .spec_dest_wdata(spec_inst_rldh_dest_wdata),
    .spec_pc_wdata(spec_inst_rldh_pc_wdata),
    .spec_mcr_wdata(spec_inst_rldh_mcr_wdata)
    .spec_mem_addr(spec_inst_rldh_mem_addr),
    .spec_mem_rmask(spec_inst_rldh_mem_rmask),
    .spec_mem_wmask(spec_inst_rldh_mem_wmask),
    .spec_mem_wdata(spec_inst_rldh_mem_wdata)
  );

  wire          spec_inst_rlsl_valid;
  wire          spec_inst_rlsl_trap;
  wire [ 3 : 0] spec_inst_rlsl_src1_addr;
  wire [ 3 : 0] spec_inst_rlsl_src2_addr;
  wire [ 3 : 0] spec_inst_rlsl_src3_addr;
  wire [ 3 : 0] spec_inst_rlsl_dest_addr;
  wire [31 : 0] spec_inst_rlsl_dest_wdata;
  wire [31 : 0] spec_inst_rlsl_pc_wdata;
  wire [ 3 : 0] spec_inst_rlsl_mcr_wmask;
  wire [31 : 0] spec_inst_rlsl_mcr_wdata;
  wire [31 : 0] spec_inst_rlsl_mem_addr;
  wire [ 3 : 0] spec_inst_rlsl_mem_rmask;
  wire [ 3 : 0] spec_inst_rlsl_mem_wmask;
  wire [31 : 0] spec_inst_rlsl_mem_wdata;

  mfi_inst_rlsl inst_rlsl (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rlsl_valid),
    .spec_trap(spec_inst_rlsl_trap),
    .spec_src1_addr(spec_inst_rlsl_src1_addr),
    .spec_src2_addr(spec_inst_rlsl_src2_addr),
    .spec_src3_addr(spec_inst_rlsl_src3_addr),
    .spec_dest_addr(spec_inst_rlsl_dest_addr),
    .spec_dest_wdata(spec_inst_rlsl_dest_wdata),
    .spec_pc_wdata(spec_inst_rlsl_pc_wdata),
    .spec_mcr_wdata(spec_inst_rlsl_mcr_wdata)
    .spec_mem_addr(spec_inst_rlsl_mem_addr),
    .spec_mem_rmask(spec_inst_rlsl_mem_rmask),
    .spec_mem_wmask(spec_inst_rlsl_mem_wmask),
    .spec_mem_wdata(spec_inst_rlsl_mem_wdata)
  );

  wire          spec_inst_rlsr_valid;
  wire          spec_inst_rlsr_trap;
  wire [ 3 : 0] spec_inst_rlsr_src1_addr;
  wire [ 3 : 0] spec_inst_rlsr_src2_addr;
  wire [ 3 : 0] spec_inst_rlsr_src3_addr;
  wire [ 3 : 0] spec_inst_rlsr_dest_addr;
  wire [31 : 0] spec_inst_rlsr_dest_wdata;
  wire [31 : 0] spec_inst_rlsr_pc_wdata;
  wire [ 3 : 0] spec_inst_rlsr_mcr_wmask;
  wire [31 : 0] spec_inst_rlsr_mcr_wdata;
  wire [31 : 0] spec_inst_rlsr_mem_addr;
  wire [ 3 : 0] spec_inst_rlsr_mem_rmask;
  wire [ 3 : 0] spec_inst_rlsr_mem_wmask;
  wire [31 : 0] spec_inst_rlsr_mem_wdata;

  mfi_inst_rlsr inst_rlsr (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rlsr_valid),
    .spec_trap(spec_inst_rlsr_trap),
    .spec_src1_addr(spec_inst_rlsr_src1_addr),
    .spec_src2_addr(spec_inst_rlsr_src2_addr),
    .spec_src3_addr(spec_inst_rlsr_src3_addr),
    .spec_dest_addr(spec_inst_rlsr_dest_addr),
    .spec_dest_wdata(spec_inst_rlsr_dest_wdata),
    .spec_pc_wdata(spec_inst_rlsr_pc_wdata),
    .spec_mcr_wdata(spec_inst_rlsr_mcr_wdata)
    .spec_mem_addr(spec_inst_rlsr_mem_addr),
    .spec_mem_rmask(spec_inst_rlsr_mem_rmask),
    .spec_mem_wmask(spec_inst_rlsr_mem_wmask),
    .spec_mem_wdata(spec_inst_rlsr_mem_wdata)
  );

  wire          spec_inst_robra_valid;
  wire          spec_inst_robra_trap;
  wire [ 3 : 0] spec_inst_robra_src1_addr;
  wire [ 3 : 0] spec_inst_robra_src2_addr;
  wire [ 3 : 0] spec_inst_robra_src3_addr;
  wire [ 3 : 0] spec_inst_robra_dest_addr;
  wire [31 : 0] spec_inst_robra_dest_wdata;
  wire [31 : 0] spec_inst_robra_pc_wdata;
  wire [ 3 : 0] spec_inst_robra_mcr_wmask;
  wire [31 : 0] spec_inst_robra_mcr_wdata;
  wire [31 : 0] spec_inst_robra_mem_addr;
  wire [ 3 : 0] spec_inst_robra_mem_rmask;
  wire [ 3 : 0] spec_inst_robra_mem_wmask;
  wire [31 : 0] spec_inst_robra_mem_wdata;

  mfi_inst_robra inst_robra (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_robra_valid),
    .spec_trap(spec_inst_robra_trap),
    .spec_src1_addr(spec_inst_robra_src1_addr),
    .spec_src2_addr(spec_inst_robra_src2_addr),
    .spec_src3_addr(spec_inst_robra_src3_addr),
    .spec_dest_addr(spec_inst_robra_dest_addr),
    .spec_dest_wdata(spec_inst_robra_dest_wdata),
    .spec_pc_wdata(spec_inst_robra_pc_wdata),
    .spec_mcr_wdata(spec_inst_robra_mcr_wdata)
    .spec_mem_addr(spec_inst_robra_mem_addr),
    .spec_mem_rmask(spec_inst_robra_mem_rmask),
    .spec_mem_wmask(spec_inst_robra_mem_wmask),
    .spec_mem_wdata(spec_inst_robra_mem_wdata)
  );

  wire          spec_inst_rocall_valid;
  wire          spec_inst_rocall_trap;
  wire [ 3 : 0] spec_inst_rocall_src1_addr;
  wire [ 3 : 0] spec_inst_rocall_src2_addr;
  wire [ 3 : 0] spec_inst_rocall_src3_addr;
  wire [ 3 : 0] spec_inst_rocall_dest_addr;
  wire [31 : 0] spec_inst_rocall_dest_wdata;
  wire [31 : 0] spec_inst_rocall_pc_wdata;
  wire [ 3 : 0] spec_inst_rocall_mcr_wmask;
  wire [31 : 0] spec_inst_rocall_mcr_wdata;
  wire [31 : 0] spec_inst_rocall_mem_addr;
  wire [ 3 : 0] spec_inst_rocall_mem_rmask;
  wire [ 3 : 0] spec_inst_rocall_mem_wmask;
  wire [31 : 0] spec_inst_rocall_mem_wdata;

  mfi_inst_rocall inst_rocall (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rocall_valid),
    .spec_trap(spec_inst_rocall_trap),
    .spec_src1_addr(spec_inst_rocall_src1_addr),
    .spec_src2_addr(spec_inst_rocall_src2_addr),
    .spec_src3_addr(spec_inst_rocall_src3_addr),
    .spec_dest_addr(spec_inst_rocall_dest_addr),
    .spec_dest_wdata(spec_inst_rocall_dest_wdata),
    .spec_pc_wdata(spec_inst_rocall_pc_wdata),
    .spec_mcr_wdata(spec_inst_rocall_mcr_wdata)
    .spec_mem_addr(spec_inst_rocall_mem_addr),
    .spec_mem_rmask(spec_inst_rocall_mem_rmask),
    .spec_mem_wmask(spec_inst_rocall_mem_wmask),
    .spec_mem_wdata(spec_inst_rocall_mem_wdata)
  );

  wire          spec_inst_ror_valid;
  wire          spec_inst_ror_trap;
  wire [ 3 : 0] spec_inst_ror_src1_addr;
  wire [ 3 : 0] spec_inst_ror_src2_addr;
  wire [ 3 : 0] spec_inst_ror_src3_addr;
  wire [ 3 : 0] spec_inst_ror_dest_addr;
  wire [31 : 0] spec_inst_ror_dest_wdata;
  wire [31 : 0] spec_inst_ror_pc_wdata;
  wire [ 3 : 0] spec_inst_ror_mcr_wmask;
  wire [31 : 0] spec_inst_ror_mcr_wdata;
  wire [31 : 0] spec_inst_ror_mem_addr;
  wire [ 3 : 0] spec_inst_ror_mem_rmask;
  wire [ 3 : 0] spec_inst_ror_mem_wmask;
  wire [31 : 0] spec_inst_ror_mem_wdata;

  mfi_inst_ror inst_ror (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_ror_valid),
    .spec_trap(spec_inst_ror_trap),
    .spec_src1_addr(spec_inst_ror_src1_addr),
    .spec_src2_addr(spec_inst_ror_src2_addr),
    .spec_src3_addr(spec_inst_ror_src3_addr),
    .spec_dest_addr(spec_inst_ror_dest_addr),
    .spec_dest_wdata(spec_inst_ror_dest_wdata),
    .spec_pc_wdata(spec_inst_ror_pc_wdata),
    .spec_mcr_wdata(spec_inst_ror_mcr_wdata)
    .spec_mem_addr(spec_inst_ror_mem_addr),
    .spec_mem_rmask(spec_inst_ror_mem_rmask),
    .spec_mem_wmask(spec_inst_ror_mem_wmask),
    .spec_mem_wdata(spec_inst_ror_mem_wdata)
  );

  wire          spec_inst_rror_valid;
  wire          spec_inst_rror_trap;
  wire [ 3 : 0] spec_inst_rror_src1_addr;
  wire [ 3 : 0] spec_inst_rror_src2_addr;
  wire [ 3 : 0] spec_inst_rror_src3_addr;
  wire [ 3 : 0] spec_inst_rror_dest_addr;
  wire [31 : 0] spec_inst_rror_dest_wdata;
  wire [31 : 0] spec_inst_rror_pc_wdata;
  wire [ 3 : 0] spec_inst_rror_mcr_wmask;
  wire [31 : 0] spec_inst_rror_mcr_wdata;
  wire [31 : 0] spec_inst_rror_mem_addr;
  wire [ 3 : 0] spec_inst_rror_mem_rmask;
  wire [ 3 : 0] spec_inst_rror_mem_wmask;
  wire [31 : 0] spec_inst_rror_mem_wdata;

  mfi_inst_rror inst_rror (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rror_valid),
    .spec_trap(spec_inst_rror_trap),
    .spec_src1_addr(spec_inst_rror_src1_addr),
    .spec_src2_addr(spec_inst_rror_src2_addr),
    .spec_src3_addr(spec_inst_rror_src3_addr),
    .spec_dest_addr(spec_inst_rror_dest_addr),
    .spec_dest_wdata(spec_inst_rror_dest_wdata),
    .spec_pc_wdata(spec_inst_rror_pc_wdata),
    .spec_mcr_wdata(spec_inst_rror_mcr_wdata)
    .spec_mem_addr(spec_inst_rror_mem_addr),
    .spec_mem_rmask(spec_inst_rror_mem_rmask),
    .spec_mem_wmask(spec_inst_rror_mem_wmask),
    .spec_mem_wdata(spec_inst_rror_mem_wdata)
  );

  wire          spec_inst_rst_valid;
  wire          spec_inst_rst_trap;
  wire [ 3 : 0] spec_inst_rst_src1_addr;
  wire [ 3 : 0] spec_inst_rst_src2_addr;
  wire [ 3 : 0] spec_inst_rst_src3_addr;
  wire [ 3 : 0] spec_inst_rst_dest_addr;
  wire [31 : 0] spec_inst_rst_dest_wdata;
  wire [31 : 0] spec_inst_rst_pc_wdata;
  wire [ 3 : 0] spec_inst_rst_mcr_wmask;
  wire [31 : 0] spec_inst_rst_mcr_wdata;
  wire [31 : 0] spec_inst_rst_mem_addr;
  wire [ 3 : 0] spec_inst_rst_mem_rmask;
  wire [ 3 : 0] spec_inst_rst_mem_wmask;
  wire [31 : 0] spec_inst_rst_mem_wdata;

  mfi_inst_rst inst_rst (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rst_valid),
    .spec_trap(spec_inst_rst_trap),
    .spec_src1_addr(spec_inst_rst_src1_addr),
    .spec_src2_addr(spec_inst_rst_src2_addr),
    .spec_src3_addr(spec_inst_rst_src3_addr),
    .spec_dest_addr(spec_inst_rst_dest_addr),
    .spec_dest_wdata(spec_inst_rst_dest_wdata),
    .spec_pc_wdata(spec_inst_rst_pc_wdata),
    .spec_mcr_wdata(spec_inst_rst_mcr_wdata)
    .spec_mem_addr(spec_inst_rst_mem_addr),
    .spec_mem_rmask(spec_inst_rst_mem_rmask),
    .spec_mem_wmask(spec_inst_rst_mem_wmask),
    .spec_mem_wdata(spec_inst_rst_mem_wdata)
  );

  wire          spec_inst_rstb_valid;
  wire          spec_inst_rstb_trap;
  wire [ 3 : 0] spec_inst_rstb_src1_addr;
  wire [ 3 : 0] spec_inst_rstb_src2_addr;
  wire [ 3 : 0] spec_inst_rstb_src3_addr;
  wire [ 3 : 0] spec_inst_rstb_dest_addr;
  wire [31 : 0] spec_inst_rstb_dest_wdata;
  wire [31 : 0] spec_inst_rstb_pc_wdata;
  wire [ 3 : 0] spec_inst_rstb_mcr_wmask;
  wire [31 : 0] spec_inst_rstb_mcr_wdata;
  wire [31 : 0] spec_inst_rstb_mem_addr;
  wire [ 3 : 0] spec_inst_rstb_mem_rmask;
  wire [ 3 : 0] spec_inst_rstb_mem_wmask;
  wire [31 : 0] spec_inst_rstb_mem_wdata;

  mfi_inst_rstb inst_rstb (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rstb_valid),
    .spec_trap(spec_inst_rstb_trap),
    .spec_src1_addr(spec_inst_rstb_src1_addr),
    .spec_src2_addr(spec_inst_rstb_src2_addr),
    .spec_src3_addr(spec_inst_rstb_src3_addr),
    .spec_dest_addr(spec_inst_rstb_dest_addr),
    .spec_dest_wdata(spec_inst_rstb_dest_wdata),
    .spec_pc_wdata(spec_inst_rstb_pc_wdata),
    .spec_mcr_wdata(spec_inst_rstb_mcr_wdata)
    .spec_mem_addr(spec_inst_rstb_mem_addr),
    .spec_mem_rmask(spec_inst_rstb_mem_rmask),
    .spec_mem_wmask(spec_inst_rstb_mem_wmask),
    .spec_mem_wdata(spec_inst_rstb_mem_wdata)
  );

  wire          spec_inst_rsth_valid;
  wire          spec_inst_rsth_trap;
  wire [ 3 : 0] spec_inst_rsth_src1_addr;
  wire [ 3 : 0] spec_inst_rsth_src2_addr;
  wire [ 3 : 0] spec_inst_rsth_src3_addr;
  wire [ 3 : 0] spec_inst_rsth_dest_addr;
  wire [31 : 0] spec_inst_rsth_dest_wdata;
  wire [31 : 0] spec_inst_rsth_pc_wdata;
  wire [ 3 : 0] spec_inst_rsth_mcr_wmask;
  wire [31 : 0] spec_inst_rsth_mcr_wdata;
  wire [31 : 0] spec_inst_rsth_mem_addr;
  wire [ 3 : 0] spec_inst_rsth_mem_rmask;
  wire [ 3 : 0] spec_inst_rsth_mem_wmask;
  wire [31 : 0] spec_inst_rsth_mem_wdata;

  mfi_inst_rsth inst_rsth (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_rsth_valid),
    .spec_trap(spec_inst_rsth_trap),
    .spec_src1_addr(spec_inst_rsth_src1_addr),
    .spec_src2_addr(spec_inst_rsth_src2_addr),
    .spec_src3_addr(spec_inst_rsth_src3_addr),
    .spec_dest_addr(spec_inst_rsth_dest_addr),
    .spec_dest_wdata(spec_inst_rsth_dest_wdata),
    .spec_pc_wdata(spec_inst_rsth_pc_wdata),
    .spec_mcr_wdata(spec_inst_rsth_mcr_wdata)
    .spec_mem_addr(spec_inst_rsth_mem_addr),
    .spec_mem_rmask(spec_inst_rsth_mem_rmask),
    .spec_mem_wmask(spec_inst_rsth_mem_wmask),
    .spec_mem_wdata(spec_inst_rsth_mem_wdata)
  );

  wire          spec_inst_slt_valid;
  wire          spec_inst_slt_trap;
  wire [ 3 : 0] spec_inst_slt_src1_addr;
  wire [ 3 : 0] spec_inst_slt_src2_addr;
  wire [ 3 : 0] spec_inst_slt_src3_addr;
  wire [ 3 : 0] spec_inst_slt_dest_addr;
  wire [31 : 0] spec_inst_slt_dest_wdata;
  wire [31 : 0] spec_inst_slt_pc_wdata;
  wire [ 3 : 0] spec_inst_slt_mcr_wmask;
  wire [31 : 0] spec_inst_slt_mcr_wdata;
  wire [31 : 0] spec_inst_slt_mem_addr;
  wire [ 3 : 0] spec_inst_slt_mem_rmask;
  wire [ 3 : 0] spec_inst_slt_mem_wmask;
  wire [31 : 0] spec_inst_slt_mem_wdata;

  mfi_inst_slt inst_slt (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_slt_valid),
    .spec_trap(spec_inst_slt_trap),
    .spec_src1_addr(spec_inst_slt_src1_addr),
    .spec_src2_addr(spec_inst_slt_src2_addr),
    .spec_src3_addr(spec_inst_slt_src3_addr),
    .spec_dest_addr(spec_inst_slt_dest_addr),
    .spec_dest_wdata(spec_inst_slt_dest_wdata),
    .spec_pc_wdata(spec_inst_slt_pc_wdata),
    .spec_mcr_wdata(spec_inst_slt_mcr_wdata)
    .spec_mem_addr(spec_inst_slt_mem_addr),
    .spec_mem_rmask(spec_inst_slt_mem_rmask),
    .spec_mem_wmask(spec_inst_slt_mem_wmask),
    .spec_mem_wdata(spec_inst_slt_mem_wdata)
  );

  wire          spec_inst_slti_valid;
  wire          spec_inst_slti_trap;
  wire [ 3 : 0] spec_inst_slti_src1_addr;
  wire [ 3 : 0] spec_inst_slti_src2_addr;
  wire [ 3 : 0] spec_inst_slti_src3_addr;
  wire [ 3 : 0] spec_inst_slti_dest_addr;
  wire [31 : 0] spec_inst_slti_dest_wdata;
  wire [31 : 0] spec_inst_slti_pc_wdata;
  wire [ 3 : 0] spec_inst_slti_mcr_wmask;
  wire [31 : 0] spec_inst_slti_mcr_wdata;
  wire [31 : 0] spec_inst_slti_mem_addr;
  wire [ 3 : 0] spec_inst_slti_mem_rmask;
  wire [ 3 : 0] spec_inst_slti_mem_wmask;
  wire [31 : 0] spec_inst_slti_mem_wdata;

  mfi_inst_slti inst_slti (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_slti_valid),
    .spec_trap(spec_inst_slti_trap),
    .spec_src1_addr(spec_inst_slti_src1_addr),
    .spec_src2_addr(spec_inst_slti_src2_addr),
    .spec_src3_addr(spec_inst_slti_src3_addr),
    .spec_dest_addr(spec_inst_slti_dest_addr),
    .spec_dest_wdata(spec_inst_slti_dest_wdata),
    .spec_pc_wdata(spec_inst_slti_pc_wdata),
    .spec_mcr_wdata(spec_inst_slti_mcr_wdata)
    .spec_mem_addr(spec_inst_slti_mem_addr),
    .spec_mem_rmask(spec_inst_slti_mem_rmask),
    .spec_mem_wmask(spec_inst_slti_mem_wmask),
    .spec_mem_wdata(spec_inst_slti_mem_wdata)
  );

  wire          spec_inst_sltiu_valid;
  wire          spec_inst_sltiu_trap;
  wire [ 3 : 0] spec_inst_sltiu_src1_addr;
  wire [ 3 : 0] spec_inst_sltiu_src2_addr;
  wire [ 3 : 0] spec_inst_sltiu_src3_addr;
  wire [ 3 : 0] spec_inst_sltiu_dest_addr;
  wire [31 : 0] spec_inst_sltiu_dest_wdata;
  wire [31 : 0] spec_inst_sltiu_pc_wdata;
  wire [ 3 : 0] spec_inst_sltiu_mcr_wmask;
  wire [31 : 0] spec_inst_sltiu_mcr_wdata;
  wire [31 : 0] spec_inst_sltiu_mem_addr;
  wire [ 3 : 0] spec_inst_sltiu_mem_rmask;
  wire [ 3 : 0] spec_inst_sltiu_mem_wmask;
  wire [31 : 0] spec_inst_sltiu_mem_wdata;

  mfi_inst_sltiu inst_sltiu (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_sltiu_valid),
    .spec_trap(spec_inst_sltiu_trap),
    .spec_src1_addr(spec_inst_sltiu_src1_addr),
    .spec_src2_addr(spec_inst_sltiu_src2_addr),
    .spec_src3_addr(spec_inst_sltiu_src3_addr),
    .spec_dest_addr(spec_inst_sltiu_dest_addr),
    .spec_dest_wdata(spec_inst_sltiu_dest_wdata),
    .spec_pc_wdata(spec_inst_sltiu_pc_wdata),
    .spec_mcr_wdata(spec_inst_sltiu_mcr_wdata)
    .spec_mem_addr(spec_inst_sltiu_mem_addr),
    .spec_mem_rmask(spec_inst_sltiu_mem_rmask),
    .spec_mem_wmask(spec_inst_sltiu_mem_wmask),
    .spec_mem_wdata(spec_inst_sltiu_mem_wdata)
  );

  wire          spec_inst_sltu_valid;
  wire          spec_inst_sltu_trap;
  wire [ 3 : 0] spec_inst_sltu_src1_addr;
  wire [ 3 : 0] spec_inst_sltu_src2_addr;
  wire [ 3 : 0] spec_inst_sltu_src3_addr;
  wire [ 3 : 0] spec_inst_sltu_dest_addr;
  wire [31 : 0] spec_inst_sltu_dest_wdata;
  wire [31 : 0] spec_inst_sltu_pc_wdata;
  wire [ 3 : 0] spec_inst_sltu_mcr_wmask;
  wire [31 : 0] spec_inst_sltu_mcr_wdata;
  wire [31 : 0] spec_inst_sltu_mem_addr;
  wire [ 3 : 0] spec_inst_sltu_mem_rmask;
  wire [ 3 : 0] spec_inst_sltu_mem_wmask;
  wire [31 : 0] spec_inst_sltu_mem_wdata;

  mfi_inst_sltu inst_sltu (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_sltu_valid),
    .spec_trap(spec_inst_sltu_trap),
    .spec_src1_addr(spec_inst_sltu_src1_addr),
    .spec_src2_addr(spec_inst_sltu_src2_addr),
    .spec_src3_addr(spec_inst_sltu_src3_addr),
    .spec_dest_addr(spec_inst_sltu_dest_addr),
    .spec_dest_wdata(spec_inst_sltu_dest_wdata),
    .spec_pc_wdata(spec_inst_sltu_pc_wdata),
    .spec_mcr_wdata(spec_inst_sltu_mcr_wdata)
    .spec_mem_addr(spec_inst_sltu_mem_addr),
    .spec_mem_rmask(spec_inst_sltu_mem_rmask),
    .spec_mem_wmask(spec_inst_sltu_mem_wmask),
    .spec_mem_wdata(spec_inst_sltu_mem_wdata)
  );

  wire          spec_inst_st_valid;
  wire          spec_inst_st_trap;
  wire [ 3 : 0] spec_inst_st_src1_addr;
  wire [ 3 : 0] spec_inst_st_src2_addr;
  wire [ 3 : 0] spec_inst_st_src3_addr;
  wire [ 3 : 0] spec_inst_st_dest_addr;
  wire [31 : 0] spec_inst_st_dest_wdata;
  wire [31 : 0] spec_inst_st_pc_wdata;
  wire [ 3 : 0] spec_inst_st_mcr_wmask;
  wire [31 : 0] spec_inst_st_mcr_wdata;
  wire [31 : 0] spec_inst_st_mem_addr;
  wire [ 3 : 0] spec_inst_st_mem_rmask;
  wire [ 3 : 0] spec_inst_st_mem_wmask;
  wire [31 : 0] spec_inst_st_mem_wdata;

  mfi_inst_st inst_st (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_st_valid),
    .spec_trap(spec_inst_st_trap),
    .spec_src1_addr(spec_inst_st_src1_addr),
    .spec_src2_addr(spec_inst_st_src2_addr),
    .spec_src3_addr(spec_inst_st_src3_addr),
    .spec_dest_addr(spec_inst_st_dest_addr),
    .spec_dest_wdata(spec_inst_st_dest_wdata),
    .spec_pc_wdata(spec_inst_st_pc_wdata),
    .spec_mcr_wdata(spec_inst_st_mcr_wdata)
    .spec_mem_addr(spec_inst_st_mem_addr),
    .spec_mem_rmask(spec_inst_st_mem_rmask),
    .spec_mem_wmask(spec_inst_st_mem_wmask),
    .spec_mem_wdata(spec_inst_st_mem_wdata)
  );

  wire          spec_inst_stb_valid;
  wire          spec_inst_stb_trap;
  wire [ 3 : 0] spec_inst_stb_src1_addr;
  wire [ 3 : 0] spec_inst_stb_src2_addr;
  wire [ 3 : 0] spec_inst_stb_src3_addr;
  wire [ 3 : 0] spec_inst_stb_dest_addr;
  wire [31 : 0] spec_inst_stb_dest_wdata;
  wire [31 : 0] spec_inst_stb_pc_wdata;
  wire [ 3 : 0] spec_inst_stb_mcr_wmask;
  wire [31 : 0] spec_inst_stb_mcr_wdata;
  wire [31 : 0] spec_inst_stb_mem_addr;
  wire [ 3 : 0] spec_inst_stb_mem_rmask;
  wire [ 3 : 0] spec_inst_stb_mem_wmask;
  wire [31 : 0] spec_inst_stb_mem_wdata;

  mfi_inst_stb inst_stb (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_stb_valid),
    .spec_trap(spec_inst_stb_trap),
    .spec_src1_addr(spec_inst_stb_src1_addr),
    .spec_src2_addr(spec_inst_stb_src2_addr),
    .spec_src3_addr(spec_inst_stb_src3_addr),
    .spec_dest_addr(spec_inst_stb_dest_addr),
    .spec_dest_wdata(spec_inst_stb_dest_wdata),
    .spec_pc_wdata(spec_inst_stb_pc_wdata),
    .spec_mcr_wdata(spec_inst_stb_mcr_wdata)
    .spec_mem_addr(spec_inst_stb_mem_addr),
    .spec_mem_rmask(spec_inst_stb_mem_rmask),
    .spec_mem_wmask(spec_inst_stb_mem_wmask),
    .spec_mem_wdata(spec_inst_stb_mem_wdata)
  );

  wire          spec_inst_sth_valid;
  wire          spec_inst_sth_trap;
  wire [ 3 : 0] spec_inst_sth_src1_addr;
  wire [ 3 : 0] spec_inst_sth_src2_addr;
  wire [ 3 : 0] spec_inst_sth_src3_addr;
  wire [ 3 : 0] spec_inst_sth_dest_addr;
  wire [31 : 0] spec_inst_sth_dest_wdata;
  wire [31 : 0] spec_inst_sth_pc_wdata;
  wire [ 3 : 0] spec_inst_sth_mcr_wmask;
  wire [31 : 0] spec_inst_sth_mcr_wdata;
  wire [31 : 0] spec_inst_sth_mem_addr;
  wire [ 3 : 0] spec_inst_sth_mem_rmask;
  wire [ 3 : 0] spec_inst_sth_mem_wmask;
  wire [31 : 0] spec_inst_sth_mem_wdata;

  mfi_inst_sth inst_sth (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_sth_valid),
    .spec_trap(spec_inst_sth_trap),
    .spec_src1_addr(spec_inst_sth_src1_addr),
    .spec_src2_addr(spec_inst_sth_src2_addr),
    .spec_src3_addr(spec_inst_sth_src3_addr),
    .spec_dest_addr(spec_inst_sth_dest_addr),
    .spec_dest_wdata(spec_inst_sth_dest_wdata),
    .spec_pc_wdata(spec_inst_sth_pc_wdata),
    .spec_mcr_wdata(spec_inst_sth_mcr_wdata)
    .spec_mem_addr(spec_inst_sth_mem_addr),
    .spec_mem_rmask(spec_inst_sth_mem_rmask),
    .spec_mem_wmask(spec_inst_sth_mem_wmask),
    .spec_mem_wdata(spec_inst_sth_mem_wdata)
  );

  wire          spec_inst_sub_valid;
  wire          spec_inst_sub_trap;
  wire [ 3 : 0] spec_inst_sub_src1_addr;
  wire [ 3 : 0] spec_inst_sub_src2_addr;
  wire [ 3 : 0] spec_inst_sub_src3_addr;
  wire [ 3 : 0] spec_inst_sub_dest_addr;
  wire [31 : 0] spec_inst_sub_dest_wdata;
  wire [31 : 0] spec_inst_sub_pc_wdata;
  wire [ 3 : 0] spec_inst_sub_mcr_wmask;
  wire [31 : 0] spec_inst_sub_mcr_wdata;
  wire [31 : 0] spec_inst_sub_mem_addr;
  wire [ 3 : 0] spec_inst_sub_mem_rmask;
  wire [ 3 : 0] spec_inst_sub_mem_wmask;
  wire [31 : 0] spec_inst_sub_mem_wdata;

  mfi_inst_sub inst_sub (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_sub_valid),
    .spec_trap(spec_inst_sub_trap),
    .spec_src1_addr(spec_inst_sub_src1_addr),
    .spec_src2_addr(spec_inst_sub_src2_addr),
    .spec_src3_addr(spec_inst_sub_src3_addr),
    .spec_dest_addr(spec_inst_sub_dest_addr),
    .spec_dest_wdata(spec_inst_sub_dest_wdata),
    .spec_pc_wdata(spec_inst_sub_pc_wdata),
    .spec_mcr_wdata(spec_inst_sub_mcr_wdata)
    .spec_mem_addr(spec_inst_sub_mem_addr),
    .spec_mem_rmask(spec_inst_sub_mem_rmask),
    .spec_mem_wmask(spec_inst_sub_mem_wmask),
    .spec_mem_wdata(spec_inst_sub_mem_wdata)
  );

  wire          spec_inst_xor_valid;
  wire          spec_inst_xor_trap;
  wire [ 3 : 0] spec_inst_xor_src1_addr;
  wire [ 3 : 0] spec_inst_xor_src2_addr;
  wire [ 3 : 0] spec_inst_xor_src3_addr;
  wire [ 3 : 0] spec_inst_xor_dest_addr;
  wire [31 : 0] spec_inst_xor_dest_wdata;
  wire [31 : 0] spec_inst_xor_pc_wdata;
  wire [ 3 : 0] spec_inst_xor_mcr_wmask;
  wire [31 : 0] spec_inst_xor_mcr_wdata;
  wire [31 : 0] spec_inst_xor_mem_addr;
  wire [ 3 : 0] spec_inst_xor_mem_rmask;
  wire [ 3 : 0] spec_inst_xor_mem_wmask;
  wire [31 : 0] spec_inst_xor_mem_wdata;

  mfi_inst_xor inst_xor (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_xor_valid),
    .spec_trap(spec_inst_xor_trap),
    .spec_src1_addr(spec_inst_xor_src1_addr),
    .spec_src2_addr(spec_inst_xor_src2_addr),
    .spec_src3_addr(spec_inst_xor_src3_addr),
    .spec_dest_addr(spec_inst_xor_dest_addr),
    .spec_dest_wdata(spec_inst_xor_dest_wdata),
    .spec_pc_wdata(spec_inst_xor_pc_wdata),
    .spec_mcr_wdata(spec_inst_xor_mcr_wdata)
    .spec_mem_addr(spec_inst_xor_mem_addr),
    .spec_mem_rmask(spec_inst_xor_mem_rmask),
    .spec_mem_wmask(spec_inst_xor_mem_wmask),
    .spec_mem_wdata(spec_inst_xor_mem_wdata)
  );

  wire          spec_inst_xori_valid;
  wire          spec_inst_xori_trap;
  wire [ 3 : 0] spec_inst_xori_src1_addr;
  wire [ 3 : 0] spec_inst_xori_src2_addr;
  wire [ 3 : 0] spec_inst_xori_src3_addr;
  wire [ 3 : 0] spec_inst_xori_dest_addr;
  wire [31 : 0] spec_inst_xori_dest_wdata;
  wire [31 : 0] spec_inst_xori_pc_wdata;
  wire [ 3 : 0] spec_inst_xori_mcr_wmask;
  wire [31 : 0] spec_inst_xori_mcr_wdata;
  wire [31 : 0] spec_inst_xori_mem_addr;
  wire [ 3 : 0] spec_inst_xori_mem_rmask;
  wire [ 3 : 0] spec_inst_xori_mem_wmask;
  wire [31 : 0] spec_inst_xori_mem_wdata;

  mfi_inst_xori inst_xori (
    .mfi_valid(mfi_valid),
    .mfi_inst(mfi_inst),
    .mfi_pc_rdata(mfi_pc_rdata),
    .mfi_mcr_rdata(mfi_mcr_rdata),
    .mfi_src1_rdata(mfi_src1_rdata),
    .mfi_src2_rdata(mfi_src2_rdata),
    .mfi_src3_rdata(mfi_src3_rdata),
    .mfi_mem_rdata(mfi_mem_rdata),
    .spec_valid(spec_inst_xori_valid),
    .spec_trap(spec_inst_xori_trap),
    .spec_src1_addr(spec_inst_xori_src1_addr),
    .spec_src2_addr(spec_inst_xori_src2_addr),
    .spec_src3_addr(spec_inst_xori_src3_addr),
    .spec_dest_addr(spec_inst_xori_dest_addr),
    .spec_dest_wdata(spec_inst_xori_dest_wdata),
    .spec_pc_wdata(spec_inst_xori_pc_wdata),
    .spec_mcr_wdata(spec_inst_xori_mcr_wdata)
    .spec_mem_addr(spec_inst_xori_mem_addr),
    .spec_mem_rmask(spec_inst_xori_mem_rmask),
    .spec_mem_wmask(spec_inst_xori_mem_wmask),
    .spec_mem_wdata(spec_inst_xori_mem_wdata)
  );

  assign spec_valid =
		spec_inst_add_valid ? spec_inst_add_valid :
		spec_inst_addi_valid ? spec_inst_addi_valid :
		spec_inst_and_valid ? spec_inst_and_valid :
		spec_inst_andi_valid ? spec_inst_andi_valid :
		spec_inst_asr_valid ? spec_inst_asr_valid :
		spec_inst_bf_valid ? spec_inst_bf_valid :
		spec_inst_bra_valid ? spec_inst_bra_valid :
		spec_inst_bt_valid ? spec_inst_bt_valid :
		spec_inst_call_valid ? spec_inst_call_valid :
		spec_inst_cf_valid ? spec_inst_cf_valid :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_valid :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_valid :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_valid :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_valid :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_valid :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_valid :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_valid :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_valid :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_valid :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_valid :
		spec_inst_ct_valid ? spec_inst_ct_valid :
		spec_inst_flsl_valid ? spec_inst_flsl_valid :
		spec_inst_flsr_valid ? spec_inst_flsr_valid :
		spec_inst_ld_valid ? spec_inst_ld_valid :
		spec_inst_ldb_valid ? spec_inst_ldb_valid :
		spec_inst_ldh_valid ? spec_inst_ldh_valid :
		spec_inst_lsl_valid ? spec_inst_lsl_valid :
		spec_inst_lsr_valid ? spec_inst_lsr_valid :
		spec_inst_mf_valid ? spec_inst_mf_valid :
		spec_inst_mfi_valid ? spec_inst_mfi_valid :
		spec_inst_mfrc_valid ? spec_inst_mfrc_valid :
		spec_inst_mov_valid ? spec_inst_mov_valid :
		spec_inst_movi_valid ? spec_inst_movi_valid :
		spec_inst_movl_valid ? spec_inst_movl_valid :
		spec_inst_movu_valid ? spec_inst_movu_valid :
		spec_inst_mt_valid ? spec_inst_mt_valid :
		spec_inst_mti_valid ? spec_inst_mti_valid :
		spec_inst_nand_valid ? spec_inst_nand_valid :
		spec_inst_nandi_valid ? spec_inst_nandi_valid :
		spec_inst_nop_valid ? spec_inst_nop_valid :
		spec_inst_or_valid ? spec_inst_or_valid :
		spec_inst_ori_valid ? spec_inst_ori_valid :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_valid :
		spec_inst_rasr_valid ? spec_inst_rasr_valid :
		spec_inst_rbra_valid ? spec_inst_rbra_valid :
		spec_inst_rcall_valid ? spec_inst_rcall_valid :
		spec_inst_ret_valid ? spec_inst_ret_valid :
		spec_inst_rld_valid ? spec_inst_rld_valid :
		spec_inst_rldb_valid ? spec_inst_rldb_valid :
		spec_inst_rldh_valid ? spec_inst_rldh_valid :
		spec_inst_rlsl_valid ? spec_inst_rlsl_valid :
		spec_inst_rlsr_valid ? spec_inst_rlsr_valid :
		spec_inst_robra_valid ? spec_inst_robra_valid :
		spec_inst_rocall_valid ? spec_inst_rocall_valid :
		spec_inst_ror_valid ? spec_inst_ror_valid :
		spec_inst_rror_valid ? spec_inst_rror_valid :
		spec_inst_rst_valid ? spec_inst_rst_valid :
		spec_inst_rstb_valid ? spec_inst_rstb_valid :
		spec_inst_rsth_valid ? spec_inst_rsth_valid :
		spec_inst_slt_valid ? spec_inst_slt_valid :
		spec_inst_slti_valid ? spec_inst_slti_valid :
		spec_inst_sltiu_valid ? spec_inst_sltiu_valid :
		spec_inst_sltu_valid ? spec_inst_sltu_valid :
		spec_inst_st_valid ? spec_inst_st_valid :
		spec_inst_stb_valid ? spec_inst_stb_valid :
		spec_inst_sth_valid ? spec_inst_sth_valid :
		spec_inst_sub_valid ? spec_inst_sub_valid :
		spec_inst_xor_valid ? spec_inst_xor_valid :
		spec_inst_xori_valid ? spec_inst_xori_valid : 0;
  assign spec_trap =
		spec_inst_add_valid ? spec_inst_add_trap :
		spec_inst_addi_valid ? spec_inst_addi_trap :
		spec_inst_and_valid ? spec_inst_and_trap :
		spec_inst_andi_valid ? spec_inst_andi_trap :
		spec_inst_asr_valid ? spec_inst_asr_trap :
		spec_inst_bf_valid ? spec_inst_bf_trap :
		spec_inst_bra_valid ? spec_inst_bra_trap :
		spec_inst_bt_valid ? spec_inst_bt_trap :
		spec_inst_call_valid ? spec_inst_call_trap :
		spec_inst_cf_valid ? spec_inst_cf_trap :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_trap :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_trap :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_trap :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_trap :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_trap :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_trap :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_trap :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_trap :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_trap :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_trap :
		spec_inst_ct_valid ? spec_inst_ct_trap :
		spec_inst_flsl_valid ? spec_inst_flsl_trap :
		spec_inst_flsr_valid ? spec_inst_flsr_trap :
		spec_inst_ld_valid ? spec_inst_ld_trap :
		spec_inst_ldb_valid ? spec_inst_ldb_trap :
		spec_inst_ldh_valid ? spec_inst_ldh_trap :
		spec_inst_lsl_valid ? spec_inst_lsl_trap :
		spec_inst_lsr_valid ? spec_inst_lsr_trap :
		spec_inst_mf_valid ? spec_inst_mf_trap :
		spec_inst_mfi_valid ? spec_inst_mfi_trap :
		spec_inst_mfrc_valid ? spec_inst_mfrc_trap :
		spec_inst_mov_valid ? spec_inst_mov_trap :
		spec_inst_movi_valid ? spec_inst_movi_trap :
		spec_inst_movl_valid ? spec_inst_movl_trap :
		spec_inst_movu_valid ? spec_inst_movu_trap :
		spec_inst_mt_valid ? spec_inst_mt_trap :
		spec_inst_mti_valid ? spec_inst_mti_trap :
		spec_inst_nand_valid ? spec_inst_nand_trap :
		spec_inst_nandi_valid ? spec_inst_nandi_trap :
		spec_inst_nop_valid ? spec_inst_nop_trap :
		spec_inst_or_valid ? spec_inst_or_trap :
		spec_inst_ori_valid ? spec_inst_ori_trap :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_trap :
		spec_inst_rasr_valid ? spec_inst_rasr_trap :
		spec_inst_rbra_valid ? spec_inst_rbra_trap :
		spec_inst_rcall_valid ? spec_inst_rcall_trap :
		spec_inst_ret_valid ? spec_inst_ret_trap :
		spec_inst_rld_valid ? spec_inst_rld_trap :
		spec_inst_rldb_valid ? spec_inst_rldb_trap :
		spec_inst_rldh_valid ? spec_inst_rldh_trap :
		spec_inst_rlsl_valid ? spec_inst_rlsl_trap :
		spec_inst_rlsr_valid ? spec_inst_rlsr_trap :
		spec_inst_robra_valid ? spec_inst_robra_trap :
		spec_inst_rocall_valid ? spec_inst_rocall_trap :
		spec_inst_ror_valid ? spec_inst_ror_trap :
		spec_inst_rror_valid ? spec_inst_rror_trap :
		spec_inst_rst_valid ? spec_inst_rst_trap :
		spec_inst_rstb_valid ? spec_inst_rstb_trap :
		spec_inst_rsth_valid ? spec_inst_rsth_trap :
		spec_inst_slt_valid ? spec_inst_slt_trap :
		spec_inst_slti_valid ? spec_inst_slti_trap :
		spec_inst_sltiu_valid ? spec_inst_sltiu_trap :
		spec_inst_sltu_valid ? spec_inst_sltu_trap :
		spec_inst_st_valid ? spec_inst_st_trap :
		spec_inst_stb_valid ? spec_inst_stb_trap :
		spec_inst_sth_valid ? spec_inst_sth_trap :
		spec_inst_sub_valid ? spec_inst_sub_trap :
		spec_inst_xor_valid ? spec_inst_xor_trap :
		spec_inst_xori_valid ? spec_inst_xori_trap : 0;
  assign spec_src1_addr =
		spec_inst_add_valid ? spec_inst_add_src1_addr :
		spec_inst_addi_valid ? spec_inst_addi_src1_addr :
		spec_inst_and_valid ? spec_inst_and_src1_addr :
		spec_inst_andi_valid ? spec_inst_andi_src1_addr :
		spec_inst_asr_valid ? spec_inst_asr_src1_addr :
		spec_inst_bf_valid ? spec_inst_bf_src1_addr :
		spec_inst_bra_valid ? spec_inst_bra_src1_addr :
		spec_inst_bt_valid ? spec_inst_bt_src1_addr :
		spec_inst_call_valid ? spec_inst_call_src1_addr :
		spec_inst_cf_valid ? spec_inst_cf_src1_addr :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_src1_addr :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_src1_addr :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_src1_addr :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_src1_addr :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_src1_addr :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_src1_addr :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_src1_addr :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_src1_addr :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_src1_addr :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_src1_addr :
		spec_inst_ct_valid ? spec_inst_ct_src1_addr :
		spec_inst_flsl_valid ? spec_inst_flsl_src1_addr :
		spec_inst_flsr_valid ? spec_inst_flsr_src1_addr :
		spec_inst_ld_valid ? spec_inst_ld_src1_addr :
		spec_inst_ldb_valid ? spec_inst_ldb_src1_addr :
		spec_inst_ldh_valid ? spec_inst_ldh_src1_addr :
		spec_inst_lsl_valid ? spec_inst_lsl_src1_addr :
		spec_inst_lsr_valid ? spec_inst_lsr_src1_addr :
		spec_inst_mf_valid ? spec_inst_mf_src1_addr :
		spec_inst_mfi_valid ? spec_inst_mfi_src1_addr :
		spec_inst_mfrc_valid ? spec_inst_mfrc_src1_addr :
		spec_inst_mov_valid ? spec_inst_mov_src1_addr :
		spec_inst_movi_valid ? spec_inst_movi_src1_addr :
		spec_inst_movl_valid ? spec_inst_movl_src1_addr :
		spec_inst_movu_valid ? spec_inst_movu_src1_addr :
		spec_inst_mt_valid ? spec_inst_mt_src1_addr :
		spec_inst_mti_valid ? spec_inst_mti_src1_addr :
		spec_inst_nand_valid ? spec_inst_nand_src1_addr :
		spec_inst_nandi_valid ? spec_inst_nandi_src1_addr :
		spec_inst_nop_valid ? spec_inst_nop_src1_addr :
		spec_inst_or_valid ? spec_inst_or_src1_addr :
		spec_inst_ori_valid ? spec_inst_ori_src1_addr :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_src1_addr :
		spec_inst_rasr_valid ? spec_inst_rasr_src1_addr :
		spec_inst_rbra_valid ? spec_inst_rbra_src1_addr :
		spec_inst_rcall_valid ? spec_inst_rcall_src1_addr :
		spec_inst_ret_valid ? spec_inst_ret_src1_addr :
		spec_inst_rld_valid ? spec_inst_rld_src1_addr :
		spec_inst_rldb_valid ? spec_inst_rldb_src1_addr :
		spec_inst_rldh_valid ? spec_inst_rldh_src1_addr :
		spec_inst_rlsl_valid ? spec_inst_rlsl_src1_addr :
		spec_inst_rlsr_valid ? spec_inst_rlsr_src1_addr :
		spec_inst_robra_valid ? spec_inst_robra_src1_addr :
		spec_inst_rocall_valid ? spec_inst_rocall_src1_addr :
		spec_inst_ror_valid ? spec_inst_ror_src1_addr :
		spec_inst_rror_valid ? spec_inst_rror_src1_addr :
		spec_inst_rst_valid ? spec_inst_rst_src1_addr :
		spec_inst_rstb_valid ? spec_inst_rstb_src1_addr :
		spec_inst_rsth_valid ? spec_inst_rsth_src1_addr :
		spec_inst_slt_valid ? spec_inst_slt_src1_addr :
		spec_inst_slti_valid ? spec_inst_slti_src1_addr :
		spec_inst_sltiu_valid ? spec_inst_sltiu_src1_addr :
		spec_inst_sltu_valid ? spec_inst_sltu_src1_addr :
		spec_inst_st_valid ? spec_inst_st_src1_addr :
		spec_inst_stb_valid ? spec_inst_stb_src1_addr :
		spec_inst_sth_valid ? spec_inst_sth_src1_addr :
		spec_inst_sub_valid ? spec_inst_sub_src1_addr :
		spec_inst_xor_valid ? spec_inst_xor_src1_addr :
		spec_inst_xori_valid ? spec_inst_xori_src1_addr : 0;
  assign spec_src2_addr =
		spec_inst_add_valid ? spec_inst_add_src2_addr :
		spec_inst_addi_valid ? spec_inst_addi_src2_addr :
		spec_inst_and_valid ? spec_inst_and_src2_addr :
		spec_inst_andi_valid ? spec_inst_andi_src2_addr :
		spec_inst_asr_valid ? spec_inst_asr_src2_addr :
		spec_inst_bf_valid ? spec_inst_bf_src2_addr :
		spec_inst_bra_valid ? spec_inst_bra_src2_addr :
		spec_inst_bt_valid ? spec_inst_bt_src2_addr :
		spec_inst_call_valid ? spec_inst_call_src2_addr :
		spec_inst_cf_valid ? spec_inst_cf_src2_addr :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_src2_addr :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_src2_addr :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_src2_addr :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_src2_addr :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_src2_addr :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_src2_addr :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_src2_addr :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_src2_addr :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_src2_addr :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_src2_addr :
		spec_inst_ct_valid ? spec_inst_ct_src2_addr :
		spec_inst_flsl_valid ? spec_inst_flsl_src2_addr :
		spec_inst_flsr_valid ? spec_inst_flsr_src2_addr :
		spec_inst_ld_valid ? spec_inst_ld_src2_addr :
		spec_inst_ldb_valid ? spec_inst_ldb_src2_addr :
		spec_inst_ldh_valid ? spec_inst_ldh_src2_addr :
		spec_inst_lsl_valid ? spec_inst_lsl_src2_addr :
		spec_inst_lsr_valid ? spec_inst_lsr_src2_addr :
		spec_inst_mf_valid ? spec_inst_mf_src2_addr :
		spec_inst_mfi_valid ? spec_inst_mfi_src2_addr :
		spec_inst_mfrc_valid ? spec_inst_mfrc_src2_addr :
		spec_inst_mov_valid ? spec_inst_mov_src2_addr :
		spec_inst_movi_valid ? spec_inst_movi_src2_addr :
		spec_inst_movl_valid ? spec_inst_movl_src2_addr :
		spec_inst_movu_valid ? spec_inst_movu_src2_addr :
		spec_inst_mt_valid ? spec_inst_mt_src2_addr :
		spec_inst_mti_valid ? spec_inst_mti_src2_addr :
		spec_inst_nand_valid ? spec_inst_nand_src2_addr :
		spec_inst_nandi_valid ? spec_inst_nandi_src2_addr :
		spec_inst_nop_valid ? spec_inst_nop_src2_addr :
		spec_inst_or_valid ? spec_inst_or_src2_addr :
		spec_inst_ori_valid ? spec_inst_ori_src2_addr :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_src2_addr :
		spec_inst_rasr_valid ? spec_inst_rasr_src2_addr :
		spec_inst_rbra_valid ? spec_inst_rbra_src2_addr :
		spec_inst_rcall_valid ? spec_inst_rcall_src2_addr :
		spec_inst_ret_valid ? spec_inst_ret_src2_addr :
		spec_inst_rld_valid ? spec_inst_rld_src2_addr :
		spec_inst_rldb_valid ? spec_inst_rldb_src2_addr :
		spec_inst_rldh_valid ? spec_inst_rldh_src2_addr :
		spec_inst_rlsl_valid ? spec_inst_rlsl_src2_addr :
		spec_inst_rlsr_valid ? spec_inst_rlsr_src2_addr :
		spec_inst_robra_valid ? spec_inst_robra_src2_addr :
		spec_inst_rocall_valid ? spec_inst_rocall_src2_addr :
		spec_inst_ror_valid ? spec_inst_ror_src2_addr :
		spec_inst_rror_valid ? spec_inst_rror_src2_addr :
		spec_inst_rst_valid ? spec_inst_rst_src2_addr :
		spec_inst_rstb_valid ? spec_inst_rstb_src2_addr :
		spec_inst_rsth_valid ? spec_inst_rsth_src2_addr :
		spec_inst_slt_valid ? spec_inst_slt_src2_addr :
		spec_inst_slti_valid ? spec_inst_slti_src2_addr :
		spec_inst_sltiu_valid ? spec_inst_sltiu_src2_addr :
		spec_inst_sltu_valid ? spec_inst_sltu_src2_addr :
		spec_inst_st_valid ? spec_inst_st_src2_addr :
		spec_inst_stb_valid ? spec_inst_stb_src2_addr :
		spec_inst_sth_valid ? spec_inst_sth_src2_addr :
		spec_inst_sub_valid ? spec_inst_sub_src2_addr :
		spec_inst_xor_valid ? spec_inst_xor_src2_addr :
		spec_inst_xori_valid ? spec_inst_xori_src2_addr : 0;
  assign spec_src3_addr =
		spec_inst_add_valid ? spec_inst_add_src3_addr :
		spec_inst_addi_valid ? spec_inst_addi_src3_addr :
		spec_inst_and_valid ? spec_inst_and_src3_addr :
		spec_inst_andi_valid ? spec_inst_andi_src3_addr :
		spec_inst_asr_valid ? spec_inst_asr_src3_addr :
		spec_inst_bf_valid ? spec_inst_bf_src3_addr :
		spec_inst_bra_valid ? spec_inst_bra_src3_addr :
		spec_inst_bt_valid ? spec_inst_bt_src3_addr :
		spec_inst_call_valid ? spec_inst_call_src3_addr :
		spec_inst_cf_valid ? spec_inst_cf_src3_addr :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_src3_addr :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_src3_addr :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_src3_addr :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_src3_addr :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_src3_addr :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_src3_addr :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_src3_addr :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_src3_addr :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_src3_addr :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_src3_addr :
		spec_inst_ct_valid ? spec_inst_ct_src3_addr :
		spec_inst_flsl_valid ? spec_inst_flsl_src3_addr :
		spec_inst_flsr_valid ? spec_inst_flsr_src3_addr :
		spec_inst_ld_valid ? spec_inst_ld_src3_addr :
		spec_inst_ldb_valid ? spec_inst_ldb_src3_addr :
		spec_inst_ldh_valid ? spec_inst_ldh_src3_addr :
		spec_inst_lsl_valid ? spec_inst_lsl_src3_addr :
		spec_inst_lsr_valid ? spec_inst_lsr_src3_addr :
		spec_inst_mf_valid ? spec_inst_mf_src3_addr :
		spec_inst_mfi_valid ? spec_inst_mfi_src3_addr :
		spec_inst_mfrc_valid ? spec_inst_mfrc_src3_addr :
		spec_inst_mov_valid ? spec_inst_mov_src3_addr :
		spec_inst_movi_valid ? spec_inst_movi_src3_addr :
		spec_inst_movl_valid ? spec_inst_movl_src3_addr :
		spec_inst_movu_valid ? spec_inst_movu_src3_addr :
		spec_inst_mt_valid ? spec_inst_mt_src3_addr :
		spec_inst_mti_valid ? spec_inst_mti_src3_addr :
		spec_inst_nand_valid ? spec_inst_nand_src3_addr :
		spec_inst_nandi_valid ? spec_inst_nandi_src3_addr :
		spec_inst_nop_valid ? spec_inst_nop_src3_addr :
		spec_inst_or_valid ? spec_inst_or_src3_addr :
		spec_inst_ori_valid ? spec_inst_ori_src3_addr :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_src3_addr :
		spec_inst_rasr_valid ? spec_inst_rasr_src3_addr :
		spec_inst_rbra_valid ? spec_inst_rbra_src3_addr :
		spec_inst_rcall_valid ? spec_inst_rcall_src3_addr :
		spec_inst_ret_valid ? spec_inst_ret_src3_addr :
		spec_inst_rld_valid ? spec_inst_rld_src3_addr :
		spec_inst_rldb_valid ? spec_inst_rldb_src3_addr :
		spec_inst_rldh_valid ? spec_inst_rldh_src3_addr :
		spec_inst_rlsl_valid ? spec_inst_rlsl_src3_addr :
		spec_inst_rlsr_valid ? spec_inst_rlsr_src3_addr :
		spec_inst_robra_valid ? spec_inst_robra_src3_addr :
		spec_inst_rocall_valid ? spec_inst_rocall_src3_addr :
		spec_inst_ror_valid ? spec_inst_ror_src3_addr :
		spec_inst_rror_valid ? spec_inst_rror_src3_addr :
		spec_inst_rst_valid ? spec_inst_rst_src3_addr :
		spec_inst_rstb_valid ? spec_inst_rstb_src3_addr :
		spec_inst_rsth_valid ? spec_inst_rsth_src3_addr :
		spec_inst_slt_valid ? spec_inst_slt_src3_addr :
		spec_inst_slti_valid ? spec_inst_slti_src3_addr :
		spec_inst_sltiu_valid ? spec_inst_sltiu_src3_addr :
		spec_inst_sltu_valid ? spec_inst_sltu_src3_addr :
		spec_inst_st_valid ? spec_inst_st_src3_addr :
		spec_inst_stb_valid ? spec_inst_stb_src3_addr :
		spec_inst_sth_valid ? spec_inst_sth_src3_addr :
		spec_inst_sub_valid ? spec_inst_sub_src3_addr :
		spec_inst_xor_valid ? spec_inst_xor_src3_addr :
		spec_inst_xori_valid ? spec_inst_xori_src3_addr : 0;
  assign spec_dest_addr =
		spec_inst_add_valid ? spec_inst_add_dest_addr :
		spec_inst_addi_valid ? spec_inst_addi_dest_addr :
		spec_inst_and_valid ? spec_inst_and_dest_addr :
		spec_inst_andi_valid ? spec_inst_andi_dest_addr :
		spec_inst_asr_valid ? spec_inst_asr_dest_addr :
		spec_inst_bf_valid ? spec_inst_bf_dest_addr :
		spec_inst_bra_valid ? spec_inst_bra_dest_addr :
		spec_inst_bt_valid ? spec_inst_bt_dest_addr :
		spec_inst_call_valid ? spec_inst_call_dest_addr :
		spec_inst_cf_valid ? spec_inst_cf_dest_addr :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_dest_addr :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_dest_addr :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_dest_addr :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_dest_addr :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_dest_addr :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_dest_addr :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_dest_addr :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_dest_addr :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_dest_addr :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_dest_addr :
		spec_inst_ct_valid ? spec_inst_ct_dest_addr :
		spec_inst_flsl_valid ? spec_inst_flsl_dest_addr :
		spec_inst_flsr_valid ? spec_inst_flsr_dest_addr :
		spec_inst_ld_valid ? spec_inst_ld_dest_addr :
		spec_inst_ldb_valid ? spec_inst_ldb_dest_addr :
		spec_inst_ldh_valid ? spec_inst_ldh_dest_addr :
		spec_inst_lsl_valid ? spec_inst_lsl_dest_addr :
		spec_inst_lsr_valid ? spec_inst_lsr_dest_addr :
		spec_inst_mf_valid ? spec_inst_mf_dest_addr :
		spec_inst_mfi_valid ? spec_inst_mfi_dest_addr :
		spec_inst_mfrc_valid ? spec_inst_mfrc_dest_addr :
		spec_inst_mov_valid ? spec_inst_mov_dest_addr :
		spec_inst_movi_valid ? spec_inst_movi_dest_addr :
		spec_inst_movl_valid ? spec_inst_movl_dest_addr :
		spec_inst_movu_valid ? spec_inst_movu_dest_addr :
		spec_inst_mt_valid ? spec_inst_mt_dest_addr :
		spec_inst_mti_valid ? spec_inst_mti_dest_addr :
		spec_inst_nand_valid ? spec_inst_nand_dest_addr :
		spec_inst_nandi_valid ? spec_inst_nandi_dest_addr :
		spec_inst_nop_valid ? spec_inst_nop_dest_addr :
		spec_inst_or_valid ? spec_inst_or_dest_addr :
		spec_inst_ori_valid ? spec_inst_ori_dest_addr :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_dest_addr :
		spec_inst_rasr_valid ? spec_inst_rasr_dest_addr :
		spec_inst_rbra_valid ? spec_inst_rbra_dest_addr :
		spec_inst_rcall_valid ? spec_inst_rcall_dest_addr :
		spec_inst_ret_valid ? spec_inst_ret_dest_addr :
		spec_inst_rld_valid ? spec_inst_rld_dest_addr :
		spec_inst_rldb_valid ? spec_inst_rldb_dest_addr :
		spec_inst_rldh_valid ? spec_inst_rldh_dest_addr :
		spec_inst_rlsl_valid ? spec_inst_rlsl_dest_addr :
		spec_inst_rlsr_valid ? spec_inst_rlsr_dest_addr :
		spec_inst_robra_valid ? spec_inst_robra_dest_addr :
		spec_inst_rocall_valid ? spec_inst_rocall_dest_addr :
		spec_inst_ror_valid ? spec_inst_ror_dest_addr :
		spec_inst_rror_valid ? spec_inst_rror_dest_addr :
		spec_inst_rst_valid ? spec_inst_rst_dest_addr :
		spec_inst_rstb_valid ? spec_inst_rstb_dest_addr :
		spec_inst_rsth_valid ? spec_inst_rsth_dest_addr :
		spec_inst_slt_valid ? spec_inst_slt_dest_addr :
		spec_inst_slti_valid ? spec_inst_slti_dest_addr :
		spec_inst_sltiu_valid ? spec_inst_sltiu_dest_addr :
		spec_inst_sltu_valid ? spec_inst_sltu_dest_addr :
		spec_inst_st_valid ? spec_inst_st_dest_addr :
		spec_inst_stb_valid ? spec_inst_stb_dest_addr :
		spec_inst_sth_valid ? spec_inst_sth_dest_addr :
		spec_inst_sub_valid ? spec_inst_sub_dest_addr :
		spec_inst_xor_valid ? spec_inst_xor_dest_addr :
		spec_inst_xori_valid ? spec_inst_xori_dest_addr : 0;
  assign spec_dest_wdata =
		spec_inst_add_valid ? spec_inst_add_dest_wdata :
		spec_inst_addi_valid ? spec_inst_addi_dest_wdata :
		spec_inst_and_valid ? spec_inst_and_dest_wdata :
		spec_inst_andi_valid ? spec_inst_andi_dest_wdata :
		spec_inst_asr_valid ? spec_inst_asr_dest_wdata :
		spec_inst_bf_valid ? spec_inst_bf_dest_wdata :
		spec_inst_bra_valid ? spec_inst_bra_dest_wdata :
		spec_inst_bt_valid ? spec_inst_bt_dest_wdata :
		spec_inst_call_valid ? spec_inst_call_dest_wdata :
		spec_inst_cf_valid ? spec_inst_cf_dest_wdata :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_dest_wdata :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_dest_wdata :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_dest_wdata :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_dest_wdata :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_dest_wdata :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_dest_wdata :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_dest_wdata :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_dest_wdata :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_dest_wdata :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_dest_wdata :
		spec_inst_ct_valid ? spec_inst_ct_dest_wdata :
		spec_inst_flsl_valid ? spec_inst_flsl_dest_wdata :
		spec_inst_flsr_valid ? spec_inst_flsr_dest_wdata :
		spec_inst_ld_valid ? spec_inst_ld_dest_wdata :
		spec_inst_ldb_valid ? spec_inst_ldb_dest_wdata :
		spec_inst_ldh_valid ? spec_inst_ldh_dest_wdata :
		spec_inst_lsl_valid ? spec_inst_lsl_dest_wdata :
		spec_inst_lsr_valid ? spec_inst_lsr_dest_wdata :
		spec_inst_mf_valid ? spec_inst_mf_dest_wdata :
		spec_inst_mfi_valid ? spec_inst_mfi_dest_wdata :
		spec_inst_mfrc_valid ? spec_inst_mfrc_dest_wdata :
		spec_inst_mov_valid ? spec_inst_mov_dest_wdata :
		spec_inst_movi_valid ? spec_inst_movi_dest_wdata :
		spec_inst_movl_valid ? spec_inst_movl_dest_wdata :
		spec_inst_movu_valid ? spec_inst_movu_dest_wdata :
		spec_inst_mt_valid ? spec_inst_mt_dest_wdata :
		spec_inst_mti_valid ? spec_inst_mti_dest_wdata :
		spec_inst_nand_valid ? spec_inst_nand_dest_wdata :
		spec_inst_nandi_valid ? spec_inst_nandi_dest_wdata :
		spec_inst_nop_valid ? spec_inst_nop_dest_wdata :
		spec_inst_or_valid ? spec_inst_or_dest_wdata :
		spec_inst_ori_valid ? spec_inst_ori_dest_wdata :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_dest_wdata :
		spec_inst_rasr_valid ? spec_inst_rasr_dest_wdata :
		spec_inst_rbra_valid ? spec_inst_rbra_dest_wdata :
		spec_inst_rcall_valid ? spec_inst_rcall_dest_wdata :
		spec_inst_ret_valid ? spec_inst_ret_dest_wdata :
		spec_inst_rld_valid ? spec_inst_rld_dest_wdata :
		spec_inst_rldb_valid ? spec_inst_rldb_dest_wdata :
		spec_inst_rldh_valid ? spec_inst_rldh_dest_wdata :
		spec_inst_rlsl_valid ? spec_inst_rlsl_dest_wdata :
		spec_inst_rlsr_valid ? spec_inst_rlsr_dest_wdata :
		spec_inst_robra_valid ? spec_inst_robra_dest_wdata :
		spec_inst_rocall_valid ? spec_inst_rocall_dest_wdata :
		spec_inst_ror_valid ? spec_inst_ror_dest_wdata :
		spec_inst_rror_valid ? spec_inst_rror_dest_wdata :
		spec_inst_rst_valid ? spec_inst_rst_dest_wdata :
		spec_inst_rstb_valid ? spec_inst_rstb_dest_wdata :
		spec_inst_rsth_valid ? spec_inst_rsth_dest_wdata :
		spec_inst_slt_valid ? spec_inst_slt_dest_wdata :
		spec_inst_slti_valid ? spec_inst_slti_dest_wdata :
		spec_inst_sltiu_valid ? spec_inst_sltiu_dest_wdata :
		spec_inst_sltu_valid ? spec_inst_sltu_dest_wdata :
		spec_inst_st_valid ? spec_inst_st_dest_wdata :
		spec_inst_stb_valid ? spec_inst_stb_dest_wdata :
		spec_inst_sth_valid ? spec_inst_sth_dest_wdata :
		spec_inst_sub_valid ? spec_inst_sub_dest_wdata :
		spec_inst_xor_valid ? spec_inst_xor_dest_wdata :
		spec_inst_xori_valid ? spec_inst_xori_dest_wdata : 0;
  assign spec_pc_wdata =
		spec_inst_add_valid ? spec_inst_add_pc_wdata :
		spec_inst_addi_valid ? spec_inst_addi_pc_wdata :
		spec_inst_and_valid ? spec_inst_and_pc_wdata :
		spec_inst_andi_valid ? spec_inst_andi_pc_wdata :
		spec_inst_asr_valid ? spec_inst_asr_pc_wdata :
		spec_inst_bf_valid ? spec_inst_bf_pc_wdata :
		spec_inst_bra_valid ? spec_inst_bra_pc_wdata :
		spec_inst_bt_valid ? spec_inst_bt_pc_wdata :
		spec_inst_call_valid ? spec_inst_call_pc_wdata :
		spec_inst_cf_valid ? spec_inst_cf_pc_wdata :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_pc_wdata :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_pc_wdata :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_pc_wdata :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_pc_wdata :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_pc_wdata :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_pc_wdata :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_pc_wdata :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_pc_wdata :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_pc_wdata :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_pc_wdata :
		spec_inst_ct_valid ? spec_inst_ct_pc_wdata :
		spec_inst_flsl_valid ? spec_inst_flsl_pc_wdata :
		spec_inst_flsr_valid ? spec_inst_flsr_pc_wdata :
		spec_inst_ld_valid ? spec_inst_ld_pc_wdata :
		spec_inst_ldb_valid ? spec_inst_ldb_pc_wdata :
		spec_inst_ldh_valid ? spec_inst_ldh_pc_wdata :
		spec_inst_lsl_valid ? spec_inst_lsl_pc_wdata :
		spec_inst_lsr_valid ? spec_inst_lsr_pc_wdata :
		spec_inst_mf_valid ? spec_inst_mf_pc_wdata :
		spec_inst_mfi_valid ? spec_inst_mfi_pc_wdata :
		spec_inst_mfrc_valid ? spec_inst_mfrc_pc_wdata :
		spec_inst_mov_valid ? spec_inst_mov_pc_wdata :
		spec_inst_movi_valid ? spec_inst_movi_pc_wdata :
		spec_inst_movl_valid ? spec_inst_movl_pc_wdata :
		spec_inst_movu_valid ? spec_inst_movu_pc_wdata :
		spec_inst_mt_valid ? spec_inst_mt_pc_wdata :
		spec_inst_mti_valid ? spec_inst_mti_pc_wdata :
		spec_inst_nand_valid ? spec_inst_nand_pc_wdata :
		spec_inst_nandi_valid ? spec_inst_nandi_pc_wdata :
		spec_inst_nop_valid ? spec_inst_nop_pc_wdata :
		spec_inst_or_valid ? spec_inst_or_pc_wdata :
		spec_inst_ori_valid ? spec_inst_ori_pc_wdata :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_pc_wdata :
		spec_inst_rasr_valid ? spec_inst_rasr_pc_wdata :
		spec_inst_rbra_valid ? spec_inst_rbra_pc_wdata :
		spec_inst_rcall_valid ? spec_inst_rcall_pc_wdata :
		spec_inst_ret_valid ? spec_inst_ret_pc_wdata :
		spec_inst_rld_valid ? spec_inst_rld_pc_wdata :
		spec_inst_rldb_valid ? spec_inst_rldb_pc_wdata :
		spec_inst_rldh_valid ? spec_inst_rldh_pc_wdata :
		spec_inst_rlsl_valid ? spec_inst_rlsl_pc_wdata :
		spec_inst_rlsr_valid ? spec_inst_rlsr_pc_wdata :
		spec_inst_robra_valid ? spec_inst_robra_pc_wdata :
		spec_inst_rocall_valid ? spec_inst_rocall_pc_wdata :
		spec_inst_ror_valid ? spec_inst_ror_pc_wdata :
		spec_inst_rror_valid ? spec_inst_rror_pc_wdata :
		spec_inst_rst_valid ? spec_inst_rst_pc_wdata :
		spec_inst_rstb_valid ? spec_inst_rstb_pc_wdata :
		spec_inst_rsth_valid ? spec_inst_rsth_pc_wdata :
		spec_inst_slt_valid ? spec_inst_slt_pc_wdata :
		spec_inst_slti_valid ? spec_inst_slti_pc_wdata :
		spec_inst_sltiu_valid ? spec_inst_sltiu_pc_wdata :
		spec_inst_sltu_valid ? spec_inst_sltu_pc_wdata :
		spec_inst_st_valid ? spec_inst_st_pc_wdata :
		spec_inst_stb_valid ? spec_inst_stb_pc_wdata :
		spec_inst_sth_valid ? spec_inst_sth_pc_wdata :
		spec_inst_sub_valid ? spec_inst_sub_pc_wdata :
		spec_inst_xor_valid ? spec_inst_xor_pc_wdata :
		spec_inst_xori_valid ? spec_inst_xori_pc_wdata : 0;
  assign spec_mcr_wmask =
		spec_inst_add_valid ? spec_inst_add_mcr_wmask :
		spec_inst_addi_valid ? spec_inst_addi_mcr_wmask :
		spec_inst_and_valid ? spec_inst_and_mcr_wmask :
		spec_inst_andi_valid ? spec_inst_andi_mcr_wmask :
		spec_inst_asr_valid ? spec_inst_asr_mcr_wmask :
		spec_inst_bf_valid ? spec_inst_bf_mcr_wmask :
		spec_inst_bra_valid ? spec_inst_bra_mcr_wmask :
		spec_inst_bt_valid ? spec_inst_bt_mcr_wmask :
		spec_inst_call_valid ? spec_inst_call_mcr_wmask :
		spec_inst_cf_valid ? spec_inst_cf_mcr_wmask :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_mcr_wmask :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_mcr_wmask :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_mcr_wmask :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_mcr_wmask :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_mcr_wmask :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_mcr_wmask :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_mcr_wmask :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_mcr_wmask :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_mcr_wmask :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_mcr_wmask :
		spec_inst_ct_valid ? spec_inst_ct_mcr_wmask :
		spec_inst_flsl_valid ? spec_inst_flsl_mcr_wmask :
		spec_inst_flsr_valid ? spec_inst_flsr_mcr_wmask :
		spec_inst_ld_valid ? spec_inst_ld_mcr_wmask :
		spec_inst_ldb_valid ? spec_inst_ldb_mcr_wmask :
		spec_inst_ldh_valid ? spec_inst_ldh_mcr_wmask :
		spec_inst_lsl_valid ? spec_inst_lsl_mcr_wmask :
		spec_inst_lsr_valid ? spec_inst_lsr_mcr_wmask :
		spec_inst_mf_valid ? spec_inst_mf_mcr_wmask :
		spec_inst_mfi_valid ? spec_inst_mfi_mcr_wmask :
		spec_inst_mfrc_valid ? spec_inst_mfrc_mcr_wmask :
		spec_inst_mov_valid ? spec_inst_mov_mcr_wmask :
		spec_inst_movi_valid ? spec_inst_movi_mcr_wmask :
		spec_inst_movl_valid ? spec_inst_movl_mcr_wmask :
		spec_inst_movu_valid ? spec_inst_movu_mcr_wmask :
		spec_inst_mt_valid ? spec_inst_mt_mcr_wmask :
		spec_inst_mti_valid ? spec_inst_mti_mcr_wmask :
		spec_inst_nand_valid ? spec_inst_nand_mcr_wmask :
		spec_inst_nandi_valid ? spec_inst_nandi_mcr_wmask :
		spec_inst_nop_valid ? spec_inst_nop_mcr_wmask :
		spec_inst_or_valid ? spec_inst_or_mcr_wmask :
		spec_inst_ori_valid ? spec_inst_ori_mcr_wmask :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_mcr_wmask :
		spec_inst_rasr_valid ? spec_inst_rasr_mcr_wmask :
		spec_inst_rbra_valid ? spec_inst_rbra_mcr_wmask :
		spec_inst_rcall_valid ? spec_inst_rcall_mcr_wmask :
		spec_inst_ret_valid ? spec_inst_ret_mcr_wmask :
		spec_inst_rld_valid ? spec_inst_rld_mcr_wmask :
		spec_inst_rldb_valid ? spec_inst_rldb_mcr_wmask :
		spec_inst_rldh_valid ? spec_inst_rldh_mcr_wmask :
		spec_inst_rlsl_valid ? spec_inst_rlsl_mcr_wmask :
		spec_inst_rlsr_valid ? spec_inst_rlsr_mcr_wmask :
		spec_inst_robra_valid ? spec_inst_robra_mcr_wmask :
		spec_inst_rocall_valid ? spec_inst_rocall_mcr_wmask :
		spec_inst_ror_valid ? spec_inst_ror_mcr_wmask :
		spec_inst_rror_valid ? spec_inst_rror_mcr_wmask :
		spec_inst_rst_valid ? spec_inst_rst_mcr_wmask :
		spec_inst_rstb_valid ? spec_inst_rstb_mcr_wmask :
		spec_inst_rsth_valid ? spec_inst_rsth_mcr_wmask :
		spec_inst_slt_valid ? spec_inst_slt_mcr_wmask :
		spec_inst_slti_valid ? spec_inst_slti_mcr_wmask :
		spec_inst_sltiu_valid ? spec_inst_sltiu_mcr_wmask :
		spec_inst_sltu_valid ? spec_inst_sltu_mcr_wmask :
		spec_inst_st_valid ? spec_inst_st_mcr_wmask :
		spec_inst_stb_valid ? spec_inst_stb_mcr_wmask :
		spec_inst_sth_valid ? spec_inst_sth_mcr_wmask :
		spec_inst_sub_valid ? spec_inst_sub_mcr_wmask :
		spec_inst_xor_valid ? spec_inst_xor_mcr_wmask :
		spec_inst_xori_valid ? spec_inst_xori_mcr_wmask : 0;
  assign spec_mcr_wdata =
		spec_inst_add_valid ? spec_inst_add_mcr_wdata :
		spec_inst_addi_valid ? spec_inst_addi_mcr_wdata :
		spec_inst_and_valid ? spec_inst_and_mcr_wdata :
		spec_inst_andi_valid ? spec_inst_andi_mcr_wdata :
		spec_inst_asr_valid ? spec_inst_asr_mcr_wdata :
		spec_inst_bf_valid ? spec_inst_bf_mcr_wdata :
		spec_inst_bra_valid ? spec_inst_bra_mcr_wdata :
		spec_inst_bt_valid ? spec_inst_bt_mcr_wdata :
		spec_inst_call_valid ? spec_inst_call_mcr_wdata :
		spec_inst_cf_valid ? spec_inst_cf_mcr_wdata :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_mcr_wdata :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_mcr_wdata :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_mcr_wdata :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_mcr_wdata :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_mcr_wdata :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_mcr_wdata :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_mcr_wdata :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_mcr_wdata :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_mcr_wdata :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_mcr_wdata :
		spec_inst_ct_valid ? spec_inst_ct_mcr_wdata :
		spec_inst_flsl_valid ? spec_inst_flsl_mcr_wdata :
		spec_inst_flsr_valid ? spec_inst_flsr_mcr_wdata :
		spec_inst_ld_valid ? spec_inst_ld_mcr_wdata :
		spec_inst_ldb_valid ? spec_inst_ldb_mcr_wdata :
		spec_inst_ldh_valid ? spec_inst_ldh_mcr_wdata :
		spec_inst_lsl_valid ? spec_inst_lsl_mcr_wdata :
		spec_inst_lsr_valid ? spec_inst_lsr_mcr_wdata :
		spec_inst_mf_valid ? spec_inst_mf_mcr_wdata :
		spec_inst_mfi_valid ? spec_inst_mfi_mcr_wdata :
		spec_inst_mfrc_valid ? spec_inst_mfrc_mcr_wdata :
		spec_inst_mov_valid ? spec_inst_mov_mcr_wdata :
		spec_inst_movi_valid ? spec_inst_movi_mcr_wdata :
		spec_inst_movl_valid ? spec_inst_movl_mcr_wdata :
		spec_inst_movu_valid ? spec_inst_movu_mcr_wdata :
		spec_inst_mt_valid ? spec_inst_mt_mcr_wdata :
		spec_inst_mti_valid ? spec_inst_mti_mcr_wdata :
		spec_inst_nand_valid ? spec_inst_nand_mcr_wdata :
		spec_inst_nandi_valid ? spec_inst_nandi_mcr_wdata :
		spec_inst_nop_valid ? spec_inst_nop_mcr_wdata :
		spec_inst_or_valid ? spec_inst_or_mcr_wdata :
		spec_inst_ori_valid ? spec_inst_ori_mcr_wdata :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_mcr_wdata :
		spec_inst_rasr_valid ? spec_inst_rasr_mcr_wdata :
		spec_inst_rbra_valid ? spec_inst_rbra_mcr_wdata :
		spec_inst_rcall_valid ? spec_inst_rcall_mcr_wdata :
		spec_inst_ret_valid ? spec_inst_ret_mcr_wdata :
		spec_inst_rld_valid ? spec_inst_rld_mcr_wdata :
		spec_inst_rldb_valid ? spec_inst_rldb_mcr_wdata :
		spec_inst_rldh_valid ? spec_inst_rldh_mcr_wdata :
		spec_inst_rlsl_valid ? spec_inst_rlsl_mcr_wdata :
		spec_inst_rlsr_valid ? spec_inst_rlsr_mcr_wdata :
		spec_inst_robra_valid ? spec_inst_robra_mcr_wdata :
		spec_inst_rocall_valid ? spec_inst_rocall_mcr_wdata :
		spec_inst_ror_valid ? spec_inst_ror_mcr_wdata :
		spec_inst_rror_valid ? spec_inst_rror_mcr_wdata :
		spec_inst_rst_valid ? spec_inst_rst_mcr_wdata :
		spec_inst_rstb_valid ? spec_inst_rstb_mcr_wdata :
		spec_inst_rsth_valid ? spec_inst_rsth_mcr_wdata :
		spec_inst_slt_valid ? spec_inst_slt_mcr_wdata :
		spec_inst_slti_valid ? spec_inst_slti_mcr_wdata :
		spec_inst_sltiu_valid ? spec_inst_sltiu_mcr_wdata :
		spec_inst_sltu_valid ? spec_inst_sltu_mcr_wdata :
		spec_inst_st_valid ? spec_inst_st_mcr_wdata :
		spec_inst_stb_valid ? spec_inst_stb_mcr_wdata :
		spec_inst_sth_valid ? spec_inst_sth_mcr_wdata :
		spec_inst_sub_valid ? spec_inst_sub_mcr_wdata :
		spec_inst_xor_valid ? spec_inst_xor_mcr_wdata :
		spec_inst_xori_valid ? spec_inst_xori_mcr_wdata : 0;
  assign spec_mem_addr =
		spec_inst_add_valid ? spec_inst_add_mem_addr :
		spec_inst_addi_valid ? spec_inst_addi_mem_addr :
		spec_inst_and_valid ? spec_inst_and_mem_addr :
		spec_inst_andi_valid ? spec_inst_andi_mem_addr :
		spec_inst_asr_valid ? spec_inst_asr_mem_addr :
		spec_inst_bf_valid ? spec_inst_bf_mem_addr :
		spec_inst_bra_valid ? spec_inst_bra_mem_addr :
		spec_inst_bt_valid ? spec_inst_bt_mem_addr :
		spec_inst_call_valid ? spec_inst_call_mem_addr :
		spec_inst_cf_valid ? spec_inst_cf_mem_addr :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_mem_addr :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_mem_addr :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_mem_addr :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_mem_addr :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_mem_addr :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_mem_addr :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_mem_addr :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_mem_addr :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_mem_addr :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_mem_addr :
		spec_inst_ct_valid ? spec_inst_ct_mem_addr :
		spec_inst_flsl_valid ? spec_inst_flsl_mem_addr :
		spec_inst_flsr_valid ? spec_inst_flsr_mem_addr :
		spec_inst_ld_valid ? spec_inst_ld_mem_addr :
		spec_inst_ldb_valid ? spec_inst_ldb_mem_addr :
		spec_inst_ldh_valid ? spec_inst_ldh_mem_addr :
		spec_inst_lsl_valid ? spec_inst_lsl_mem_addr :
		spec_inst_lsr_valid ? spec_inst_lsr_mem_addr :
		spec_inst_mf_valid ? spec_inst_mf_mem_addr :
		spec_inst_mfi_valid ? spec_inst_mfi_mem_addr :
		spec_inst_mfrc_valid ? spec_inst_mfrc_mem_addr :
		spec_inst_mov_valid ? spec_inst_mov_mem_addr :
		spec_inst_movi_valid ? spec_inst_movi_mem_addr :
		spec_inst_movl_valid ? spec_inst_movl_mem_addr :
		spec_inst_movu_valid ? spec_inst_movu_mem_addr :
		spec_inst_mt_valid ? spec_inst_mt_mem_addr :
		spec_inst_mti_valid ? spec_inst_mti_mem_addr :
		spec_inst_nand_valid ? spec_inst_nand_mem_addr :
		spec_inst_nandi_valid ? spec_inst_nandi_mem_addr :
		spec_inst_nop_valid ? spec_inst_nop_mem_addr :
		spec_inst_or_valid ? spec_inst_or_mem_addr :
		spec_inst_ori_valid ? spec_inst_ori_mem_addr :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_mem_addr :
		spec_inst_rasr_valid ? spec_inst_rasr_mem_addr :
		spec_inst_rbra_valid ? spec_inst_rbra_mem_addr :
		spec_inst_rcall_valid ? spec_inst_rcall_mem_addr :
		spec_inst_ret_valid ? spec_inst_ret_mem_addr :
		spec_inst_rld_valid ? spec_inst_rld_mem_addr :
		spec_inst_rldb_valid ? spec_inst_rldb_mem_addr :
		spec_inst_rldh_valid ? spec_inst_rldh_mem_addr :
		spec_inst_rlsl_valid ? spec_inst_rlsl_mem_addr :
		spec_inst_rlsr_valid ? spec_inst_rlsr_mem_addr :
		spec_inst_robra_valid ? spec_inst_robra_mem_addr :
		spec_inst_rocall_valid ? spec_inst_rocall_mem_addr :
		spec_inst_ror_valid ? spec_inst_ror_mem_addr :
		spec_inst_rror_valid ? spec_inst_rror_mem_addr :
		spec_inst_rst_valid ? spec_inst_rst_mem_addr :
		spec_inst_rstb_valid ? spec_inst_rstb_mem_addr :
		spec_inst_rsth_valid ? spec_inst_rsth_mem_addr :
		spec_inst_slt_valid ? spec_inst_slt_mem_addr :
		spec_inst_slti_valid ? spec_inst_slti_mem_addr :
		spec_inst_sltiu_valid ? spec_inst_sltiu_mem_addr :
		spec_inst_sltu_valid ? spec_inst_sltu_mem_addr :
		spec_inst_st_valid ? spec_inst_st_mem_addr :
		spec_inst_stb_valid ? spec_inst_stb_mem_addr :
		spec_inst_sth_valid ? spec_inst_sth_mem_addr :
		spec_inst_sub_valid ? spec_inst_sub_mem_addr :
		spec_inst_xor_valid ? spec_inst_xor_mem_addr :
		spec_inst_xori_valid ? spec_inst_xori_mem_addr : 0;
  assign spec_mem_rmask =
		spec_inst_add_valid ? spec_inst_add_mem_rmask :
		spec_inst_addi_valid ? spec_inst_addi_mem_rmask :
		spec_inst_and_valid ? spec_inst_and_mem_rmask :
		spec_inst_andi_valid ? spec_inst_andi_mem_rmask :
		spec_inst_asr_valid ? spec_inst_asr_mem_rmask :
		spec_inst_bf_valid ? spec_inst_bf_mem_rmask :
		spec_inst_bra_valid ? spec_inst_bra_mem_rmask :
		spec_inst_bt_valid ? spec_inst_bt_mem_rmask :
		spec_inst_call_valid ? spec_inst_call_mem_rmask :
		spec_inst_cf_valid ? spec_inst_cf_mem_rmask :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_mem_rmask :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_mem_rmask :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_mem_rmask :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_mem_rmask :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_mem_rmask :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_mem_rmask :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_mem_rmask :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_mem_rmask :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_mem_rmask :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_mem_rmask :
		spec_inst_ct_valid ? spec_inst_ct_mem_rmask :
		spec_inst_flsl_valid ? spec_inst_flsl_mem_rmask :
		spec_inst_flsr_valid ? spec_inst_flsr_mem_rmask :
		spec_inst_ld_valid ? spec_inst_ld_mem_rmask :
		spec_inst_ldb_valid ? spec_inst_ldb_mem_rmask :
		spec_inst_ldh_valid ? spec_inst_ldh_mem_rmask :
		spec_inst_lsl_valid ? spec_inst_lsl_mem_rmask :
		spec_inst_lsr_valid ? spec_inst_lsr_mem_rmask :
		spec_inst_mf_valid ? spec_inst_mf_mem_rmask :
		spec_inst_mfi_valid ? spec_inst_mfi_mem_rmask :
		spec_inst_mfrc_valid ? spec_inst_mfrc_mem_rmask :
		spec_inst_mov_valid ? spec_inst_mov_mem_rmask :
		spec_inst_movi_valid ? spec_inst_movi_mem_rmask :
		spec_inst_movl_valid ? spec_inst_movl_mem_rmask :
		spec_inst_movu_valid ? spec_inst_movu_mem_rmask :
		spec_inst_mt_valid ? spec_inst_mt_mem_rmask :
		spec_inst_mti_valid ? spec_inst_mti_mem_rmask :
		spec_inst_nand_valid ? spec_inst_nand_mem_rmask :
		spec_inst_nandi_valid ? spec_inst_nandi_mem_rmask :
		spec_inst_nop_valid ? spec_inst_nop_mem_rmask :
		spec_inst_or_valid ? spec_inst_or_mem_rmask :
		spec_inst_ori_valid ? spec_inst_ori_mem_rmask :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_mem_rmask :
		spec_inst_rasr_valid ? spec_inst_rasr_mem_rmask :
		spec_inst_rbra_valid ? spec_inst_rbra_mem_rmask :
		spec_inst_rcall_valid ? spec_inst_rcall_mem_rmask :
		spec_inst_ret_valid ? spec_inst_ret_mem_rmask :
		spec_inst_rld_valid ? spec_inst_rld_mem_rmask :
		spec_inst_rldb_valid ? spec_inst_rldb_mem_rmask :
		spec_inst_rldh_valid ? spec_inst_rldh_mem_rmask :
		spec_inst_rlsl_valid ? spec_inst_rlsl_mem_rmask :
		spec_inst_rlsr_valid ? spec_inst_rlsr_mem_rmask :
		spec_inst_robra_valid ? spec_inst_robra_mem_rmask :
		spec_inst_rocall_valid ? spec_inst_rocall_mem_rmask :
		spec_inst_ror_valid ? spec_inst_ror_mem_rmask :
		spec_inst_rror_valid ? spec_inst_rror_mem_rmask :
		spec_inst_rst_valid ? spec_inst_rst_mem_rmask :
		spec_inst_rstb_valid ? spec_inst_rstb_mem_rmask :
		spec_inst_rsth_valid ? spec_inst_rsth_mem_rmask :
		spec_inst_slt_valid ? spec_inst_slt_mem_rmask :
		spec_inst_slti_valid ? spec_inst_slti_mem_rmask :
		spec_inst_sltiu_valid ? spec_inst_sltiu_mem_rmask :
		spec_inst_sltu_valid ? spec_inst_sltu_mem_rmask :
		spec_inst_st_valid ? spec_inst_st_mem_rmask :
		spec_inst_stb_valid ? spec_inst_stb_mem_rmask :
		spec_inst_sth_valid ? spec_inst_sth_mem_rmask :
		spec_inst_sub_valid ? spec_inst_sub_mem_rmask :
		spec_inst_xor_valid ? spec_inst_xor_mem_rmask :
		spec_inst_xori_valid ? spec_inst_xori_mem_rmask : 0;
  assign spec_mem_wmask =
		spec_inst_add_valid ? spec_inst_add_mem_wmask :
		spec_inst_addi_valid ? spec_inst_addi_mem_wmask :
		spec_inst_and_valid ? spec_inst_and_mem_wmask :
		spec_inst_andi_valid ? spec_inst_andi_mem_wmask :
		spec_inst_asr_valid ? spec_inst_asr_mem_wmask :
		spec_inst_bf_valid ? spec_inst_bf_mem_wmask :
		spec_inst_bra_valid ? spec_inst_bra_mem_wmask :
		spec_inst_bt_valid ? spec_inst_bt_mem_wmask :
		spec_inst_call_valid ? spec_inst_call_mem_wmask :
		spec_inst_cf_valid ? spec_inst_cf_mem_wmask :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_mem_wmask :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_mem_wmask :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_mem_wmask :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_mem_wmask :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_mem_wmask :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_mem_wmask :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_mem_wmask :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_mem_wmask :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_mem_wmask :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_mem_wmask :
		spec_inst_ct_valid ? spec_inst_ct_mem_wmask :
		spec_inst_flsl_valid ? spec_inst_flsl_mem_wmask :
		spec_inst_flsr_valid ? spec_inst_flsr_mem_wmask :
		spec_inst_ld_valid ? spec_inst_ld_mem_wmask :
		spec_inst_ldb_valid ? spec_inst_ldb_mem_wmask :
		spec_inst_ldh_valid ? spec_inst_ldh_mem_wmask :
		spec_inst_lsl_valid ? spec_inst_lsl_mem_wmask :
		spec_inst_lsr_valid ? spec_inst_lsr_mem_wmask :
		spec_inst_mf_valid ? spec_inst_mf_mem_wmask :
		spec_inst_mfi_valid ? spec_inst_mfi_mem_wmask :
		spec_inst_mfrc_valid ? spec_inst_mfrc_mem_wmask :
		spec_inst_mov_valid ? spec_inst_mov_mem_wmask :
		spec_inst_movi_valid ? spec_inst_movi_mem_wmask :
		spec_inst_movl_valid ? spec_inst_movl_mem_wmask :
		spec_inst_movu_valid ? spec_inst_movu_mem_wmask :
		spec_inst_mt_valid ? spec_inst_mt_mem_wmask :
		spec_inst_mti_valid ? spec_inst_mti_mem_wmask :
		spec_inst_nand_valid ? spec_inst_nand_mem_wmask :
		spec_inst_nandi_valid ? spec_inst_nandi_mem_wmask :
		spec_inst_nop_valid ? spec_inst_nop_mem_wmask :
		spec_inst_or_valid ? spec_inst_or_mem_wmask :
		spec_inst_ori_valid ? spec_inst_ori_mem_wmask :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_mem_wmask :
		spec_inst_rasr_valid ? spec_inst_rasr_mem_wmask :
		spec_inst_rbra_valid ? spec_inst_rbra_mem_wmask :
		spec_inst_rcall_valid ? spec_inst_rcall_mem_wmask :
		spec_inst_ret_valid ? spec_inst_ret_mem_wmask :
		spec_inst_rld_valid ? spec_inst_rld_mem_wmask :
		spec_inst_rldb_valid ? spec_inst_rldb_mem_wmask :
		spec_inst_rldh_valid ? spec_inst_rldh_mem_wmask :
		spec_inst_rlsl_valid ? spec_inst_rlsl_mem_wmask :
		spec_inst_rlsr_valid ? spec_inst_rlsr_mem_wmask :
		spec_inst_robra_valid ? spec_inst_robra_mem_wmask :
		spec_inst_rocall_valid ? spec_inst_rocall_mem_wmask :
		spec_inst_ror_valid ? spec_inst_ror_mem_wmask :
		spec_inst_rror_valid ? spec_inst_rror_mem_wmask :
		spec_inst_rst_valid ? spec_inst_rst_mem_wmask :
		spec_inst_rstb_valid ? spec_inst_rstb_mem_wmask :
		spec_inst_rsth_valid ? spec_inst_rsth_mem_wmask :
		spec_inst_slt_valid ? spec_inst_slt_mem_wmask :
		spec_inst_slti_valid ? spec_inst_slti_mem_wmask :
		spec_inst_sltiu_valid ? spec_inst_sltiu_mem_wmask :
		spec_inst_sltu_valid ? spec_inst_sltu_mem_wmask :
		spec_inst_st_valid ? spec_inst_st_mem_wmask :
		spec_inst_stb_valid ? spec_inst_stb_mem_wmask :
		spec_inst_sth_valid ? spec_inst_sth_mem_wmask :
		spec_inst_sub_valid ? spec_inst_sub_mem_wmask :
		spec_inst_xor_valid ? spec_inst_xor_mem_wmask :
		spec_inst_xori_valid ? spec_inst_xori_mem_wmask : 0;
  assign spec_mem_wdata =
		spec_inst_add_valid ? spec_inst_add_mem_wdata :
		spec_inst_addi_valid ? spec_inst_addi_mem_wdata :
		spec_inst_and_valid ? spec_inst_and_mem_wdata :
		spec_inst_andi_valid ? spec_inst_andi_mem_wdata :
		spec_inst_asr_valid ? spec_inst_asr_mem_wdata :
		spec_inst_bf_valid ? spec_inst_bf_mem_wdata :
		spec_inst_bra_valid ? spec_inst_bra_mem_wdata :
		spec_inst_bt_valid ? spec_inst_bt_mem_wdata :
		spec_inst_call_valid ? spec_inst_call_mem_wdata :
		spec_inst_cf_valid ? spec_inst_cf_mem_wdata :
		spec_inst_cmp.eq_valid ? spec_inst_cmp.eq_mem_wdata :
		spec_inst_cmp.le_valid ? spec_inst_cmp.le_mem_wdata :
		spec_inst_cmp.lo_valid ? spec_inst_cmp.lo_mem_wdata :
		spec_inst_cmp.ls_valid ? spec_inst_cmp.ls_mem_wdata :
		spec_inst_cmp.lt_valid ? spec_inst_cmp.lt_mem_wdata :
		spec_inst_cmpi.eq_valid ? spec_inst_cmpi.eq_mem_wdata :
		spec_inst_cmpi.le_valid ? spec_inst_cmpi.le_mem_wdata :
		spec_inst_cmpi.lo_valid ? spec_inst_cmpi.lo_mem_wdata :
		spec_inst_cmpi.ls_valid ? spec_inst_cmpi.ls_mem_wdata :
		spec_inst_cmpi.lt_valid ? spec_inst_cmpi.lt_mem_wdata :
		spec_inst_ct_valid ? spec_inst_ct_mem_wdata :
		spec_inst_flsl_valid ? spec_inst_flsl_mem_wdata :
		spec_inst_flsr_valid ? spec_inst_flsr_mem_wdata :
		spec_inst_ld_valid ? spec_inst_ld_mem_wdata :
		spec_inst_ldb_valid ? spec_inst_ldb_mem_wdata :
		spec_inst_ldh_valid ? spec_inst_ldh_mem_wdata :
		spec_inst_lsl_valid ? spec_inst_lsl_mem_wdata :
		spec_inst_lsr_valid ? spec_inst_lsr_mem_wdata :
		spec_inst_mf_valid ? spec_inst_mf_mem_wdata :
		spec_inst_mfi_valid ? spec_inst_mfi_mem_wdata :
		spec_inst_mfrc_valid ? spec_inst_mfrc_mem_wdata :
		spec_inst_mov_valid ? spec_inst_mov_mem_wdata :
		spec_inst_movi_valid ? spec_inst_movi_mem_wdata :
		spec_inst_movl_valid ? spec_inst_movl_mem_wdata :
		spec_inst_movu_valid ? spec_inst_movu_mem_wdata :
		spec_inst_mt_valid ? spec_inst_mt_mem_wdata :
		spec_inst_mti_valid ? spec_inst_mti_mem_wdata :
		spec_inst_nand_valid ? spec_inst_nand_mem_wdata :
		spec_inst_nandi_valid ? spec_inst_nandi_mem_wdata :
		spec_inst_nop_valid ? spec_inst_nop_mem_wdata :
		spec_inst_or_valid ? spec_inst_or_mem_wdata :
		spec_inst_ori_valid ? spec_inst_ori_mem_wdata :
		spec_inst_pcaddi_valid ? spec_inst_pcaddi_mem_wdata :
		spec_inst_rasr_valid ? spec_inst_rasr_mem_wdata :
		spec_inst_rbra_valid ? spec_inst_rbra_mem_wdata :
		spec_inst_rcall_valid ? spec_inst_rcall_mem_wdata :
		spec_inst_ret_valid ? spec_inst_ret_mem_wdata :
		spec_inst_rld_valid ? spec_inst_rld_mem_wdata :
		spec_inst_rldb_valid ? spec_inst_rldb_mem_wdata :
		spec_inst_rldh_valid ? spec_inst_rldh_mem_wdata :
		spec_inst_rlsl_valid ? spec_inst_rlsl_mem_wdata :
		spec_inst_rlsr_valid ? spec_inst_rlsr_mem_wdata :
		spec_inst_robra_valid ? spec_inst_robra_mem_wdata :
		spec_inst_rocall_valid ? spec_inst_rocall_mem_wdata :
		spec_inst_ror_valid ? spec_inst_ror_mem_wdata :
		spec_inst_rror_valid ? spec_inst_rror_mem_wdata :
		spec_inst_rst_valid ? spec_inst_rst_mem_wdata :
		spec_inst_rstb_valid ? spec_inst_rstb_mem_wdata :
		spec_inst_rsth_valid ? spec_inst_rsth_mem_wdata :
		spec_inst_slt_valid ? spec_inst_slt_mem_wdata :
		spec_inst_slti_valid ? spec_inst_slti_mem_wdata :
		spec_inst_sltiu_valid ? spec_inst_sltiu_mem_wdata :
		spec_inst_sltu_valid ? spec_inst_sltu_mem_wdata :
		spec_inst_st_valid ? spec_inst_st_mem_wdata :
		spec_inst_stb_valid ? spec_inst_stb_mem_wdata :
		spec_inst_sth_valid ? spec_inst_sth_mem_wdata :
		spec_inst_sub_valid ? spec_inst_sub_mem_wdata :
		spec_inst_xor_valid ? spec_inst_xor_mem_wdata :
		spec_inst_xori_valid ? spec_inst_xori_mem_wdata : 0;
endmodule
