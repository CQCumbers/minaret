// enables
`define YES 1'b1
`define NO  1'b0

// opcodes
`define OP_ADDI   8'b00000000
`define OP_SLTI   8'b00000100
`define OP_SLTIU  8'b00000101
`define OP_ADD    8'b00001000
`define OP_SLT    8'b00001100
`define OP_SLTU   8'b00001101
`define OP_SUB    8'b00001110

`define OP_ANDI   8'b00010000
`define OP_ORI    8'b00010001
`define OP_XORI   8'b00010010
`define OP_NANDI  8'b00010011
`define OP_AND    8'b00011000
`define OP_OR     8'b00011001
`define OP_XOR    8'b00011010
`define OP_NAND   8'b00011011

`define OP_LD     8'b01000000
`define OP_ST     8'b01000011

`define OP_CMPIEQ 8'b00100000
`define OP_CMPILO 8'b00100001
`define OP_CMPILS 8'b00100010
`define OP_CMPILT 8'b00100011
`define OP_CMPILE 8'b00100100
`define OP_CMPEQ  8'b00100000
`define OP_CMPLO  8'b00100001
`define OP_CMPLS  8'b00100010
`define OP_CMPLT  8'b00100011
`define OP_CMPLE  8'b00100100

`define OP_BRA    8'b10000000
`define OP_BT     8'b10000001
`define OP_BF     8'b10000010

// writeback types
`define W_NONE 2'b00
`define W_DEST 2'b01
`define W_TBIT 2'b10
`define W_PC   2'b11

// A_src
`define A_SRC1 2'b00
`define A_PC   2'b01

// B_src
`define B_SRC2 2'b00
`define B_IMMS 2'b01
`define B_IMMB 2'b10

// alu_op
`define ALU_ADD  4'b0000
`define ALU_SUB  4'b0001
`define ALU_AND  4'b0010
`define ALU_OR   4'b0011
`define ALU_XOR  4'b0100
`define ALU_NAND 4'b0101
`define ALU_EQ   4'b0110
`define ALU_LO   4'b0111
`define ALU_LS   4'b1000
`define ALU_LT   4'b1001
`define ALU_LE   4'b1010

// conditions
`define ANY  2'b00
`define SET  2'b11
`define CLR  2'b10

// mem types
`define M_NONE  2'b00
`define M_LOAD  2'b01
`define M_STORE 2'b10

// mem widths
`define BYTE 2'b00
`define HALF 2'b01
`define WORD 2'b10

// cpu states
`define S_FETCH   3'b000
`define S_DECODE  3'b001
`define S_EXECUTE 3'b010
`define S_LOAD    3'b011
`define S_STORE   3'b100
`define S_WRITE   3'b101
`define S_TRAP    3'b110

