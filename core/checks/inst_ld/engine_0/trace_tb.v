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
    // UUT.$auto$async2sync.\cc:171:execute$819  = 32'b00000000000000000000000000000000;
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
    UUT.wrapper.dut.regs[4'b1101] = 32'b11000010011101110110101110101100;
    UUT.wrapper.dut.regs[4'b0011] = 32'b10111111011000010101000001110110;
    UUT.wrapper.dut.regs[4'b1110] = 32'b00100001010000001000000001101010;
    UUT.wrapper.dut.regs[4'b0110] = 32'b00100001010000001000000001101010;
    UUT.wrapper.dut.regs[4'b0111] = 32'b10100111011000101000011000000100;
    UUT.wrapper.dut.regs[4'b1001] = 32'b00000001000100000000000000001110;
    UUT.wrapper.dut.regs[4'b0000] = 32'b00000001000001010010001000001110;
    UUT.wrapper.dut.regs[4'b0101] = 32'b10100111011000101000000000001110;
    UUT.wrapper.dut.regs[4'b0001] = 32'b00010000000000000000111111110111;
    UUT.wrapper.dut.regs[4'b1100] = 32'b00010011011000100000011000001100;
    UUT.wrapper.dut.regs[4'b1011] = 32'b01000001000100000000000000001111;
    UUT.wrapper.dut.regs[4'b1010] = 32'b00010000000000000000111111110111;
    UUT.wrapper.dut.regs[4'b1000] = 32'b00010000000000000000111111110111;
    UUT.wrapper.dut.regs[4'b0100] = 32'b00110111011000000000000000011110;
    UUT.wrapper.dut.regs[4'b0010] = 32'b00010000000000000000111111110111;
    UUT.wrapper.dut.regs[4'b1111] = 32'b10100111011000101000011000000000;

    // state 0
    PI_reset = 1'b1;
    UUT.inst_valid = 1'b0;
    UUT.inst = 32'b00001001001111010101000000000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00111010011011101111000000000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00111010100101111110000000000000;
    end

    // state 3
    if (cycle == 2) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00011011010100001111000000000000;
    end

    // state 4
    if (cycle == 3) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00011010000110010011000000000000;
    end

    // state 5
    if (cycle == 4) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00011001011011001101000000000000;
    end

    // state 6
    if (cycle == 5) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00111010110100111010000000000000;
    end

    // state 7
    if (cycle == 6) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00001000000100011110000000000000;
    end

    // state 8
    if (cycle == 7) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00001001000110010101000000000000;
    end

    // state 9
    if (cycle == 8) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00011101110010011101000000000000;
    end

    // state 10
    if (cycle == 9) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00001111010110110001000000000000;
    end

    // state 11
    if (cycle == 10) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00001001100111100100000000000000;
    end

    // state 12
    if (cycle == 11) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00011011101000001001000000000000;
    end

    // state 13
    if (cycle == 12) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00001001100000111001000000000000;
    end

    // state 14
    if (cycle == 13) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00111010011011001010000000000000;
    end

    // state 15
    if (cycle == 14) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00001000010010000111000000000000;
    end

    // state 16
    if (cycle == 15) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00001001001000111100000000000000;
    end

    // state 17
    if (cycle == 16) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00011000100000010010000000000000;
    end

    // state 18
    if (cycle == 17) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00001000111100101111000000000000;
    end

    // state 19
    if (cycle == 18) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b1;
      UUT.inst <= 32'b01000000011000010000110111101110;
    end

    // state 20
    if (cycle == 19) begin
      PI_reset <= 1'b0;
      UUT.inst_valid <= 1'b0;
      UUT.inst <= 32'b00000000000000000000000000000000;
    end

    genclock <= cycle < 20;
    cycle <= cycle + 1;
  end
endmodule
