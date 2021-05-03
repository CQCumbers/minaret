`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  wire [0:0] PI_clock = clock;
  reg [0:0] PI_reset;
  mfi_testbench UUT (
    .clock(PI_clock),
    .reset(PI_reset)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$auto$async2sync.\cc:171:execute$262  = 32'b00000000000000000000000000000000;
    // UUT.\$flatten/checker_inst .$formal$mfi_pc_fwd_check.\sv:23$15_CHECK  = 1'b0;
    // UUT.\$flatten/checker_inst .$formal$mfi_pc_fwd_check.\sv:23$15_EN  = 1'b0;
    UUT.checker_inst.expect_pc = 32'b10000000000000000000000001110000;
    UUT.checker_inst.expect_pc_valid = 1'b0;
    UUT.cycle_reg = 8'b00000000;
    UUT.wrapper.dut.mfi_dest_addr = 4'b0000;
    UUT.wrapper.dut.mfi_dest_wdata = 32'b00000000000000000000000000000000;
    UUT.wrapper.dut.mfi_inst = 32'b00000000000000000000000000000000;
    UUT.wrapper.dut.mfi_order = 32'b00000000000000000000000000000000;
    UUT.wrapper.dut.mfi_pc_rdata = 32'b00000000000000000000000000000000;
    UUT.wrapper.dut.mfi_pc_wdata = 32'b00000000000000000000000000000000;
    UUT.wrapper.dut.mfi_src1_addr = 4'b0000;
    UUT.wrapper.dut.mfi_src1_rdata = 32'b00000000000000000000000000000000;
    UUT.wrapper.dut.mfi_src2_addr = 4'b0000;
    UUT.wrapper.dut.mfi_src2_rdata = 32'b00000000000000000000000000000000;
    UUT.wrapper.dut.mfi_trap = 1'b0;
    UUT.wrapper.dut.mfi_valid = 1'b0;
    UUT.wrapper.dut.pc = 32'b00000000000000000000000000000000;
    UUT.inst_order = 32'b00000000000000000000000000001110;
    UUT.wrapper.dut.regs[4'b0000] = 32'b00000000000000000000000000000000;

    // state 0
    PI_reset = 1'b1;
    UUT.inst_valid = 1'b0;
    UUT.inst = 32'b00000000000000000000000000000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 3
    if (cycle == 2) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 4
    if (cycle == 3) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 5
    if (cycle == 4) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 6
    if (cycle == 5) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 7
    if (cycle == 6) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 8
    if (cycle == 7) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 9
    if (cycle == 8) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 10
    if (cycle == 9) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 11
    if (cycle == 10) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 12
    if (cycle == 11) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 13
    if (cycle == 12) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 14
    if (cycle == 13) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 15
    if (cycle == 14) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 16
    if (cycle == 15) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 17
    if (cycle == 16) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 18
    if (cycle == 17) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 19
    if (cycle == 18) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 20
    if (cycle == 19) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 21
    if (cycle == 20) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 22
    if (cycle == 21) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 23
    if (cycle == 22) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 24
    if (cycle == 23) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 25
    if (cycle == 24) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 26
    if (cycle == 25) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 27
    if (cycle == 26) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 28
    if (cycle == 27) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 29
    if (cycle == 28) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 30
    if (cycle == 29) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    // state 31
    if (cycle == 30) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    genclock <= cycle < 31;
    cycle <= cycle + 1;
  end
endmodule
