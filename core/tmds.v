`default_nettype none

module tmds_encoder (
    input clk, reset, de,
    input  [1:0]  ctrl,
    input  [7:0]  dec,
    output        enc
);

// decide whether to use xor or xnor
wire xord = (dec[1] + dec[2] + dec[3] +
    dec[4] + dec[5] + dec[6] + dec[7]) < 4;

// encode using chosen operator
wire [8:0] qm;
assign qm[0] = dec[0];
assign qm[1] = (xord ? qm[0] ^ dec[1] : qm[0] ~^ dec[1]);
assign qm[2] = (xord ? qm[1] ^ dec[2] : qm[1] ~^ dec[2]);
assign qm[3] = (xord ? qm[2] ^ dec[3] : qm[2] ~^ dec[3]);
assign qm[4] = (xord ? qm[3] ^ dec[4] : qm[3] ~^ dec[4]);
assign qm[5] = (xord ? qm[4] ^ dec[5] : qm[4] ~^ dec[5]);
assign qm[6] = (xord ? qm[5] ^ dec[6] : qm[5] ~^ dec[6]);
assign qm[7] = (xord ? qm[6] ^ dec[7] : qm[6] ~^ dec[7]);

// compute DC bias
reg  signed [4:0] bias;
wire signed [4:0] diff = $signed(qm[0] + qm[1] + qm[2] +
    qm[3] + qm[4] + qm[5] + qm[6] + qm[7]) * 2 - 8;

// invert if it would reduce bias
wire notd = ((bias == 0 || diff == 0) && !xord) ||
    bias > 0 && diff > 0 || bias < 0 && diff < 0;

reg [31:0] pix_clk;
always @(posedge clk) begin
    pix_clk <= pix_clk + 1;
    if (reset) begin
        pix_clk <= 0;
        bias <= 5'sb00000;
    end else
    if (pix_clk >= 9) begin
        pix_clk <= 0;
        bias <= bias + (notd ? -diff + 1 : diff - 1);
        if (!de) bias <= 5'sb00000;
    end
end

// select data or control signal
wire [9:0] ctrl_enc =
    ctrl == 2'b00 ? 10'b1101010100 :
    ctrl == 2'b01 ? 10'b0010101011 :
    ctrl == 2'b10 ? 10'b0101010100 :
    ctrl == 2'b11 ? 10'b1010101011 : 0;
wire [9:0] data = {notd, xord, notd ? ~qm : qm};

// serialize output
reg [9:0] enc_buf;
assign enc = enc_buf[0];

always @(posedge clk) begin
    if (reset) begin
        enc_buf <= 0;
    end else if (!pix_clk) begin
        enc_buf <= !de ? ctrl_enc : data;
    end else begin
        enc_buf <= enc_buf >> 1;
    end
end

endmodule
