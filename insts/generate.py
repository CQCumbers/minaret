# Based on riscv-formal
# Helper functions

insts = set()
defaults_cache = None

def header(f, inst, isa_mode=False):
    if not isa_mode:
        insts.add(inst)

    global defaults_cache
    defaults_cache = dict()

    print("// DO NOT EDIT -- auto-generated from insts/generate.py", file=f)
    print("", file=f)
    if isa_mode:
        print("module mfi_isa_%s (" % inst, file=f)
    else:
        print("module mfi_inst_%s (" % inst, file=f)

    print("  input           mfi_valid,", file=f)
    print("  input  [31 : 0] mfi_inst,", file=f)
    print("  input  [31 : 0] mfi_pc_rdata,", file=f)
    print("  input  [31 : 0] mfi_mcr_rdata,", file=f)
    print("  input  [31 : 0] mfi_src1_rdata,", file=f)
    print("  input  [31 : 0] mfi_src2_rdata,", file=f)
    print("  input  [31 : 0] mfi_src3_rdata,", file=f)
    print("  input  [31 : 0] mfi_mem_rdata,", file=f)
    print("", file=f)

    print("  output          spec_trap,", file=f)
    print("  output [ 3 : 0] spec_src1_addr,", file=f)
    print("  output [ 3 : 0] spec_src2_addr,", file=f)
    print("  output [ 3 : 0] spec_src3_addr,", file=f)
    print("  output [ 3 : 0] spec_dest_addr,", file=f)
    print("  output [31 : 0] spec_dest_wdata,", file=f)
    print("  output [31 : 0] spec_pc_wdata,", file=f)
    print("  output [31 : 0] spec_mcr_wmask,", file=f)
    print("  output [31 : 0] spec_mcr_wdata,", file=f)
    print("  output [31 : 0] spec_mem_addr,", file=f)
    print("  output [ 3 : 0] spec_mem_rmask,", file=f)
    print("  output [ 3 : 0] spec_mem_wmask,", file=f)
    print("  output [31 : 0] spec_mem_wdata", file=f)
    print(");", file=f)

    defaults_cache["spec_valid"] = "0"
    defaults_cache["spec_src1_addr"] = "0"
    defaults_cache["spec_src2_addr"] = "0"
    defaults_cache["spec_src3_addr"] = "0"
    defaults_cache["spec_dest_addr"] = "0"
    defaults_cache["spec_dest_wdata"] = "0"
    defaults_cache["spec_pc_wdata"] = "0"
    defaults_cache["spec_mcr_wmask"] = "0"
    defaults_cache["spec_mcr_wdata"] = "0"
    defaults_cache["spec_trap"] = "0"
    defaults_cache["spec_mem_addr"] = "0"
    defaults_cache["spec_mem_rmask"] = "0"
    defaults_cache["spec_mem_wmask"] = "0"
    defaults_cache["spec_mem_wdata"] = "0"

def assign(f, sig, val):
    print("  assign %s = %s;" % (sig, val), file=f)

    if sig in defaults_cache:
        del defaults_cache[sig]

def footer(f):
    def default_assign(sig):
        if sig in defaults_cache:
            print("  assign %s = %s;" % (sig, defaults_cache[sig]), file=f)

    if len(defaults_cache) != 0:
        print("", file=f)
        print("  // default assignments", file=f)

        default_assign("spec_valid")
        default_assign("spec_src1_addr")
        default_assign("spec_src2_addr")
        default_assign("spec_src3_addr")
        default_assign("spec_dest_addr")
        default_assign("spec_dest_wdata")
        default_assign("spec_pc_wdata")
        default_assign("spec_mcr_wmask")
        default_assign("spec_mcr_wdata")
        default_assign("spec_trap")
        default_assign("spec_mem_addr")
        default_assign("spec_mem_rmask")
        default_assign("spec_mem_wmask")
        default_assign("spec_mem_wdata")

    print("endmodule", file=f)

# Instruction formats

