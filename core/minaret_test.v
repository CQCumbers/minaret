`default_nettype none

module minaret_test (
    input wire clk,

    output wire [14:0] dfi_addr,
    output wire [ 2:0] dfi_bank,
    inout  wire [15:0] dfi_data,
    output wire        dfi_casn,
    output wire        dfi_cke,
    output wire        dfi_clk,
    output wire        dfi_csn,
    output wire [ 1:0] dfi_mask,
    output wire [ 1:0] dfi_stb,
    output wire        dfi_odt,
    output wire        dfi_rasn,
    output wire        dfi_rstn,
    output wire        dfi_wen,

    inout  wire        hdmi_i2c_scl,
    inout  wire        hdmi_i2c_sda,
    output wire        hdmi_tx_pclk,
    output wire [23:0] hdmi_tx_data,
    output wire        hdmi_tx_de,
    output wire        hdmi_tx_hs,
    output wire        hdmi_tx_vs
);

// Reset generator

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

// Display controller

wire vmem_valid;
wire vmem_ready;
wire [16:0] vmem_addr;
wire [31:0] vmem_rdata;

display display (
    .clk          (clk          ),
    .hdmi_i2c_scl (hdmi_i2c_scl ),
    .hdmi_i2c_sda (hdmi_i2c_sda ),
    .hdmi_tx_pclk (hdmi_tx_pclk ),
    .hdmi_tx_data (hdmi_tx_data ),
    .hdmi_tx_de   (hdmi_tx_de   ),
    .hdmi_tx_hs   (hdmi_tx_hs   ),
    .hdmi_tx_vs   (hdmi_tx_vs   ),
    .vmem_valid   (vmem_valid   ),
    .vmem_ready   (vmem_ready   ),
    .vmem_addr    (vmem_addr    ),
    .vmem_rdata   (vmem_rdata   )
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

// Timer peripheral

wire time_sel = dmem_addr[31:4] == 28'hffffff1;
wire time_ready = 1'b1;

reg [24:0] time_cnt = 0;
reg [31:0] time_rdata = 0;

always @(posedge clk) begin
    time_cnt <= time_cnt[23:0] + 336;
    time_rdata <= time_rdata + time_cnt[24];
end

// BRAM peripheral

wire bram_isel = imem_addr[31:17] == 15'h4000;
wire bram_dsel = dmem_addr[31:17] == 15'h4000;
wire bram_wen = bram_dsel && dmem_valid && dmem_wmask != 0;


wire bram_ivalid = bram_isel ? imem_valid : vmem_valid;
wire bram_dvalid = dmem_valid;
wire [14:0] bram_iaddr = bram_isel ? imem_addr[16:2] : vmem_addr[16:2];
wire [14:0] bram_daddr = dmem_addr[16:2];

wire [ 4:0] bram_ioffs = vmem_addr[1:0] << 3;
wire [ 4:0] bram_doffs = dmem_addr[1:0] << 3;
wire [ 3:0] bram_wmask = dmem_wmask << dmem_addr[1:0];
wire [31:0] bram_wdata = dmem_wdata << bram_doffs;

reg bram_iready = 0;
reg bram_dready = 0;
wire [31:0] bram_irdata;
wire [31:0] bram_drdata;

bram bram (
    .address_a (bram_iaddr  ),
    .address_b (bram_daddr  ),
    .byteena_b (bram_wmask  ),
    .clock     (clk         ),
    .data_a    (0           ),
    .data_b    (bram_wdata  ),
    .wren_a    (0           ),
    .wren_b    (bram_wen    ),
    .q_a       (bram_irdata ),
    .q_b       (bram_drdata )
);

always @(posedge clk) begin
    bram_iready <= bram_ivalid & !bram_iready;
    bram_dready <= bram_dvalid & !bram_dready;
end

// Cached DRAM peripheral

wire dram_isel = imem_addr[31:26] == 6'h00;
wire dram_dsel = dmem_addr[31:26] == 6'h00;
wire cache_mode = dram_dsel && dmem_valid;

wire cache_valid = cache_mode || (dram_isel && imem_valid);
wire [31:0] cache_addr  = cache_mode ? dmem_addr[25:0] : imem_addr[25:0];
wire [ 3:0] cache_wmask = cache_mode ? dmem_wmask : 0;
wire [31:0] cache_wdata = cache_mode ? dmem_wdata : 0;

wire cache_ready;
wire dram_iready = cache_mode ? 0 : cache_ready;
wire dram_dready = cache_mode ? cache_ready : 0;
wire [31:0] cache_rdata;
wire [31:0] dram_irdata = cache_mode ? 0 : cache_rdata;
wire [31:0] dram_drdata = cache_mode ? cache_rdata : 0;

// Cache controller

wire dram_valid;
wire dram_ready;
wire dram_wmask;
wire [ 31:0] dram_addr;
wire [127:0] dram_wdata;
wire [127:0] dram_rdata;

cache_control cache (
    .clk       (clk         ),
    .valid     (cache_valid ),
    .ready     (cache_ready ),
    .addr      (cache_addr  ),
    .wmask     (cache_wmask ),
    .wdata     (cache_wdata ),
    .rdata     (cache_rdata ),
    .mem_valid (dram_valid  ),
    .mem_ready (dram_ready  ),
    .mem_addr  (dram_addr   ),
    .mem_wmask (dram_wmask  ),
    .mem_wdata (dram_wdata  ),
    .mem_rdata (dram_rdata  )
);

// DRAM controller

wire dfi_wmask;
wire shift_clk;
wire [31:0] dfi_rdata;
wire [31:0] dfi_wdata;
wire [15:0] dfi_oe = {16{dfi_wmask}};

dram_control dram (
    .clk       (clk        ),
    .dfi_addr  (dfi_addr   ),
    .dfi_bank  (dfi_bank   ),
    .dfi_rdata (dfi_rdata  ),
    .dfi_wdata (dfi_wdata  ),
    .dfi_wmask (dfi_wmask  ),
    .dfi_casn  (dfi_casn   ),
    .dfi_cke   (dfi_cke    ),
    .dfi_csn   (dfi_csn    ),
    .dfi_rasn  (dfi_rasn   ),
    .dfi_rstn  (dfi_rstn   ),
    .dfi_wen   (dfi_wen    ),
    .valid     (dram_valid ),
    .ready     (dram_ready ),
    .addr      (dram_addr  ),
    .wmask     (dram_wmask ),
    .wdata     (dram_wdata ),
    .rdata     (dram_rdata )
);

pll dfi_pll (
    .inclk0 (clk       ),
    .c0     (dfi_clk  ),
    .c1     (shift_clk )
);

ddio dfi_ddio (
    .inclock  (shift_clk ),
    .outclock (clk       ),
    .dout     (dfi_rdata ),
    .din      (dfi_wdata ),
    .pad_io   (dfi_data  ),
    .oe       (dfi_oe    )
);

assign dfi_mask = 2'b00;
assign dfi_odt  = 1'b0;
assign dfi_stb[0] = dfi_wmask && shift_clk;
assign dfi_stb[1] = dfi_wmask && shift_clk;

// Memory map

assign imem_ready = bram_isel ? bram_iready :
                    dram_isel ? dram_iready : 0;
assign imem_rdata = bram_isel ? bram_irdata :
                    dram_isel ? dram_irdata : 0;

assign dmem_ready = uart_sel  ? uart_ready  :
                    time_sel  ? time_ready  :
                    bram_dsel ? bram_dready :
                    dram_dsel ? dram_dready : 0;
assign dmem_rdata = uart_sel  ? uart_rdata  :
                    time_sel  ? time_rdata  :
                    bram_dsel ? bram_drdata >> bram_doffs :
                    dram_dsel ? dram_drdata : 0;

assign vmem_ready = bram_isel ? 0 : bram_iready;
assign vmem_rdata = bram_isel ? 0 : bram_irdata >> bram_ioffs;

endmodule
