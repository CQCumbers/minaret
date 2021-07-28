`timescale 1 ns / 1 ps

module testbench;
reg clk = 1;
reg reset = 1;
wire trap;

always #5 clk = ~clk;

initial begin
    repeat (100) @(posedge clk);
    reset <= 0;
end

wire imem_valid;
wire imem_ready;
wire [31:0] imem_addr;
wire [31:0] imem_rdata;

wire dmem_valid;
wire dmem_ready;
wire [31:0] dmem_addr;
wire [ 3:0] dmem_wmask;
wire [31:0] dmem_wdata;
wire [31:0] dmem_rdata;

minaret dut (
    .clk         (clk        ),
    .reset       (reset      ),
    .trap        (trap       ),
    .imem_valid  (imem_valid ),
    .imem_ready  (imem_ready ),
    .imem_addr   (imem_addr  ),
    .imem_rdata  (imem_rdata ),
    .dmem_valid  (dmem_valid ),
    .dmem_ready  (dmem_ready ),
    .dmem_addr   (dmem_addr  ),
    .dmem_wmask  (dmem_wmask ),
    .dmem_wdata  (dmem_wdata ),
    .dmem_rdata  (dmem_rdata )
);

reg [7:0] memory [0:1024*1024-1];
initial $readmemh("hello.hex", memory);

assign imem_ready = 1;
assign imem_rdata[ 7: 0] = memory[imem_addr + 0];
assign imem_rdata[15: 8] = memory[imem_addr + 1];
assign imem_rdata[23:16] = memory[imem_addr + 2];
assign imem_rdata[31:24] = memory[imem_addr + 3];

assign dmem_ready = 1;
assign dmem_rdata[ 7: 0] = memory[dmem_addr + 0];
assign dmem_rdata[15: 8] = memory[dmem_addr + 1];
assign dmem_rdata[23:16] = memory[dmem_addr + 2];
assign dmem_rdata[31:24] = memory[dmem_addr + 3];

always @(posedge clk) begin
    if (dmem_valid) begin
        case (dmem_addr)
            32'hffffff04: begin
                $write("%c", dmem_wdata);
                $fflush();
            end
            default: begin
                if (dmem_wmask[0]) memory[dmem_addr + 0] <= dmem_wdata[ 7: 0];
                if (dmem_wmask[1]) memory[dmem_addr + 1] <= dmem_wdata[15: 8];
                if (dmem_wmask[2]) memory[dmem_addr + 2] <= dmem_wdata[23:16];
                if (dmem_wmask[3]) memory[dmem_addr + 3] <= dmem_wdata[31:24];
            end
        endcase
    end
end

initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, testbench);
end

always @(posedge clk) begin
    if (!reset && trap) begin
        repeat (10) @(posedge clk);
        $display("TRAP");
        $finish;
    end
end

endmodule