`define CTRL( a, b, op, tp, c, wb, ty, wd )                 \
{ A_src, B_src, alu_op, trap, cond, wb_ty, mem_ty, width } \
= { a, b, op, tp, c, wb, ty, wd };                          \

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
    output reg [ 3:0] dmem_rmask,
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
    output reg [31 : 0] mfi_src1_rdata,
    output reg [31 : 0] mfi_src2_rdata,
    output reg [ 3 : 0] mfi_dest_addr,
    output reg [31 : 0] mfi_dest_wdata,
    output reg [31 : 0] mfi_pc_rdata,
    output reg [31 : 0] mfi_pc_wdata,
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
wire [11:0] immediate = inst[11: 0];

// control unit
reg [3:0] alu_op;
reg [1:0] A_src, B_src;
reg [1:0] cond, wb_ty;
reg [1:0] mem_ty, width;

always @* begin
    imem_addr = {pc[31:2], 2'b00};
    case (opcode) //      A_src    B_src    alu_op     trap  cond  wb_ty    mem_ty    mem_wd
        `OP_ADDI:   `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_SLTI:   `CTRL(`A_SRC1, `B_IMMS, `ALU_LT,   `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_SLTIU:  `CTRL(`A_SRC1, `B_IMMS, `ALU_LO,   `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_ADD:    `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_SLT:    `CTRL(`A_SRC1, `B_SRC2, `ALU_LT,   `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_SLTU:   `CTRL(`A_SRC1, `B_SRC2, `ALU_LO,   `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_SUB:    `CTRL(`A_SRC1, `B_SRC2, `ALU_SUB,  `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)

        `OP_ANDI:   `CTRL(`A_SRC1, `B_IMMS, `ALU_AND,  `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_ORI:    `CTRL(`A_SRC1, `B_IMMS, `ALU_OR,   `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_XORI:   `CTRL(`A_SRC1, `B_IMMS, `ALU_XOR,  `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_NANDI:  `CTRL(`A_SRC1, `B_IMMS, `ALU_NAND, `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_AND:    `CTRL(`A_SRC1, `B_SRC2, `ALU_AND,  `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_OR:     `CTRL(`A_SRC1, `B_SRC2, `ALU_OR,   `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_XOR:    `CTRL(`A_SRC1, `B_SRC2, `ALU_XOR,  `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)
        `OP_NAND:   `CTRL(`A_SRC1, `B_SRC2, `ALU_NAND, `NO,  `ANY, `W_DEST, `M_NONE,  `BYTE)

        `OP_LD:     `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `NO,  `ANY, `W_DEST, `M_LOAD,  `WORD)
        `OP_ST:     `CTRL(`A_SRC1, `B_IMMS, `ALU_ADD,  `NO,  `ANY, `W_NONE, `M_STORE, `WORD)

        `OP_CMPIEQ: `CTRL(`A_SRC1, `B_IMMS, `ALU_EQ,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)
        `OP_CMPILO: `CTRL(`A_SRC1, `B_IMMS, `ALU_LO,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)
        `OP_CMPILS: `CTRL(`A_SRC1, `B_IMMS, `ALU_LS,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)
        `OP_CMPILT: `CTRL(`A_SRC1, `B_IMMS, `ALU_LT,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)
        `OP_CMPILE: `CTRL(`A_SRC1, `B_IMMS, `ALU_LE,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)
        `OP_CMPEQ:  `CTRL(`A_SRC1, `B_SRC2, `ALU_EQ,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)
        `OP_CMPLO:  `CTRL(`A_SRC1, `B_SRC2, `ALU_LO,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)
        `OP_CMPLS:  `CTRL(`A_SRC1, `B_SRC2, `ALU_LS,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)
        `OP_CMPLT:  `CTRL(`A_SRC1, `B_SRC2, `ALU_LT,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)
        `OP_CMPLE:  `CTRL(`A_SRC1, `B_SRC2, `ALU_LE,   `NO,  `ANY, `W_TBIT, `M_NONE,  `BYTE)

        `OP_BRA:    `CTRL(`A_PC,   `B_IMMB, `ALU_ADD,  `NO,  `ANY, `W_PC,   `M_NONE,  `WORD)
        `OP_BT:     `CTRL(`A_PC,   `B_IMMB, `ALU_ADD,  `NO,  `SET, `W_PC,   `M_NONE,  `WORD)
        `OP_BF:     `CTRL(`A_PC,   `B_IMMB, `ALU_ADD,  `NO,  `CLR, `W_PC,   `M_NONE,  `WORD)
        default:    `CTRL(`A_SRC1, `B_SRC2, `ALU_ADD,  `YES, `ANY, `W_NONE, `M_NONE,  `BYTE)
    endcase
end

// regfile access
reg [31:0] pc, mcr;
reg [31:0] regs [0:15];
reg [31:0] next_pc;
reg [31:0] src1, src2, src3;

// ALU operations
reg [31:0] alu_out;
wire [31:0] A =
  A_src == `A_SRC1 ? src1 :
  A_src == `A_PC ? pc : 0;
wire [31:0] B =
  B_src == `B_SRC2 ? src2 :
  B_src == `B_IMMS ? $signed(immediate << src2_addr << width) :
  B_src == `B_IMMB ? $signed({inst[23:0], 2'b00}) : 0;

// state machine
reg [2:0] state;
always @(posedge clk) begin
    imem_valid <= `NO;
    dmem_valid <= `NO;
    dmem_wmask <= 4'b0000;
    dmem_rmask <= 4'b0000;
    if (reset) begin
        trap <= `NO;
        pc <= 32'h00000000;
        regs[0] <= 0;
        state <= `S_FETCH;
    end else
    case (state)
        `S_FETCH: begin
            imem_valid <= `YES;
            if (imem_valid & imem_ready) begin
                inst <= imem_rdata;
                next_pc <= pc + 4;
                state <= `S_DECODE;
            end
        end
        `S_DECODE: begin
            src1 <= regs[src1_addr];
            src2 <= regs[src2_addr];
            if (trap) state <= `S_TRAP;
            else state <= `S_EXECUTE;
        end
        `S_EXECUTE: begin
            src3 <= regs[dest_addr];
            case (alu_op)
                `ALU_ADD:  alu_out <= A + B;
                `ALU_SUB:  alu_out <= A - B;
                `ALU_AND:  alu_out <= A & B;
                `ALU_OR:   alu_out <= A | B;
                `ALU_XOR:  alu_out <= A ^ B;
                `ALU_NAND: alu_out <= ~(A & B);
                `ALU_EQ:   alu_out <= A == B;
                `ALU_LO:   alu_out <= A < B;
                `ALU_LS:   alu_out <= A <= B;
                `ALU_LT:   alu_out <= $signed(A) < $signed(B);
                `ALU_LE:   alu_out <= $signed(A) <= $signed(B);
            endcase
            if (cond[1] && cond[0] != mcr[18]) begin
                pc <= next_pc;
                state <= `S_FETCH;
            end else case (mem_ty)
                `M_NONE:  state <= `S_WRITE;
                `M_LOAD:  state <= `S_LOAD;
                `M_STORE: state <= `S_STORE;
            endcase
        end
        `S_LOAD: begin
            dmem_valid <= `YES;
            dmem_addr <= {alu_out[31:2], 2'b00};
            dmem_rmask <= 4'b1111;
            if (dmem_valid & dmem_ready) begin
                alu_out <= dmem_rdata;
                state <= `S_WRITE;
            end
        end
        `S_STORE: begin
            dmem_valid <= `YES;
            dmem_addr <= {alu_out[31:2], 2'b00};
            dmem_wmask <= 4'b1111;
            dmem_wdata <= src3;
            if (dmem_valid & dmem_ready) begin
                pc <= next_pc;
                state <= `S_FETCH;
            end
        end
        `S_WRITE: begin
            pc <= next_pc;
            state <= `S_FETCH;
            case (wb_ty)
                `W_DEST: regs[dest_addr] <= alu_out;
                `W_TBIT: mcr[18] <= alu_out[0];
                `W_PC: pc <= alu_out;
            endcase
        end
        `S_TRAP: begin
            state <= `S_TRAP;
        end
    endcase
end

// formal interface
`ifdef MINA_FORMAL
always @(posedge clk) begin
    mfi_valid <= state == `S_WRITE;
    mfi_order <= reset ? 0 : mfi_order + mfi_valid;
    mfi_inst <= inst;
    mfi_trap <= trap;
    mfi_halt <= 0;
    mfi_intr <= 0;
    mfi_mode <= 0;
    mfi_ixl <= 0;
    mfi_src1_addr <= src1_addr;
    mfi_src2_addr <= src2_addr;
    mfi_src1_rdata <= src1;
    mfi_src2_rdata <= src2;
    mfi_dest_addr <= dest_addr;
    mfi_dest_wdata <= alu_out;
    mfi_pc_rdata <= pc;
    mfi_pc_wdata <= next_pc;
    mfi_mem_addr <= dmem_addr;
    mfi_mem_rmask <= dmem_rmask;
    mfi_mem_wmask <= dmem_wmask;
    mfi_mem_rdata <= alu_out;
    mfi_mem_wdata <= src3;
end
`endif

endmodule
