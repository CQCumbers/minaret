// enables
`define YES 1'b1
`define NO  1'b0

// opcodes
`define OP_ADDI   8'b00000000
`define OP_MULTI  8'b00000001
`define OP_SLTI   8'b00000100
`define OP_SLTIU  8'b00000101
`define OP_NOP    8'b00000110
`define OP_PCADDI 8'b00000111
`define OP_ADD    8'b00001000
`define OP_MULT   8'b00001001
`define OP_SLT    8'b00001100
`define OP_SLTU   8'b00001101
`define OP_SUB    8'b00001110
// no DIV/REM/PCADD

`define OP_ANDI   8'b00010000
`define OP_ORI    8'b00010001
`define OP_XORI   8'b00010010
`define OP_NANDI  8'b00010011
`define OP_AND    8'b00011000
`define OP_OR     8'b00011001
`define OP_XOR    8'b00011010
`define OP_NAND   8'b00011011
// no POPCNT/CLO/PLO

`define OP_CMPIEQ 8'b00100000
`define OP_CMPILO 8'b00100001
`define OP_CMPILS 8'b00100010
`define OP_CMPILT 8'b00100011
`define OP_CMPILE 8'b00100100
`define OP_CMPEQ  8'b00101000
`define OP_CMPLO  8'b00101001
`define OP_CMPLS  8'b00101010
`define OP_CMPLT  8'b00101011
`define OP_CMPLE  8'b00101100

`define OP_RBRA   8'b00110000
`define OP_RCALL  8'b00110001
`define OP_RET    8'b00110010
`define OP_ROBRA  8'b00111000
`define OP_ROCALL 8'b00111001

`define OP_LD     8'b01000000
`define OP_LDH    8'b01000001
`define OP_LDB    8'b01000010
`define OP_ST     8'b01000011
`define OP_STH    8'b01000100
`define OP_STB    8'b01000101
`define OP_RLD    8'b01001000
`define OP_RLDH   8'b01001001
`define OP_RLDB   8'b01001010
`define OP_RST    8'b01001011
`define OP_RSTH   8'b01001100
`define OP_RSTB   8'b01001101
// no STC

`define OP_MOVI   8'b01010000
`define OP_MTI    8'b01010001
`define OP_MFI    8'b01010010
`define OP_MOVL   8'b01010011
`define OP_MOVU   8'b01010100
`define OP_MOV    8'b01011000
`define OP_MT     8'b01011001
`define OP_MF     8'b01011010
`define OP_MFRC   8'b01011100

`define OP_LSL    8'b01100000
`define OP_LSR    8'b01100001
`define OP_ASR    8'b01100010
`define OP_ROR    8'b01100011
`define OP_RLSL   8'b01101000
`define OP_RLSR   8'b01101001
`define OP_RASR   8'b01101010
`define OP_RROR   8'b01101011
`define OP_FLSL   8'b01101100
`define OP_FLSR   8'b01101101

`define OP_BRA    8'b10000000
`define OP_BT     8'b10000001
`define OP_BF     8'b10000010
`define OP_CALL   8'b10001000
`define OP_CT     8'b10001001
`define OP_CF     8'b10001010

// writeback types
`define W_MOVL 3'b000
`define W_MOVU 3'b001
`define W_DEST 3'b010
`define W_TBIT 3'b011
`define W_PC   3'b100
`define W_NONE 3'b101

// A_src
`define A_SRC1 2'b00
`define A_PC   2'b01
`define A_MCR  2'b10
`define A_NONE 2'b11

// B_src
`define B_SRC2 2'b00
`define B_IMMS 2'b01
`define B_IMMB 2'b10
`define B_NONE 2'b11

// alu_op
`define ALU_ADD  4'b0000
`define ALU_SUB  4'b0001
`define ALU_MULT 4'b0010
`define ALU_AND  4'b0011
`define ALU_OR   4'b0100
`define ALU_XOR  4'b0101
`define ALU_NAND 4'b0110
`define ALU_EQ   4'b0111
`define ALU_LO   4'b1000
`define ALU_LS   4'b1001
`define ALU_LT   4'b1010
`define ALU_LE   4'b1011
`define ALU_LSL  4'b1100
`define ALU_LSR  4'b1101
`define ALU_ASR  4'b1110
`define ALU_ROR  4'b1111

// conditions
`define ANY  2'b00
`define SET  2'b11
`define CLR  2'b10

