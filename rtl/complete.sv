module testbench (
    input clk,
    input inst_valid,
    input [31:0] inst
);
    reg reset  = 1;

    always @(posedge clk)
        reset  <= 0;

    `MFI_WIRES

    minaret dut (
        .clk           (clk           ),
        .reset         (reset         ),

        .inst_valid    (inst_valid    ),
        .inst          (inst          ),

        `MFI_CONN
    );

    (* keep *) wire          spec_valid;
    (* keep *) wire          spec_trap;
    (* keep *) wire [ 3 : 0] spec_src1_addr;
    (* keep *) wire [ 3 : 0] spec_src2_addr;
    (* keep *) wire [ 3 : 0] spec_dest_addr;
    (* keep *) wire [31 : 0] spec_dest_wdata;
    (* keep *) wire [31 : 0] spec_pc_wdata;
    (* keep *) wire [31 : 0] spec_mem_addr;
    (* keep *) wire [ 3 : 0] spec_mem_rmask;
    (* keep *) wire [ 3 : 0] spec_mem_wmask;
    (* keep *) wire [31 : 0] spec_mem_wdata;

    mfi_isa_m32 isa_spec (
        .mfi_valid      (mfi_valid      ),
        .mfi_inst       (mfi_inst       ),
        .mfi_pc_rdata   (mfi_pc_rdata   ),
        .mfi_src1_rdata (mfi_src1_rdata ),
        .mfi_src2_rdata (mfi_src2_rdata ),
        .mfi_mem_rdata  (mfi_mem_rdata  ),

        .spec_valid     (spec_valid     ),
        .spec_trap      (spec_trap      ),
        .spec_src1_addr (spec_src1_addr ),
        .spec_src2_addr (spec_src2_addr ),
        .spec_dest_addr (spec_dest_addr ),
        .spec_dest_wdata(spec_dest_wdata),
        .spec_pc_wdata  (spec_pc_wdata  ),
        .spec_mem_addr  (spec_mem_addr  ),
        .spec_mem_rmask (spec_mem_rmask ),
        .spec_mem_wmask (spec_mem_wmask ),
        .spec_mem_wdata (spec_mem_wdata )
    );

    //always @* begin
    always @(posedge clk) begin
        if (!reset && mfi_valid && !mfi_trap) begin
            assert(spec_valid && !spec_trap);
        end
    end
endmodule
