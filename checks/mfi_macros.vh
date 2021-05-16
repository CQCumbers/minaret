`ifdef YOSYS
`define mf_rand_reg rand reg
`define mf_const_rand_reg rand const reg
`else
`ifdef SIMULATION
`define mf_rand_reg reg
`define mf_const_rand_reg reg
`else
`define mf_rand_reg wire
`define mf_const_rand_reg reg
`endif
`endif

`define MFI_WIRES                        \
(* keep *) wire          mfi_valid;      \
(* keep *) wire [31 : 0] mfi_order;      \
(* keep *) wire [31 : 0] mfi_inst;       \
(* keep *) wire          mfi_trap;       \
(* keep *) wire          mfi_halt;       \
(* keep *) wire          mfi_intr;       \
(* keep *) wire [ 3 : 0] mfi_src1_addr;  \
(* keep *) wire [ 3 : 0] mfi_src2_addr;  \
(* keep *) wire [ 3 : 0] mfi_src3_addr;  \
(* keep *) wire [31 : 0] mfi_src1_rdata; \
(* keep *) wire [31 : 0] mfi_src2_rdata; \
(* keep *) wire [31 : 0] mfi_src3_rdata; \
(* keep *) wire [ 3 : 0] mfi_dest_addr;  \
(* keep *) wire [31 : 0] mfi_dest_wdata; \
(* keep *) wire [31 : 0] mfi_pc_rdata;   \
(* keep *) wire [31 : 0] mfi_pc_wdata;   \
(* keep *) wire [31 : 0] mfi_mcr_rdata;  \
(* keep *) wire [31 : 0] mfi_mcr_wdata;  \
(* keep *) wire [31 : 0] mfi_mem_addr;   \
(* keep *) wire [ 3 : 0] mfi_mem_rmask;  \
(* keep *) wire [ 3 : 0] mfi_mem_wmask;  \
(* keep *) wire [31 : 0] mfi_mem_rdata;  \
(* keep *) wire [31 : 0] mfi_mem_wdata;  \

`define MFI_CONN                 \
.mfi_valid     (mfi_valid     ), \
.mfi_order     (mfi_order     ), \
.mfi_inst      (mfi_inst      ), \
.mfi_trap      (mfi_trap      ), \
.mfi_halt      (mfi_halt      ), \
.mfi_intr      (mfi_intr      ), \
.mfi_src1_addr (mfi_src1_addr ), \
.mfi_src2_addr (mfi_src2_addr ), \
.mfi_src3_addr (mfi_src3_addr ), \
.mfi_src1_rdata(mfi_src1_rdata), \
.mfi_src2_rdata(mfi_src2_rdata), \
.mfi_src3_rdata(mfi_src3_rdata), \
.mfi_dest_addr (mfi_dest_addr ), \
.mfi_dest_wdata(mfi_dest_wdata), \
.mfi_pc_rdata  (mfi_pc_rdata  ), \
.mfi_pc_wdata  (mfi_pc_wdata  ), \
.mfi_mcr_rdata (mfi_mcr_rdata ), \
.mfi_mcr_wdata (mfi_mcr_wdata ), \
.mfi_mem_addr  (mfi_mem_addr  ), \
.mfi_mem_rmask (mfi_mem_rmask ), \
.mfi_mem_wmask (mfi_mem_wmask ), \
.mfi_mem_rdata (mfi_mem_rdata ), \
.mfi_mem_wdata (mfi_mem_wdata )  \

`define MFI_INPUTS             \
input          mfi_valid,      \
input [31 : 0] mfi_order,      \
input [31 : 0] mfi_inst,       \
input          mfi_trap,       \
input          mfi_halt,       \
input          mfi_intr,       \
input [ 3 : 0] mfi_src1_addr,  \
input [ 3 : 0] mfi_src2_addr,  \
input [ 3 : 0] mfi_src3_addr,  \
input [31 : 0] mfi_src1_rdata, \
input [31 : 0] mfi_src2_rdata, \
input [31 : 0] mfi_src3_rdata, \
input [ 3 : 0] mfi_dest_addr,  \
input [31 : 0] mfi_dest_wdata, \
input [31 : 0] mfi_pc_rdata,   \
input [31 : 0] mfi_pc_wdata,   \
input [31 : 0] mfi_mcr_rdata,  \
input [31 : 0] mfi_mcr_wdata,  \
input [31 : 0] mfi_mem_addr,   \
input [ 3 : 0] mfi_mem_rmask,  \
input [ 3 : 0] mfi_mem_wmask,  \
input [31 : 0] mfi_mem_rdata,  \
input [31 : 0] mfi_mem_wdata   \

`define MFI_OUTPUTS             \
output          mfi_valid,      \
output [31 : 0] mfi_order,      \
output [31 : 0] mfi_inst,       \
output          mfi_trap,       \
output          mfi_halt,       \
output          mfi_intr,       \
output [ 3 : 0] mfi_src1_addr,  \
output [ 3 : 0] mfi_src2_addr,  \
output [ 3 : 0] mfi_src3_addr,  \
output [31 : 0] mfi_src1_rdata, \
output [31 : 0] mfi_src2_rdata, \
output [31 : 0] mfi_src3_rdata, \
output [ 3 : 0] mfi_dest_addr,  \
output [31 : 0] mfi_dest_wdata, \
output [31 : 0] mfi_pc_rdata,   \
output [31 : 0] mfi_pc_wdata,   \
output [31 : 0] mfi_mcr_rdata,  \
output [31 : 0] mfi_mcr_wdata,  \
output [31 : 0] mfi_mem_addr,   \
output [ 3 : 0] mfi_mem_rmask,  \
output [ 3 : 0] mfi_mem_wmask,  \
output [31 : 0] mfi_mem_rdata,  \
output [31 : 0] mfi_mem_wdata   \