// mem widths
`define BYTE 2'b00
`define HALF 2'b01
`define WORD 2'b10

// cpu states
`define S_FETCH   4'b0000
`define S_DECODE  4'b0001
`define S_EXECUTE 4'b0010
`define S_SHIFT   4'b0011
`define S_CALL    4'b0100
`define S_RET     4'b0101
`define S_STORE   4'b0110
`define S_LOAD    4'b0111
`define S_WRITE   4'b1000

`define CTRL( a, b, op, tp, c, wb, ty, wd )                   \
{ A_src, B_src, alu_op, legal, cond, wb_ty, state_ty, width } \
= { a, b, op, tp, c, wb, ty, wd };                            \

`default_nettype none

module minaret (
    input clk, reset,
    output reg trap,

    output reg        imem_valid,
    input             imem_ready,
    output reg [31:0] imem_addr,
    input      [31:0] imem_rdata,
    
    output reg        dmem_valid,
    input             dmem_ready,
    output reg [31:0] dmem_addr,
    output reg [ 3:0] dmem_wmask,
    output reg [31:0] dmem_wdata,
    input      [31:0] dmem_rdata

    // add verification interface
`ifdef MINA_FORMAL
    output reg          mfi_valid,
    output reg [31 : 0] mfi_order,
    output reg [31 : 0] mfi_inst,
    output reg          mfi_trap,
    output reg          mfi_halt,
    output reg          mfi_intr,
    output reg [ 1 : 0] mfi_mode,
    output reg [ 1 : 0] mfi_ixl,
    output reg [ 3 : 0] mfi_src1_addr,
    output reg [ 3 : 0] mfi_src2_addr,
    output reg [ 3 : 0] mfi_src3_addr,
    output reg [31 : 0] mfi_src1_rdata,
    output reg [31 : 0] mfi_src2_rdata,
    output reg [31 : 0] mfi_src3_rdata,
    output reg [ 3 : 0] mfi_dest_addr,
    output reg [31 : 0] mfi_dest_wdata,
    output reg [31 : 0] mfi_pc_rdata,
    output reg [31 : 0] mfi_pc_wdata,
    output reg [31 : 0] mfi_mcr_rdata,
    output reg [31 : 0] mfi_mcr_wdata,
    output reg [31 : 0] mfi_mem_addr,
    output reg [ 3 : 0] mfi_mem_rmask,
    output reg [ 3 : 0] mfi_mem_wmask,
    output reg [31 : 0] mfi_mem_rdata,
    output reg [31 : 0] mfi_mem_wdata
`endif
);
    
// instruction reads
reg  [31:0] inst;
wire [ 7:0] opcode    = inst[31:24];
wire [ 3:0] src1_addr = inst[23:20];
wire [ 3:0] src2_addr = inst[19:16];
wire [ 3:0] dest_addr = inst[15:12];

// control unit
reg [1:0] A_src;
reg [1:0] B_src;
reg [3:0] alu_op;
reg [1:0] cond;
reg [2:0] wb_ty;
reg [3:0] state_ty;
reg [1:0] width;
reg legal;

