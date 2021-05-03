module mfi_liveness_check (
    input clock, reset, trig, check,
    `MFI_INPUTS
);
    `mf_const_rand_reg [31:0] inst_order;
    reg found_next_inst = 0;

    always @(posedge clock) begin
        if (reset) begin
            found_next_inst = 0;
        end else begin
            if (mfi_valid && mfi_order == inst_order+1) begin
                found_next_inst = 1;
            end
            if (trig) begin
                assume(mfi_valid);
                assume(!mfi_halt);
                assume(inst_order == mfi_order);
            end
            if (check) begin
                assert(found_next_inst);
            end
        end
    end
endmodule
