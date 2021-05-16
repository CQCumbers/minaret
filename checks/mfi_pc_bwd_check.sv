module mfi_pc_bwd_check (
    input clock, reset, check,
    `MFI_INPUTS
);
    `mf_const_rand_reg [31:0] inst_order;
    reg [31:0] expect_pc;
    reg expect_pc_valid = 0;

    wire [31:0] pc_wdata = mfi_pc_wdata;

    always @(posedge clock) begin
        if (reset) begin
            expect_pc_valid = 0;
        end else begin
            if (check) begin
                if (mfi_valid && mfi_order == inst_order+1) begin
                    expect_pc = mfi_pc_rdata;
                    expect_pc_valid = 1;
                end

                assume(mfi_valid);
                assume(inst_order == mfi_order);
                if (expect_pc_valid) begin
                    assert(expect_pc == pc_wdata);
                end
            end else begin
                if (mfi_valid && mfi_order == inst_order+1) begin
                    expect_pc = mfi_pc_rdata;
                    expect_pc_valid = 1;
                end
            end
        end
    end
endmodule
