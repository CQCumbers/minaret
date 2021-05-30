module minaret_test (
    input wire clk
);

// Generate reset
reg [7:0] reset_vec = 8'hff;
wire reset = reset_vec[0];

always @(posedge clk) begin
    reset_vec <= reset_vec >> 1;
end

// CPU interface
wire trap;

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

minaret cpu (
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

// UART peripheral

wire uart_sel   = dmem_addr[31:4] == 28'hffffff0;
wire uart_addr  = dmem_addr[2];
wire uart_valid = uart_sel && dmem_valid;
wire uart_wmask = dmem_wmask != 0;

wire uart_ready;
wire [31:0] uart_rdata;

uart uart (
    .clk   (clk        ),
    .reset (reset      ),
    .valid (uart_valid ),
    .ready (uart_ready ),
    .addr  (uart_addr  ),
    .wmask (uart_wmask ),
    .wdata (dmem_wdata ),
    .rdata (uart_rdata )
);

// RAM peripheral

wire ram_sel = dmem_addr <= 32'hffff;
wire ram_wen = ram_sel && dmem_valid && dmem_wmask != 0;
wire [13:0] ram_addr0 = imem_addr[15:2];
wire [13:0] ram_addr1 = dmem_addr[15:2];
wire [ 3:0] ram_wmask = dmem_wmask << dmem_addr[1:0];

wire ram_ready = 1;
wire [31:0] ram_rdata0;
wire [31:0] ram_rdata1;

bram ram (
    .address_a (ram_addr0  ),
    .address_b (ram_addr1  ),
    .byteena_b (ram_wmask  ),
    .clock     (clk        ),
    .data_a    (0          ),
    .data_b    (dmem_wdata ),
    .wren_a    (0          ),
    .wren_b    (ram_wen    ),
    .q_a       (ram_rdata0 ),
    .q_b       (ram_rdata1 )
);

// Memory map

assign imem_ready = 1;
assign imem_rdata = ram_rdata0;
assign dmem_ready = uart_sel ? uart_ready : ram_ready;
assign dmem_rdata = uart_sel ? uart_rdata : ram_rdata1;

endmodule
