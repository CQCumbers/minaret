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
	reg  [31:0] imem_rdata;

	wire dmem_valid;
	wire dmem_ready;
	wire [31:0] dmem_addr;
	wire [ 3:0] dmem_wmask;
	wire [31:0] dmem_wdata;
	wire [ 3:0] dmem_rmask;
	reg  [31:0] dmem_rdata;

	wire trace_valid;
	wire [35:0] trace_data;

	minaret dut (
		.clk         (clock      ),
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
        .dmem_rmask  (dmem_rmask ),
        .dmem_rdata  (dmem_rdata ),
		.trace_valid (trace_valid),
		.trace_data  (trace_data )
	);

	reg [31:0] memory [0:64*1024-1];
	initial $readmemh("dhry.hex", memory);

	assign mem_ready = 1;

	always @(posedge clk) begin
		mem_rdata[ 7: 0] <= mem_la_read ? memory[mem_la_addr + 0] : 'bx;
		mem_rdata[15: 8] <= mem_la_read ? memory[mem_la_addr + 1] : 'bx;
		mem_rdata[23:16] <= mem_la_read ? memory[mem_la_addr + 2] : 'bx;
		mem_rdata[31:24] <= mem_la_read ? memory[mem_la_addr + 3] : 'bx;
		if (mem_la_write) begin
			case (mem_la_addr)
				32'h1000_0000: begin
`ifndef TIMING
					$write("%c", mem_la_wdata);
					$fflush();
`endif
				end
				default: begin
					if (mem_la_wstrb[0]) memory[mem_la_addr + 0] <= mem_la_wdata[ 7: 0];
					if (mem_la_wstrb[1]) memory[mem_la_addr + 1] <= mem_la_wdata[15: 8];
					if (mem_la_wstrb[2]) memory[mem_la_addr + 2] <= mem_la_wdata[23:16];
					if (mem_la_wstrb[3]) memory[mem_la_addr + 3] <= mem_la_wdata[31:24];
				end
			endcase
		end
	end

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, testbench);
	end

	integer trace_file;

	initial begin
		if ($test$plusargs("trace")) begin
			trace_file = $fopen("testbench.trace", "w");
			repeat (10) @(posedge clk);
			while (!trap) begin
				@(posedge clk);
				if (trace_valid)
					$fwrite(trace_file, "%x\n", trace_data);
			end
			$fclose(trace_file);
			$display("Finished writing testbench.trace.");
		end
	end

	always @(posedge clk) begin
		if (resetn && trap) begin
			repeat (10) @(posedge clk);
			$display("TRAP");
			$finish;
		end
	end

`ifdef TIMING
	initial begin
		repeat (100000) @(posedge clk);
		$finish;
	end
	always @(posedge clk) begin
		if (uut.dbg_next)
			$display("## %-s %d", uut.dbg_ascii_instr ? uut.dbg_ascii_instr : "pcpi", uut.count_cycle);
	end
`endif
endmodule