def format_s(f):
    print("", file=f)
    print("  // standard instruction format", file=f)
    print("  wire [31:0] inst_padding = mfi_inst >> 32;", file=f)
    print("  wire [7:0] inst_opcode = mfi_inst[31:24];", file=f)
    print("  wire [3:0] inst_src1   = mfi_inst[23:20];", file=f)
    print("  wire [3:0] inst_src2   = mfi_inst[19:16];", file=f)
    print("  wire [3:0] inst_dest   = mfi_inst[15:12];", file=f)

def format_i(f):
    print("", file=f)
    print("  // immediate instruction format", file=f)
    print("  wire [31:0] inst_padding = mfi_inst >> 32;", file=f)
    print("  wire [7:0] inst_opcode = mfi_inst[31:24];", file=f)
    print("  wire [3:0] inst_src1   = mfi_inst[23:20];", file=f)
    print("  wire [3:0] inst_shift  = mfi_inst[19:16];", file=f)
    print("  wire [3:0] inst_dest   = mfi_inst[15:12];", file=f)
    print("  wire [11:0] inst_imm   = mfi_inst[11: 0];", file=f)
    print("  wire [31:0] inst_imms = $signed(inst_imm) << inst_shift;", file=f)

def format_m(f):
    print("", file=f)
    print("  // move instruction format", file=f)
    print("  wire [3:0] inst_dest   = mfi_inst[15:12];", file=f)
    print("  wire [31:0] inst_imms  = $signed({mfi_inst[19:16], mfi_inst[11:0]});", file=f)

def format_f(f):
    print("", file=f)
    print("  // funnel shift instruction format", file=f)
    print("  wire [31:0] inst_padding = mfi_inst >> 32;", file=f)
    print("  wire [7:0] inst_opcode = mfi_inst[31:24];", file=f)
    print("  wire [3:0] inst_src1   = mfi_inst[23:20];", file=f)
    print("  wire [3:0] inst_src2   = mfi_inst[19:16];", file=f)
    print("  wire [3:0] inst_dest   = mfi_inst[15:12];", file=f)
    print("  wire [3:0] inst_rshift = mfi_inst[11: 8];", file=f)

def format_b(f):
    print("", file=f)
    print("  // branch instruction format", file=f)
    print("  wire [31:0] inst_padding = mfi_inst >> 32;", file=f)
    print("  wire [7:0] inst_opcode  = mfi_inst[31:24];", file=f)
    print("  wire [23:0] inst_offset = mfi_inst[23: 0];", file=f)

# Instruction groups

