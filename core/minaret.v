// enables
`define Y 1'b1
`define N 1'b0

// opcodes
`define OP_ADD    8'b00001000
`define OP_SUB    8'b00001110
`define OP_AND    8'b00011000
`define OP_OR     8'b00011001
`define OP_LD     8'b00001000
`define OP_ST     8'b00001000
`define OP_CMPIEQ 8'b00101000
`define OP_BT     8'b00001000

// pc_src
`define PC_4   1'b0
`define PC_ALU 1'b1

// A_src
`define A_SRC1 1'b0
`define A_PC   1'b1

// B_src
`define B_SRC2 2'b00
`define B_IMMS 2'b01
`define B_IMMB 2'b10

// alu_op
`define ALU_ADD 3'b000
`define ALU_SUB 3'b001
`define ALU_AND 3'b010
`define ALU_OR  3'b011
`define ALU_EQ  3'b100

// wb_src
`define WB_ALU 1'b0
`define WB_MEM 1'b1

// mem widths
`define NONE 1'b0
`define WORD 1'b1

`define CTRL( a, b, c, d, e, f, g, h, i )                      \
{ pc_src, A_src, B_src, alu_op, wb_src, wb, ld_ty, st_ty, br } \
= { a, b, c, d, e, f, g, h, i };                               \

`default_nettype none

