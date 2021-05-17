`timescale 1 ns / 1 ps

module demo;
reg clk = 1;
reg reset = 1;

always #5 clk = ~clk;

initial begin
    repeat (800*525) @(posedge clk);
    reset <= 0;
end

wire dvi_r;
wire dvi_g;
wire dvi_b;
wire dvi_c;

display dut (
    .clk   (clk   ),
    .reset (reset ),
    .dvi_r (dvi_r ),
    .dvi_g (dvi_g ),
    .dvi_b (dvi_b ),
    .dvi_c (dvi_c )
);

initial begin
    $dumpfile("demo.vcd");
    $dumpvars(0, demo);
end

endmodule
