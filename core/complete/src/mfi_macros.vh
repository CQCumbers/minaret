`define MFI_WIRES                        \
(* keep *) wire          mfi_valid;      \
(* keep *) wire [31 : 0] mfi_order;      \
(* keep *) wire [31 : 0] mfi_inst;       \
(* keep *) wire          mfi_trap;       \
(* keep *) wire          mfi_halt;       \
(* keep *) wire          mfi_intr;       \
(* keep *) wire [ 1 : 0] mfi_mode;       \
(* keep *) wire [ 1 : 0] mfi_ixl;        \
(* keep *) wire [ 3 : 0] mfi_src1_addr;  \
(* keep *) wire [ 3 : 0] mfi_src2_addr;  \
(* keep *) wire [31 : 0] mfi_src1_rdata; \
(* keep *) wire [31 : 0] mfi_src2_rdata; \
(* keep *) wire [ 3 : 0] mfi_dest_addr;  \
(* keep *) wire [31 : 0] mfi_dest_wdata; \
(* keep *) wire [31 : 0] mfi_pc_rdata;   \
(* keep *) wire [31 : 0] mfi_pc_wdata;   \
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
.mfi_mode      (mfi_mode      ), \
.mfi_ixl       (mfi_ixl       ), \
.mfi_src1_addr (mfi_src1_addr ), \
.mfi_src2_addr (mfi_src2_addr ), \
.mfi_src1_rdata(mfi_src1_rdata), \
.mfi_src2_rdata(mfi_src2_rdata), \
.mfi_dest_addr (mfi_dest_addr ), \
.mfi_dest_wdata(mfi_dest_wdata), \
.mfi_pc_rdata  (mfi_pc_rdata  ), \
.mfi_pc_wdata  (mfi_pc_wdata  ), \
.mfi_mem_addr  (mfi_mem_addr  ), \
.mfi_mem_rmask (mfi_mem_rmask ), \
.mfi_mem_wmask (mfi_mem_wmask ), \
.mfi_mem_rdata (mfi_mem_rdata ), \
.mfi_mem_wdata (mfi_mem_wdata )  \