module minaret (
    input clk, reset,

    output reg        imem_valid,
    input             imem_ready,
    output reg [31:0] imem_addr,
    input      [31:0] imem_rdata,
    
    output reg        dmem_valid,
    input             dmem_ready,
    output reg [31:0] dmem_addr,
    output reg [31:0] dmem_wdata,
    output reg [ 3:0] dmem_rmask,
    input      [31:0] dmem_rdata,

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
    output reg [31 : 0] mfi_mem_wdata,
`endif
);
    
// instruction reads
reg  [31:0] pc, inst;
reg fetch = 1'b1;
reg imem_state, imem_done;

wire [ 7:0] opcode    = inst[31:24];
wire [ 3:0] src1_addr = inst[23:20];
wire [ 3:0] src2_addr = inst[19:16];
wire [ 3:0] dest_addr = inst[15:12];
wire [15:0] immediate = inst[11: 0];

always @(posedge clk) begin
    imem_done <= 1'b0;
    if (reset) begin
        imem_valid <= 1'b0;
        imem_state <= 2'b00;
    end else case (imem_state)
        0: if (fetch) begin
            imem_valid <= 1'b1;
            imem_addr <= {pc[31:2], 2'b00};
            imem_state <= 1'b1;
        end
        1: if (imem_ready) begin
            inst <= imem_rdata;
            imem_valid <= 1'b0;
            imem_state <= 1'b0;
            imem_done <= 1'b1;
        end
    endcase
end

// control unit
wire pc_src, A_src;
wire [1:0] B_src;
wire [2:0] alu_op;
wire wb_src, wb, ld_ty, st_ty, br;

always @* begin
    case (opcode) //    pc_src A_src    B_src    alu_op    wb_src  wb  ld_ty  st_ty br
        `OP_ADD: `CTRL(`PC_4, `A_SRC1, `B_SRC2, `ALU_ADD, `WB_ALU, `Y, `NONE, `NONE, `N)
        `OP_SUB: `CTRL(`PC_4, `A_SRC1, `B_SRC2, `ALU_SUB, `WB_ALU, `Y, `NONE, `NONE, `N)
        `OP_AND: `CTRL(`PC_4, `A_SRC1, `B_SRC2, `ALU_AND, `WB_ALU, `Y, `NONE, `NONE, `N)
        `OP_OR:  `CTRL(`PC_4, `A_SRC1, `B_SRC2, `ALU_OR,  `WB_ALU, `Y, `NONE, `NONE, `N)
        `OP_LD:  `CTRL(`PC_4, `A_SRC1, `B_IMMS, `ALU_ADD, `WB_MEM, `Y, `WORD, `NONE, `N)
        `OP_ST:  `CTRL(`PC_4, `A_SRC1, `B_IMMS, `ALU_ADD, `WB_MEM, `Y, `NONE, `WORD, `N)
        default: `CTRL(`PC_4, `A_SRC1, `B_SRC2, `ALU_ADD, `WB_ALU, `N, `NONE, `NONE, `N)
//      OP_CMPIEQ: CTRL(PC_4,   A_SRC1, B_IMMS, ALU_EQ,  WB_ALU, 1, LD_NONE, ST_NONE, 0 );
//      OP_BT:     CTRL(PC_ALU, A_PC,   B_IMMB, ALU_ADD, WB_ALU, 0, LD_NONE, ST_NONE, 1 );
    endcase
end

// regfile access
reg [31:0] regs [0:15];
wire [31:0] src1 = regs[src1_addr];
wire [31:0] src2 = regs[src2_addr];

always @(posedge clk) begin
    if (wb) case (wb_src)
        `WB_ALU: regs[dest_addr] <= alu_out;
        `WB_MEM: regs[dest_addr] <= mem_out;
    endcase

    if (reset) begin
        pc <= 0;
    end else case (pc_src)
        `PC_4: pc <= pc + 4;
        `PC_ALU: pc <= alu_out;
    endcase
end

// ALU operations
wire [31:0] imm = $signed(immediate) << src2_addr;
wire [31:0] A = (A_src == `A_SRC1) ? src1 : 0;
wire [31:0] B = (B_src == `B_SRC2) ? src2 : imm;

reg [31:0] alu_sum, alu_out;
always @* begin
    alu_sum = A + (alu_op[0] ? -B : B);
    case (alu_op)
        `ALU_ADD: alu_out = alu_sum;
        `ALU_SUB: alu_out = alu_sum;
        `ALU_AND: alu_out = A & B;
        `ALU_OR:  alu_out = A | B;
        `ALU_EQ:  alu_out = A == B;
    endcase
end

// memory interface
reg [1:0] dmem_state;
reg [31:0] mem_out;
reg dmem_done;

always @(posedge clk) begin
    dmem_done <= 1'b0;
    if (reset) begin
        dmem_valid <= 1'b0;
        dmem_state <= 2'b00;
    end else case (dmem_state)
        0: begin
            if (ld_ty == `LD_WORD) begin
                dmem_valid <= 1'b1;
                dmem_addr <= {alu_out[31:2], 2'b00};
                dmem_rmask <= 4'b1111;
                dmem_state <= 2'b01;
            end
            if (st_ty == `ST_WORD) begin
                dmem_valid <= 1'b1;
                dmem_addr <= {alu_out[31:2], 2'b00};
                dmem_wdata <= reg_op2;
                dmem_wmask <= 4'b1111;
                dmem_state <= 2'b10;
            end
        end
        1: if (dmem_ready) begin
            mem_out <= dmem_rdata;
            dmem_valid <= 1'b0;
            dmem_state <= 2'b00;
            dmem_done <= 1'b1;
        end
        2: if (dmem_ready) begin
            dmem_valid <= 1'b0;
            dmem_state <= 2'b00;
            dmem_done <= 1'b1;
        end
    endcase
end

// memory reads
//case (ld_ty)
//    LD_NONE: mem_out <= 0;
//    LD_WORD: mem_out <= dmem[alu_out];
//end

// formal interface
`ifdef MINA_FORMAL
always @(posedge clk) begin
    mfi_valid <= reset ? 0 : inst_valid;
    mfi_order <= reset ? 0 : mfi_order + mfi_valid;
    mfi_inst <= inst;
    mfi_trap <= !wb; // hack
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
    mfi_pc_wdata <= pc4;
    mfi_mem_addr <= 0;
    mfi_mem_rmask <= 0;
    mfi_mem_wmask <= 0;
    mfi_mem_rdata <= 0;
    mfi_mem_wdata <= 0;
end
`endif

endmodule
