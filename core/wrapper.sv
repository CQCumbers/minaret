module mfi_wrapper (
    input clock,
    input reset,
    `MFI_OUTPUTS
);
    (* keep *) wire trap;
    (* keep *) `mf_rand_reg inst_valid;
    (* keep *) `mf_rand_reg [31:0] inst;

    minaret dut (
        .clk           (clock         ),
        .reset         (reset         ),
        .inst_valid    (inst_valid    ),
        .inst          (inst          ),
        `MFI_CONN
    );
endmodule
