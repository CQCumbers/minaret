module mfi_causal_check (
    input clock, reset, check,
    `MFI_INPUTS
);
    `mf_const_rand_reg [31:0] inst_order;
    `mf_const_rand_reg [3:0] register_index;
    reg found_non_causal = 0;

    always @(posedge clock) begin
        if (reset) begin
            found_non_causal = 0;
        end else begin
            if (check) begin
                if (mfi_valid && mfi_order > inst_order &&
                        (register_index == mfi_src1_addr ||
                        register_index == mfi_src2_addr)) begin
                    found_non_causal = 1;
                end
                assume(register_index != 0);
                assume(mfi_valid);
                assume(register_index == mfi_dest_addr);
                assume(inst_order == mfi_order);
                assert(!found_non_causal);
            end else begin
                if (mfi_valid && mfi_order > inst_order &&
                        (register_index == mfi_src1_addr ||
                        register_index == mfi_src2_addr)) begin
                    found_non_causal = 1;
                end
            end
        end
    end
endmodule
