`default_nettype none

module uart (
    input  wire        clk,
    input  wire        reset,
    input  wire        valid,
    output wire        ready,
    input  wire        addr,
    input  wire        wmask,
    input  wire [31:0] wdata,
    output wire [31:0] rdata
);

// Avalon bus adapter
wire jtag_read  = wmask == 1'b0;
wire jtag_write = wmask == 1'b1;
wire jtag_wait;

assign ready = !jtag_wait;

jtag_uart jtag_uart (
    .clk_clk        (clk         ),
    .reset_reset_n  (!reset      ),
    .av_chipselect  (valid       ),
    .av_waitrequest (jtag_wait   ),
    .av_address     (!addr       ),
    .av_read_n      (!jtag_read  ),
    .av_readdata    (rdata       ),
    .av_write_n     (!jtag_write ),
    .av_writedata   (wdata       )
);

endmodule
