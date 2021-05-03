module mfi_wrapper (
    input clock,
    input reset,
    `MFI_OUTPUTS
);
    (* keep *) wire trap;
    (* keep *) `mf_rand_reg imem_ready;
    (* keep *) `mf_rand_reg [31:0] imem_rdata;
    (* keep *) `mf_rand_reg dmem_ready;
    (* keep *) `mf_rand_reg [31:0] dmem_rdata;

    (* keep *) wire        imem_valid;
	(* keep *) wire [31:0] imem_addr;
    (* keep *) wire        dmem_valid;
	(* keep *) wire [31:0] dmem_addr;
	(* keep *) wire [ 3:0] dmem_wmask;
	(* keep *) wire [31:0] dmem_wdata;
	(* keep *) wire [ 3:0] dmem_rmask;

    minaret dut (
        .clk        (clock      ),
        .reset      (reset      ),
        .imem_valid (imem_valid ),
        .imem_ready (imem_ready ),
        .imem_addr  (imem_addr  ),
        .imem_rdata (imem_rdata ),
        .dmem_valid (dmem_valid ),
        .dmem_ready (dmem_ready ),
        .dmem_addr  (dmem_addr  ),
        .dmem_wmask (dmem_wmask ),
        .dmem_wdata (dmem_wdata ),
        .dmem_rmask (dmem_rmask ),
        .dmem_rdata (dmem_rdata ),
        `MFI_CONN
    );
endmodule