always @* begin
    imem_addr = {pc[31:2], 2'b00};
    case (opcode) //      A_src    B_src    alu_op     legal cond  wb_ty    state_ty  width
        `OP_ADDI:   `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_MULTI:  `CTRL(`A_SRC1, `B_IMMS, `ALU_MULT, `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_SLTI:   `CTRL(`A_SRC1, `B_IMMS, `ALU_LT,   `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_SLTIU:  `CTRL(`A_SRC1, `B_IMMS, `ALU_LO,   `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_NOP:    `CTRL(`A_NONE, `B_NONE, `ALU_ADD,  `YES, `ANY, `W_NONE, `S_WRITE, `BYTE)
        `OP_PCADDI: `CTRL(`A_PC,   `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_ADD:    `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_MULT:   `CTRL(`A_SRC1, `B_SRC2, `ALU_MULT, `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_SLT:    `CTRL(`A_SRC1, `B_SRC2, `ALU_LT,   `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_SLTU:   `CTRL(`A_SRC1, `B_SRC2, `ALU_LO,   `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_SUB:    `CTRL(`A_SRC1, `B_SRC2, `ALU_SUB,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)

        `OP_ANDI:   `CTRL(`A_SRC1, `B_IMMS, `ALU_AND,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_ORI:    `CTRL(`A_SRC1, `B_IMMS, `ALU_OR,   `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_XORI:   `CTRL(`A_SRC1, `B_IMMS, `ALU_XOR,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_NANDI:  `CTRL(`A_SRC1, `B_IMMS, `ALU_NAND, `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_AND:    `CTRL(`A_SRC1, `B_SRC2, `ALU_AND,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_OR:     `CTRL(`A_SRC1, `B_SRC2, `ALU_OR,   `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_XOR:    `CTRL(`A_SRC1, `B_SRC2, `ALU_XOR,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_NAND:   `CTRL(`A_SRC1, `B_SRC2, `ALU_NAND, `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)

        `OP_CMPIEQ: `CTRL(`A_SRC1, `B_IMMS, `ALU_EQ,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)
        `OP_CMPILO: `CTRL(`A_SRC1, `B_IMMS, `ALU_LO,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)
        `OP_CMPILS: `CTRL(`A_SRC1, `B_IMMS, `ALU_LS,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)
        `OP_CMPILT: `CTRL(`A_SRC1, `B_IMMS, `ALU_LT,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)
        `OP_CMPILE: `CTRL(`A_SRC1, `B_IMMS, `ALU_LE,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)
        `OP_CMPEQ:  `CTRL(`A_SRC1, `B_SRC2, `ALU_EQ,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)
        `OP_CMPLO:  `CTRL(`A_SRC1, `B_SRC2, `ALU_LO,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)
        `OP_CMPLS:  `CTRL(`A_SRC1, `B_SRC2, `ALU_LS,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)
        `OP_CMPLT:  `CTRL(`A_SRC1, `B_SRC2, `ALU_LT,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)
        `OP_CMPLE:  `CTRL(`A_SRC1, `B_SRC2, `ALU_LE,   `YES, `ANY, `W_TBIT, `S_WRITE, `BYTE)

        `OP_RBRA:   `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_PC,   `S_WRITE, `WORD)
        `OP_RCALL:  `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_PC,   `S_CALL,  `WORD)
        `OP_RET:    `CTRL(`A_NONE, `B_NONE, `ALU_ADD,  `YES, `ANY, `W_PC,   `S_RET,   `WORD)
        `OP_ROBRA:  `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_PC,   `S_WRITE, `WORD)
        `OP_ROCALL: `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_PC,   `S_CALL,  `WORD)

        `OP_LD:     `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_LOAD,  `WORD)
        `OP_LDH:    `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_LOAD,  `HALF)
        `OP_LDB:    `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_LOAD,  `BYTE)
        `OP_ST:     `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_NONE, `S_STORE, `WORD)
        `OP_STH:    `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_NONE, `S_STORE, `HALF)
        `OP_STB:    `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_NONE, `S_STORE, `BYTE)
        `OP_RLD:    `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_LOAD,  `WORD)
        `OP_RLDH:   `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_LOAD,  `HALF)
        `OP_RLDB:   `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_LOAD,  `BYTE)
        `OP_RST:    `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_NONE, `S_STORE, `WORD)
        `OP_RSTH:   `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_NONE, `S_STORE, `HALF)
        `OP_RSTB:   `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_NONE, `S_STORE, `BYTE)

        `OP_MOVI:   `CTRL(`A_NONE, `B_IMMS, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_MTI:    `CTRL(`A_NONE, `B_IMMS, `ALU_ADD,  `YES, `SET, `W_DEST, `S_WRITE, `BYTE)
        `OP_MFI:    `CTRL(`A_NONE, `B_IMMS, `ALU_ADD,  `YES, `CLR, `W_DEST, `S_WRITE, `BYTE)
        `OP_MOVL:   `CTRL(`A_NONE, `B_NONE, `ALU_ADD,  `YES, `ANY, `W_MOVL, `S_WRITE, `BYTE)
        `OP_MOVU:   `CTRL(`A_NONE, `B_NONE, `ALU_ADD,  `YES, `ANY, `W_MOVU, `S_WRITE, `BYTE)
        `OP_MOV:    `CTRL(`A_SRC1, `B_NONE, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_MT:     `CTRL(`A_SRC1, `B_NONE, `ALU_ADD,  `YES, `SET, `W_DEST, `S_WRITE, `BYTE)
        `OP_MF:     `CTRL(`A_SRC1, `B_NONE, `ALU_ADD,  `YES, `CLR, `W_DEST, `S_WRITE, `BYTE)
        `OP_MFRC:   `CTRL(`A_MCR,  `B_NONE, `ALU_ADD,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)

        `OP_LSL:    `CTRL(`A_SRC1, `B_IMMS, `ALU_LSL,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_LSR:    `CTRL(`A_SRC1, `B_IMMS, `ALU_LSR,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_ASR:    `CTRL(`A_SRC1, `B_IMMS, `ALU_ASR,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_ROR:    `CTRL(`A_SRC1, `B_IMMS, `ALU_ROR,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_RLSL:   `CTRL(`A_SRC1, `B_SRC2, `ALU_LSL,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_RLSR:   `CTRL(`A_SRC1, `B_SRC2, `ALU_LSR,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_RASR:   `CTRL(`A_SRC1, `B_SRC2, `ALU_ASR,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_RROR:   `CTRL(`A_SRC1, `B_SRC2, `ALU_ROR,  `YES, `ANY, `W_DEST, `S_WRITE, `BYTE)
        `OP_FLSL:   `CTRL(`A_SRC1, `B_SRC2, `ALU_LSL,  `YES, `ANY, `W_DEST, `S_SHIFT, `BYTE)
        `OP_FLSR:   `CTRL(`A_SRC1, `B_SRC2, `ALU_LSR,  `YES, `ANY, `W_DEST, `S_SHIFT, `BYTE)

        `OP_BRA:    `CTRL(`A_PC,   `B_IMMB, `ALU_ADD,  `YES, `ANY, `W_PC,   `S_WRITE, `WORD)
        `OP_BT:     `CTRL(`A_PC,   `B_IMMB, `ALU_ADD,  `YES, `SET, `W_PC,   `S_WRITE, `WORD)
        `OP_BF:     `CTRL(`A_PC,   `B_IMMB, `ALU_ADD,  `YES, `CLR, `W_PC,   `S_WRITE, `WORD)
        `OP_CALL:   `CTRL(`A_PC,   `B_IMMB, `ALU_ADD,  `YES, `ANY, `W_PC,   `S_CALL,  `WORD)
        `OP_CT:     `CTRL(`A_PC,   `B_IMMB, `ALU_ADD,  `YES, `SET, `W_PC,   `S_CALL,  `WORD)
        `OP_CF:     `CTRL(`A_PC,   `B_IMMB, `ALU_ADD,  `YES, `CLR, `W_PC,   `S_CALL,  `WORD)

        default:    `CTRL(`A_NONE, `B_NONE, `ALU_ADD,  `NO,  `ANY, `W_NONE, `S_WRITE, `BYTE)
    endcase
end

// regfile access
reg [31:0] pc, mcr;
reg [31:0] last_mcr;
reg [31:0] regs [0:15];
reg [31:0] next_pc;
reg [31:0] src1, src2, src3;

// ALU operations
reg  [31:0] alu_out;
wire [31:0] imm = {{20{inst[11]}}, inst[11:0]};
wire [31:0] off = {{ 8{inst[23]}}, inst[23:0]};
wire [15:0] mov = {inst[19:16], inst[11:0]};
wire [31:0] mask = -1 << width;

wire [31:0] A =
    A_src == `A_SRC1 ? src1 :
    A_src == `A_PC ? pc :
    A_src == `A_MCR ? mcr : 0;
wire [31:0] B =
    B_src == `B_SRC2 ? src2 :
    B_src == `B_IMMS ? imm << src2_addr << width :
    B_src == `B_IMMB ? off << 2 : 0;
wire [ 3:0] src3_addr =
    state_ty == `S_STORE ? dest_addr :
	 state_ty == `S_WRITE ? dest_addr :
    state_ty == `S_SHIFT ? inst[11:8] : 15;

// state machine
reg [3:0] state;
always @(posedge clk) begin
    if (reset) begin
        trap <= `NO;
        dmem_valid <= `NO;
        imem_valid <= `YES;
        pc <= 32'h80000000;
        mcr <= 32'h00000f00;
        state <= `S_FETCH;
    end else if (!trap)
    case (state)
        `S_FETCH: begin
            if (imem_valid & imem_ready) begin
                imem_valid <= `NO;
                inst <= imem_rdata;
                next_pc <= pc + 4;
                state <= `S_DECODE;
                last_mcr <= mcr;
            end
        end
        `S_DECODE: begin
            src1 <= regs[src1_addr];
            src2 <= regs[src2_addr];
            if (legal) state <= `S_EXECUTE;
            trap <= !legal;
        end
        `S_EXECUTE: begin
            src3 <= regs[src3_addr];
            case (alu_op)
                `ALU_ADD:  alu_out <= A + B;
                `ALU_SUB:  alu_out <= A - B;
                `ALU_MULT: alu_out <= A * B;
                `ALU_AND:  alu_out <= A & B;
                `ALU_OR:   alu_out <= A | B;
                `ALU_XOR:  alu_out <= A ^ B;
                `ALU_NAND: alu_out <= ~(A & B);
                `ALU_EQ:   alu_out <= A == B;
                `ALU_LO:   alu_out <= A < B;
                `ALU_LS:   alu_out <= A <= B;
                `ALU_LT:   alu_out <= $signed(A) < $signed(B);
                `ALU_LE:   alu_out <= $signed(A) <= $signed(B);
                `ALU_LSL:  alu_out <= A << B[4:0];
                `ALU_LSR:  alu_out <= A >> B[4:0];
                `ALU_ASR:  alu_out <= $signed(A) >>> B[4:0];
                `ALU_ROR:  alu_out <= {A, A} >> B[4:0];
            endcase
            if (cond[1] && cond[0] != mcr[18]) begin
                imem_valid <= `YES;
                pc <= next_pc;
                state <= `S_FETCH;
            end else state <= state_ty;
        end
        `S_SHIFT: begin
            case (alu_op)
                `ALU_LSL: alu_out <= ({src1, src2} << src3[4:0]) >> 32;
                `ALU_LSR: alu_out <= ({src1, src2} >> src3[4:0]) >>  0;
            endcase
            state <= `S_WRITE;
        end
        `S_CALL: begin
            regs[15] <= src3 - 4;
            dmem_valid <= `YES;
            dmem_addr <= src3 - 4;
            dmem_wmask <= 4'b1111;
            dmem_wdata <= next_pc;
            trap <= src3[1:0] != 0;
            if (dmem_valid & dmem_ready) begin
                dmem_valid <= `NO;
                state <= `S_WRITE;
            end
        end
        `S_RET: begin
            regs[15] <= src3 + 4;
            dmem_valid <= `YES;
            dmem_addr <= src3;
            dmem_wmask <= 4'b0000;
            trap <= src3[1:0] != 0;
            if (dmem_valid & dmem_ready) begin
                dmem_valid <= `NO;
                alu_out <= dmem_rdata;
                state <= `S_WRITE;
            end
        end
        `S_STORE: begin
            dmem_valid <= `YES;
            dmem_addr <= alu_out & mask;
            dmem_wmask <= 12'b111100110001 >> (width * 4);
            dmem_wdata <= src3;
            trap <= (alu_out & ~mask) != 0;
            if (dmem_valid & dmem_ready) begin
                dmem_valid <= `NO;
                imem_valid <= `YES;
                pc <= next_pc;
                state <= `S_FETCH;
            end
        end
        `S_LOAD: begin
            dmem_valid <= `YES;
            dmem_addr <= alu_out & mask;
            dmem_wmask <= 4'b0000;
            trap <= (alu_out & ~mask) != 0;
            if (dmem_valid & dmem_ready) begin
                dmem_valid <= `NO;
                case (width)
                    `BYTE: alu_out <= dmem_rdata[ 7:0];
                    `HALF: alu_out <= dmem_rdata[15:0];
                    `WORD: alu_out <= dmem_rdata[31:0];
                endcase
                state <= `S_WRITE;
            end
        end
        `S_WRITE: begin
            imem_valid <= `YES;
            pc <= next_pc;
            state <= `S_FETCH;
            case (wb_ty)
                `W_MOVL: regs[dest_addr] <= {src3[31:16], mov};
                `W_MOVU: regs[dest_addr] <= mov << 16;
                `W_DEST: regs[dest_addr] <= alu_out;
                `W_TBIT: mcr[18] <= alu_out[0];
                `W_PC: {pc, trap} <= {alu_out, alu_out[1:0] != 0};
            endcase
        end
    endcase
end

// formal interface
`ifdef MINA_FORMAL
always @(posedge clk) begin
    mfi_valid <= trap || (!reset && state == `S_FETCH && !imem_valid);
    mfi_order <= reset ? 0 : mfi_order + mfi_valid;
    mfi_inst <= inst;
    mfi_trap <= trap;
    mfi_halt <= 0;
    mfi_intr <= 0;
    mfi_mode <= 0;
    mfi_ixl <= 0;
    mfi_src1_addr  <= (A_src == `A_SRC1 ? src1_addr : 0);
    mfi_src2_addr  <= (B_src == `B_SRC2 ? src2_addr : 0);
    mfi_src3_addr  <= (state_ty <= `S_STORE ? src3_addr : 0);
    mfi_src1_rdata <= (A_src == `A_SRC1 ? src1 : 0);
    mfi_src2_rdata <= (B_src == `B_SRC2 ? src2 : 0);
    mfi_src3_rdata <= (state_ty <= `S_STORE ? src3 : 0);
    mfi_dest_addr  <= (wb_ty <= `W_DEST ? dest_addr : state_ty <= `S_RET ? 15 : 0);
    mfi_dest_wdata <= (wb_ty == `W_DEST ? alu_out : wb_ty == `W_MOVU ? mov << 16 :
        wb_ty == `W_MOVL ? mov : state_ty <= `S_RET ? regs[15] : 0);
    mfi_pc_rdata   <= next_pc - 4;
    mfi_pc_wdata   <= pc;
    mfi_mcr_rdata  <= last_mcr;
    mfi_mcr_wdata  <= mcr;
    mfi_mem_addr   <= (state_ty != `S_WRITE ? dmem_addr : 0);
    mfi_mem_rmask  <= (state_ty == `S_LOAD  || state_ty == `S_RET  ? -1 : 0);
    mfi_mem_wmask  <= (state_ty == `S_STORE || state_ty == `S_CALL ? dmem_wmask : 0);
    mfi_mem_rdata  <= (state_ty == `S_LOAD  || state_ty == `S_RET  ? alu_out : 0);
    mfi_mem_wdata  <= (state_ty == `S_STORE || state_ty == `S_CALL ? dmem_wdata : 0);

    if (cond[1] && cond[0] != mcr[18]) begin
        mfi_dest_addr <= 0;
        mfi_dest_wdata <= 0;
        mfi_mem_addr <= 0;
        mfi_mem_wmask <= 0;
        mfi_mem_wdata <= 0;
    end
end
`endif

endmodule