def inst_alu(inst, opcode, expr, reg):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_s(f) if reg else format_i(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        print("  wire [31:0] result = %s;" % expr, file=f)
        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src1_addr", "inst_src1")
        if reg:
            assign(f, "spec_src2_addr", "inst_src2")
        assign(f, "spec_dest_addr", "inst_dest")
        assign(f, "spec_dest_wdata", "result")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")

        footer(f)

def inst_nop(inst, opcode):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_s(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")

        footer(f)

def inst_cmp(inst, opcode, expr, reg):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_s(f) if reg else format_i(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        print("  wire [31:0] result = %s;" % expr, file=f)
        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src1_addr", "inst_src1")
        if reg:
            assign(f, "spec_src2_addr", "inst_src2")
        assign(f, "spec_mcr_wmask", "1 << 18")
        assign(f, "spec_mcr_wdata", "result << 18")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")

        footer(f)

def inst_rbra(inst, opcode, reg):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_s(f) if reg else format_i(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        if reg:
            print("  wire [31:0] result = mfi_src1_rdata + mfi_src2_rdata;", file=f)
        else:
            print("  wire [31:0] result = mfi_src1_rdata + 4 * inst_imms;", file=f)

        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src1_addr", "inst_src1")
        if reg:
            assign(f, "spec_src2_addr", "inst_src2")
        assign(f, "spec_pc_wdata", "result")
        assign(f, "spec_trap", "result[1:0] != 0")

        footer(f)

def inst_rcall(inst, opcode, reg):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_s(f) if reg else format_i(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        if reg:
            print("  wire [31:0] result = mfi_src1_rdata + mfi_src2_rdata;", file=f)
        else:
            print("  wire [31:0] result = mfi_src1_rdata + 4 * inst_imms;", file=f)

        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src3_addr", "15")
        assign(f, "spec_dest_addr", "15")
        assign(f, "spec_dest_wdata", "mfi_src3_rdata - 4")
        assign(f, "spec_mem_addr", "mfi_src3_rdata & ~3")
        assign(f, "spec_mem_wmask", "4'b1111 << (mfi_src3_rdata-spec_mem_addr)" % width)
        assign(f, "spec_mem_wdata", "mfi_src1_rdata << (8*(mfi_src3_rdata-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "result")
        assign(f, "spec_trap", "mfi_src1_rdata[1:0] != 0 || result[1:0] != 0")

        footer(f)


def inst_ret(inst, opcode):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_i(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        print("  wire [31:0] result = mfi_mem_rdata >> (8*(addr-spec_mem_addr));", file=f)

        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src3_addr", "15")
        assign(f, "spec_dest_addr", "15")
        assign(f, "spec_dest_wdata", "mfi_src3_rdata + 4")
        assign(f, "spec_mem_addr", "mfi_src3_rdata & ~3")
        assign(f, "spec_mem_rmask", "4'b1111 << (mfi_src3_rdata-spec_mem_addr)" % width)
        assign(f, "spec_pc_wdata", "result")
        assign(f, "spec_trap", "mfi_src3_rdata[1:0] != 0 || result[1:0] != 0")

        footer(f)

def inst_ld(inst, opcode, width, reg):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_s(f) if reg else format_i(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        if reg:
            print("  wire [31:0] addr = mfi_src1_rdata + mfi_src2_rdata;", file=f)
        else:
            print("  wire [31:0] addr = mfi_src1_rdata + %d * inst_imms;" % width, file=f)
        print("  wire [%d:0] result = mfi_mem_rdata >> (8*(addr-spec_mem_addr));" % (8*width-1), file=f)

        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src1_addr", "inst_src1")
        if reg:
            assign(f, "spec_src2_addr", "inst_src2")
        assign(f, "spec_dest_addr", "inst_dest")
        assign(f, "spec_mem_addr", "addr & ~3")
        assign(f, "spec_mem_rmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % width)
        assign(f, "spec_dest_wdata", "result")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")
        assign(f, "spec_trap", "(addr & (%d-1)) != 0" % width)

        footer(f)

def inst_st(inst, opcode, width):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_s(f) if reg else format_i(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        if reg:
            print("  wire [31:0] addr = mfi_src1_rdata + mfi_src2_rdata;", file=f)
        else:
            print("  wire [31:0] addr = mfi_src1_rdata + %d * inst_imms;" % width, file=f)

        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src1_addr", "inst_src1")
        if reg:
            assign(f, "spec_src2_addr", "inst_src2")
        assign(f, "spec_src3_addr", "inst_dest")
        assign(f, "spec_dest_addr", "inst_dest")
        assign(f, "spec_mem_addr", "addr & ~3")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % width)
        assign(f, "spec_mem_wdata", "mfi_src3_rdata << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")
        assign(f, "spec_trap", "(addr & (%d-1)) != 0" % width)

        footer(f)

def inst_stc(inst, opcode):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_i(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        print("  wire [31:0] addr = mfi_src1_rdata + %d * inst_imms;" % width, file=f)

        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src1_addr", "inst_src1")
        assign(f, "spec_dest_addr", "inst_dest")
        assign(f, "spec_mem_addr", "addr & ~3")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % width)
        assign(f, "spec_mem_wdata", "mfi_mcr_rdata << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")
        assign(f, "spec_trap", "(addr & (%d-1)) != 0" % width)

        footer(f)

def inst_mov(inst, opcode, expr, reg):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_s(f) if reg else format_i(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        src1 = "mfi_src1_rdata" if reg else "inst_imms"
        print("  wire cond = %s;" % expr, file=f)
        print("  wire [31:0] result = cond ? %s : mfi_src3_rdata;" % src1, file=f)

        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        if reg:
            assign(f, "spec_src1_addr", "inst_src1")
        assign(f, "spec_src3_addr", "inst_dest")
        assign(f, "spec_dest_addr", "inst_dest")
        assign(f, "spec_dest_wdata", "result")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")

        footer(f)

def inst_movl(inst, opcode):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_m(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_dest_addr", "inst_dest")
        assign(f, "spec_dest_wdata", "mfi_src1_rdata | inst_imms")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")

        footer(f)

def inst_movu(inst, opcode):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_m(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_dest_addr", "inst_dest")
        assign(f, "spec_dest_wdata", "inst_imms << 16")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")

        footer(f)

def inst_mfrc(inst, opcode):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_s(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_dest_addr", "inst_dest")
        assign(f, "spec_dest_wdata", "mfi_mcr_rdata")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")

        footer(f)

def inst_flsl(inst, opcode, expr):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_f(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        print("  wire [31:0] result = %s;" % expr, file=f)
        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src1_addr", "inst_src1")
        assign(f, "spec_src2_addr", "inst_src2")
        assign(f, "spec_src3_addr", "inst_rshift")
        assign(f, "spec_dest_addr", "inst_dest")
        assign(f, "spec_dest_wdata", "result")
        assign(f, "spec_pc_wdata", "mfi_pc_rdata + 4")

        footer(f)

def inst_bra(inst, opcode, expr):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_b(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        print("  wire cond = %s;" % expr, file=f)
        print("  wire [31:0] result = mfi_pc_rdata + 4 * inst_offset;", file=f)
        print("  wire [31:0] nextpc = cond ? result : mfi_pc_rdata + 4;", file=f)
        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_pc_wdata", "nextpc")
        assign(f, "spec_trap", "nextpc[1:0] != 0")

        footer(f)

def inst_call(inst, opcode, expr):
    with open("inst_%s.v" % inst, "w") as f:
        header(f, inst)
        format_b(f)

        print("", file=f)
        print("  // %s instruction" % inst.upper(), file=f)
        print("  wire cond = %s;" % expr, file=f)
        print("  wire [31:0] result = mfi_pc_rdata + 4 * inst_offset;", file=f)
        print("  wire [31:0] nextpc = cond ? result : mfi_pc_rdata + 4;", file=f)
        assign(f, "spec_valid", "mfi_valid && !inst_padding && inst_opcode == 8'b %s" % opcode)
        assign(f, "spec_src3_addr", "15")
        assign(f, "spec_dest_addr", "15")
        assign(f, "spec_dest_wdata", "cond ? mfi_src3_rdata - 4 : mfi_src3_rdata")
        assign(f, "spec_mem_addr", "cond ? mfi_src3_rdata & ~3 : 0")
        assign(f, "spec_mem_wmask", "cond ? 4'b1111 << (mfi_src3_rdata-spec_mem_addr) : 0" % width)
        assign(f, "spec_mem_wdata", "cond ? mfi_src3_rdata << (8*(mfi_src3_rdata-spec_mem_addr)) : 0")
        assign(f, "spec_pc_wdata", "nextpc")
        assign(f, "spec_trap", "mfi_src3_rdata[1:0] != 0 || nextpc[1:0] != 0")

        footer(f)

# MINA32 instructions (user mode)
# No pop avoids double register write

inst_alu("add", "00001000", "mfi_src1_rdata + mfi_src2_rdata", True)
inst_alu("sub", "00001110", "mfi_src1_rdata - mfi_src2_rdata", True)
inst_alu("and", "00011000", "mfi_src1_rdata & mfi_src2_rdata", True)
inst_alu("or",  "00011001", "mfi_src1_rdata | mfi_src2_rdata", True)
inst_ld("ld",  "01000000", 4, False)
inst_st("st",  "01000011", 4, False)

"""
# Arithmetic Instructions
inst_alu("addi",   "00000000", "mfi_src1_rdata + inst_imms", False)
inst_alu("multi",  "00000001", "(mfi_src1_rdata + inst_imms) ^ 12341234", False)
inst_alu("divi",   "00000010", "(mfi_src1_rdata + inst_imms) ^ 12341234", False)
inst_alu("remi",   "00000011", "(mfi_src1_rdata + inst_imms) ^ 12341234", False)
inst_alu("slti",   "00000100", "$signed(mfi_src1_rdata) < $signed(inst_imms)", False)
inst_alu("sltiu",  "00000101", "mfi_src1_rdata < inst_imms", False)
inst_nop("nop",    "00000110")
inst_alu("pcaddi", "00000111", "mfi_pc_rdata + inst_imms", False)

inst_alu("add",   "00001000", "mfi_src1_rdata + mfi_src2_rdata", True)
inst_alu("mult",  "00001001", "(mfi_src1_rdata + mfi_src2_rdata) ^ 12341234", True)
inst_alu("div",   "00001010", "(mfi_src1_rdata + mfi_src2_rdata) ^ 12341234", True)
inst_alu("rem",   "00001011", "(mfi_src1_rdata + mfi_src2_rdata) ^ 12341234", True)
inst_alu("slt",   "00001100", "$signed(mfi_src1_rdata) < $signed(mfi_src2_rdata)", True)
inst_alu("sltu",  "00001101", "mfi_src1_rdata < mfi_src2_rdata", True)
inst_alu("sub",   "00001110", "mfi_src1_rdata - mfi_src2_rdata", True)
inst_alu("pcadd", "00001110", "mfi_pc_rdata + mfi_src1_rdata", True)

# Logical Instructions
inst_alu("andi",  "00010000", "mfi_src1_rdata & inst_imms", False)
inst_alu("ori",   "00010001", "mfi_src1_rdata | inst_imms", False)
inst_alu("xori",  "00010010", "mfi_src1_rdata ^ inst_imms", False)
inst_alu("nandi", "00010011", "~(mfi_src1_rdata & inst_imms)", False)

inst_alu("and",    "00011000", "mfi_src1_rdata & mfi_src2_rdata", True)
inst_alu("or",     "00011001", "mfi_src1_rdata | mfi_src2_rdata", True)
inst_alu("xor",    "00011010", "mfi_src1_rdata ^ mfi_src2_rdata", True)
inst_alu("nand",   "00011011", "~(mfi_src1_rdata & mfi_src2_rdata)", True)
inst_alu("popcnt", "00011100", "mfi_src1_rdata ^ 12341234", False)
inst_alu("clo",    "00011101", "mfi_src1_rdata ^ 12341234", False)
inst_alu("plo",    "00011110", "mfi_src1_rdata ^ 12341234", False)

# Compare Instructions
inst_cmp("cmpi.eq", "00100000", "mfi_src1_rdata == inst_imms", False)
inst_cmp("cmpi.lo", "00100001", "mfi_src1_rdata < inst_imms", False)
inst_cmp("cmpi.ls", "00100010", "mfi_src1_rdata <= inst_imms", False)
inst_cmp("cmpi.lt", "00100011", "$signed(mfi_src1_rdata) < $signed(inst_imms)", False)
inst_cmp("cmpi.le", "00100100", "$signed(mfi_src1_rdata) <= $signed(inst_imms)", False)

inst_cmp("cmp.eq", "00100000", "mfi_src1_rdata == mfi_src2_rdata", True)
inst_cmp("cmp.lo", "00100001", "mfi_src1_rdata < mfi_src2_rdata", True)
inst_cmp("cmp.ls", "00100010", "mfi_src1_rdata <= mfi_src2_rdata", True)
inst_cmp("cmp.lt", "00100011", "$signed(mfi_src1_rdata) < $signed(mfi_src2_rdata)", True)
inst_cmp("cmp.le", "00100100", "$signed(mfi_src1_rdata) <= $signed(mfi_src2_rdata)", True)

# Register Branch Instructions
inst_rbra("rbra", "00110000", False)
inst_rcall("rcall", "00110001", False)
inst_ret("ret", "00110010")
inst_rbra("robra", "00111000", True)
inst_rcall("rocall", "00111001", True)

# Memory Access Instructions
inst_ld("ld",  "01000000", 4, False)
inst_ld("ldh", "01000001", 2, False)
inst_ld("ldb", "01000010", 1, False)
inst_st("st",  "01000011", 4, False)
inst_st("sth", "01000100", 2, False)
inst_st("stb", "01000101", 1, False)

inst_ld("rld",  "01001000", 4, True)
inst_ld("rldh", "01001001", 2, True)
inst_ld("rldb", "01001010", 1, True)
inst_st("rst",  "01001011", 4, True)
inst_st("rsth", "01001100", 2, True)
inst_st("rstb", "01001101", 1, True)
inst_stc("stc", "01000111")

# Move Instructions
inst_mov("movi", "01010000", "1", False)
inst_mov("mti",  "01010001", "mfi_mcr_rdata[18] == 1", False)
inst_mov("mfi",  "01010010", "mfi_mcr_rdata[18] == 0", False)
inst_mov("mov", "01011000", "1", True)
inst_mov("mt",  "01011001", "mfi_mcr_rdata[18] == 1", True)
inst_mov("mf",  "01011010", "mfi_mcr_rdata[18] == 0", True)

inst_movl("movl", "01010011")
inst_movu("movu", "01010100")
inst_mfrc("mfrc", "01011100")

# Shift Instructions
inst_alu("lsl", "01100000", "mfi_src1_rdata << inst_imms[4:0]", False)
inst_alu("lsr", "01100001", "mfi_src1_rdata >> inst_imms[4:0]", False)
inst_alu("asr", "01100010", "$signed(mfi_src1_rdata) >> inst_imms[4:0]", False)
inst_alu("ror", "01100011", "{mfi_src1_rdata, mfi_src1_rdata} >> inst_imms[4:0]", False)

inst_alu("rlsl", "01101000", "mfi_src1_rdata << mfi_src2_rdata[4:0]", True)
inst_alu("rlsr", "01101001", "mfi_src1_rdata >> mfi_src2_rdata[4:0]", True)
inst_alu("rasr", "01101010", "$signed(mfi_src1_rdata) >> mfi_src2_rdata[4:0]", True)
inst_alu("rror", "01101011", "{mfi_src1_rdata, mfi_src1_rdata} >> mfi_src2_rdata[4:0]", True)

inst_flsl("flsl", "01101100", "{mfi_src1_rdata, mfi_src2_rdata} << mfi_src3_rdata[4:0])")
inst_flsl("flsr", "01101101", "{mfi_src1_rdata, mfi_src2_rdata} << mfi_src3_rdata[4:0])")

# Control Instructions
inst_cmp("sett", "01110010", "1", False)
inst_cmp("clrt", "01110011", "0", False)

# PC-Relative Branch Instructions
inst_bra("bra", "10000000", "1")
inst_bra("bt", "10000000", "mfi_mcr_rdata[18] == 1")
inst_bra("bf", "10000000", "mfi_mcr_rdata[18] == 0")

inst_call("call", "10001000", "1")
inst_call("ct", "10001001", "mfi_mcr_rdata[18] == 1")
inst_call("cf", "10001010", "mfi_mcr_rdata[18] == 0")
"""

# ISA listing and model

with open("isa_m32.txt", "w") as f:
    for inst in sorted(insts):
        print(inst, file=f)

with open("isa_m32.v", "w") as f:
    header(f, "m32", isa_mode=True)

    for inst in sorted(insts):
        print("  wire          spec_inst_%s_valid;"      % inst, file=f)
        print("  wire          spec_inst_%s_trap;"       % inst, file=f)
        print("  wire [ 3 : 0] spec_inst_%s_src1_addr;"  % inst, file=f)
        print("  wire [ 3 : 0] spec_inst_%s_src2_addr;"  % inst, file=f)
        print("  wire [ 3 : 0] spec_inst_%s_src3_addr;"  % inst, file=f)
        print("  wire [ 3 : 0] spec_inst_%s_dest_addr;"  % inst, file=f)
        print("  wire [31 : 0] spec_inst_%s_dest_wdata;" % inst, file=f)
        print("  wire [31 : 0] spec_inst_%s_pc_wdata;"   % inst, file=f)
        print("  wire [ 3 : 0] spec_inst_%s_mcr_wmask;"  % inst, file=f)
        print("  wire [31 : 0] spec_inst_%s_mcr_wdata;"  % inst, file=f)
        print("  wire [31 : 0] spec_inst_%s_mem_addr;"   % inst, file=f)
        print("  wire [ 3 : 0] spec_inst_%s_mem_rmask;"  % inst, file=f)
        print("  wire [ 3 : 0] spec_inst_%s_mem_wmask;"  % inst, file=f)
        print("  wire [31 : 0] spec_inst_%s_mem_wdata;"  % inst, file=f)
        print("", file=f)

        print("  mfi_inst_%s inst_%s (" % (inst, inst), file=f)
        print("    .mfi_valid(mfi_valid),", file=f)
        print("    .mfi_inst(mfi_inst),", file=f)
        print("    .mfi_pc_rdata(mfi_pc_rdata),", file=f)
        print("    .mfi_mcr_rdata(mfi_mcr_rdata),", file=f)
        print("    .mfi_src1_rdata(mfi_src1_rdata),", file=f)
        print("    .mfi_src2_rdata(mfi_src2_rdata),", file=f)
        print("    .mfi_src3_rdata(mfi_src3_rdata),", file=f)
        print("    .mfi_mem_rdata(mfi_mem_rdata),", file=f)
        print("    .spec_valid(spec_inst_%s_valid)," % inst, file=f)
        print("    .spec_trap(spec_inst_%s_trap)," % inst, file=f)
        print("    .spec_src1_addr(spec_inst_%s_src1_addr)," % inst, file=f)
        print("    .spec_src2_addr(spec_inst_%s_src2_addr)," % inst, file=f)
        print("    .spec_src3_addr(spec_inst_%s_src3_addr)," % inst, file=f)
        print("    .spec_dest_addr(spec_inst_%s_dest_addr)," % inst, file=f)
        print("    .spec_dest_wdata(spec_inst_%s_dest_wdata)," % inst, file=f)
        print("    .spec_pc_wdata(spec_inst_%s_pc_wdata)," % inst, file=f)
        print("    .spec_mcr_wmask(spec_inst_%s_mcr_wmask)," % inst, file=f)
        print("    .spec_mcr_wdata(spec_inst_%s_mcr_wdata)" % inst, file=f)
        print("    .spec_mem_addr(spec_inst_%s_mem_addr)," % inst, file=f)
        print("    .spec_mem_rmask(spec_inst_%s_mem_rmask)," % inst, file=f)
        print("    .spec_mem_wmask(spec_inst_%s_mem_wmask)," % inst, file=f)
        print("    .spec_mem_wdata(spec_inst_%s_mem_wdata)" % inst, file=f)
        print("  );", file=f)
        print("", file=f)

    ports = ["valid", "trap", "src1_addr", "src2_addr", "src3_addr", "dest_addr",
             "dest_wdata", "pc_wdata", "mcr_wmask", "mcr_wdata", "mem_addr",
             "mem_rmask", "mem_wmask", "mem_wdata"]
    fmt = "spec_inst_%s_valid ? spec_inst_%s_%s"

    for port in ports:
        vals = " :\n\t\t".join([fmt % (inst, inst, port) for inst in sorted(insts)])
        print("  assign spec_%s =\n\t\t%s : 0;" % (port, vals), file=f)

    print("endmodule", file=f)
