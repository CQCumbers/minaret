module mfi_inst_check (
    input clock, reset, check,
    `MFI_INPUTS
);
    (* keep *) wire valid = !reset && mfi_valid;
    (* keep *) wire [31 : 0] inst       = mfi_inst;
    (* keep *) wire          trap       = mfi_trap;
    (* keep *) wire          halt       = mfi_halt;
    (* keep *) wire          intr       = mfi_intr;
    (* keep *) wire [ 3 : 0] src1_addr  = mfi_src1_addr;
    (* keep *) wire [ 3 : 0] src2_addr  = mfi_src2_addr;
    (* keep *) wire [ 3 : 0] src3_addr  = mfi_src3_addr;
    (* keep *) wire [31 : 0] src1_rdata = mfi_src1_rdata;
    (* keep *) wire [31 : 0] src2_rdata = mfi_src2_rdata;
    (* keep *) wire [31 : 0] src3_rdata = mfi_src3_rdata;
    (* keep *) wire [ 3 : 0] dest_addr  = mfi_dest_addr;
    (* keep *) wire [31 : 0] dest_wdata = mfi_dest_wdata;
    (* keep *) wire [31 : 0] pc_rdata   = mfi_pc_rdata;
    (* keep *) wire [31 : 0] pc_wdata   = mfi_pc_wdata;
    (* keep *) wire [31 : 0] mcr_rdata  = mfi_mcr_rdata;
    (* keep *) wire [31 : 0] mcr_wdata  = mfi_mcr_wdata;

    (* keep *) wire [31 : 0] mem_addr   = mfi_mem_addr;
    (* keep *) wire [ 3 : 0] mem_rmask  = mfi_mem_rmask;
    (* keep *) wire [ 3 : 0] mem_wmask  = mfi_mem_wmask;
    (* keep *) wire [31 : 0] mem_rdata  = mfi_mem_rdata;
    (* keep *) wire [31 : 0] mem_wdata  = mfi_mem_wdata;

    (* keep *) wire          spec_valid;
    (* keep *) wire          spec_trap;
    (* keep *) wire [ 3 : 0] spec_src1_addr;
    (* keep *) wire [ 3 : 0] spec_src2_addr;
    (* keep *) wire [ 3 : 0] spec_src3_addr;
    (* keep *) wire [ 3 : 0] spec_dest_addr;
    (* keep *) wire [31 : 0] spec_dest_wdata;
    (* keep *) wire [31 : 0] spec_pc_wdata;
    (* keep *) wire [31 : 0] spec_mcr_wdata;
    (* keep *) wire [31 : 0] spec_mem_addr;
    (* keep *) wire [ 3 : 0] spec_mem_rmask;
    (* keep *) wire [ 3 : 0] spec_mem_wmask;
    (* keep *) wire [31 : 0] spec_mem_wdata;

    `MINA_FORMAL_INST_MODEL inst_spec (
        .mfi_valid     (valid     ),
        .mfi_inst      (inst      ),
        .mfi_pc_rdata  (pc_rdata  ),
        .mfi_mcr_rdata (mcr_rdata ),
        .mfi_src1_rdata(src1_rdata),
        .mfi_src2_rdata(src2_rdata),
        .mfi_src3_rdata(src3_rdata),
        .mfi_mem_rdata (mem_rdata ),

        .spec_valid     (spec_valid     ),
        .spec_trap      (spec_trap      ),
        .spec_src1_addr (spec_src1_addr ),
        .spec_src2_addr (spec_src2_addr ),
        .spec_src3_addr (spec_src3_addr ),
        .spec_dest_addr (spec_dest_addr ),
        .spec_dest_wdata(spec_dest_wdata),
        .spec_pc_wdata  (spec_pc_wdata  ),
        .spec_mcr_wdata (spec_mcr_wdata ),
        .spec_mem_addr  (spec_mem_addr  ),
        .spec_mem_rmask (spec_mem_rmask ),
        .spec_mem_wmask (spec_mem_wmask ),
        .spec_mem_wdata (spec_mem_wdata )
    );

    integer i;

    always @* begin
        if (!reset) begin
            cover(spec_valid);
            cover(spec_valid && !trap);
            cover(check && spec_valid);
            cover(check && spec_valid && !trap);
        end
        if (!reset && check) begin
            assume(spec_valid);

            begin
                assert(spec_src1_addr == src1_addr);
                assert(spec_src2_addr == src2_addr);
                assert(spec_src3_addr == src3_addr);

                if (!spec_trap) begin
                    assert(spec_dest_addr == dest_addr);
                    assert(spec_dest_wdata == dest_wdata);
                    assert(spec_pc_wdata == pc_wdata);
                    assert(spec_mcr_wdata == mcr_wdata);

                    if (spec_mem_wmask || spec_mem_rmask) begin
                        assert(spec_mem_addr == mem_addr);
                    end

                    for (i = 0; i < 4; i = i+1) begin
                        if (spec_mem_wmask[i]) begin
                            assert(mem_wmask[i]);
                            assert(spec_mem_wdata[i*8 +: 8] == mem_wdata[i*8 +: 8]);
                        end else if (mem_wmask[i]) begin
                            assert(mem_rmask[i]);
                            assert(mem_rdata[i*8 +: 8] == mem_wdata[i*8 +: 8]);
                        end
                        if (spec_mem_rmask[i]) begin
                            assert(mem_rmask[i]);
                        end
                    end
                end

                assert(spec_trap == trap);
            end
        end
    end
endmodule
