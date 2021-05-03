module mfi_testbench (
	input clock, reset
);
	`MFI_WIRES

`ifdef YOSYS
	assume property (reset == $initstate);
`endif

	reg [7:0] cycle_reg = 0;
	wire [7:0] cycle = reset ? 0 : cycle_reg;

	always @(posedge clock) begin
		cycle_reg <= reset ? 1 : cycle_reg + (cycle_reg != 255);
	end

	`MINA_FORMAL_CHECKER checker_inst (
		.clock  (clock),
		.reset  (cycle < `MINA_FORMAL_RESET_CYCLES),
`ifdef MINA_FORMAL_TRIG_CYCLE
		.trig   (cycle == `MINA_FORMAL_TRIG_CYCLE),
`endif
`ifdef MINA_FORMAL_CHECK_CYCLE
		.check  (cycle == `MINA_FORMAL_CHECK_CYCLE),
`endif
		`MFI_CONN
	);

	mfi_wrapper wrapper (
		.clock (clock),
		.reset (reset),
		`MFI_CONN
	);
endmodule
