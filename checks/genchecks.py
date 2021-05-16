import os, sys, shutil, re

isa = "m32"
depths = list()
blackbox = False

cfgname = "checks"
basedir = "%s/.." % os.getcwd()
corename = os.getcwd().split("/")[-1]
solver = "boolector"
dumpsmt2 = False
sbycmd = "sby"
config = dict()

if len(sys.argv) > 1:
    assert len(sys.argv) == 2
    cfgname = sys.argv[1]

print("Reading %s.cfg." % cfgname)
with open("%s.cfg" % cfgname, "r") as f:
    cfgsection = None
    for line in f:
        line = line.strip()

        if line.startswith("#"):
            continue

        if line.startswith("[") and line.endswith("]"):
            cfgsection = line.lstrip("[").rstrip("]")
            continue

        if cfgsection is not None:
            if cfgsection not in config:
                config[cfgsection] = ""
            config[cfgsection] += line + "\n"

if "options" in config:
    for line in config["options"].split("\n"):
        line = line.split()

        if len(line) == 0:
            continue

        elif line[0] == "isa":
            assert len(line) == 2
            isa = line[1]

        elif line[0] == "blackbox":
            assert len(line) == 1
            blackbox = True

        elif line[0] == "solver":
            assert len(line) == 2
            solver = line[1]

        elif line[0] == "dumpsmt2":
            assert len(line) == 1
            dumpsmt2 = True

        else:
            print(line)
            assert 0

print("Creating %s directory." % cfgname)
shutil.rmtree(cfgname, ignore_errors=True)
os.mkdir(cfgname)

def print_hfmt(f, text, **kwargs):
    for line in text.split("\n"):
        match = re.match(r"^\s*: ?(.*)", line)
        if match:
            line = match.group(1)
        elif line.strip() == "":
            continue
        print(re.sub(r"@([a-zA-Z0-9_]+)@",
                lambda match: str(kwargs[match.group(1)]), line), file=f)

hargs = dict()
hargs["basedir"] = basedir
hargs["cfgname"] = cfgname
hargs["core"] = corename
hargs["append"] = 0

instruction_checks = set()
consistency_checks = set()

if solver == "bmc3":
    hargs["engine"] = "abc bmc3"
    hargs["ilang_file"] = corename + "-gates.il"
else:
    hargs["engine"] = "smtbmc %s%s" % ("--dumpsmt2 " if dumpsmt2 else "", solver)
    hargs["ilang_file"] = corename + "-hier.il"

def test_disabled(check):
    if "filter-checks" in config:
        for line in config["filter-checks"].split("\n"):
            line = line.strip().split()
            if len(line) == 0: continue
            assert len(line) == 2 and line[0] in ["-", "+"]
            if re.match(line[1], check):
                return line[0] == "-"
    return False

def get_depth_cfg(patterns):
    ret = None
    if "depth" in config:
        for line in config["depth"].split("\n"):
            line = line.strip().split()
            if len(line) == 0:
                continue
            for pat in patterns:
                if re.fullmatch(line[0], pat):
                    ret = [int(s) for s in line[1:]]
    return ret

# ------------------------------ Instruction Checkers ------------------------------

def check_inst(inst):
    check = "inst_%s" % inst
    depth_cfg = get_depth_cfg(["inst", "inst", "inst_%s" % inst, "inst_%s" % inst])

    if depth_cfg is None: return
    assert len(depth_cfg) == 1

    if test_disabled(check): return
    instruction_checks.add(check)

    hargs["inst"] = inst
    hargs["checkch"] = check
    hargs["depth"] = depth_cfg[0]
    hargs["depth_plus"] = depth_cfg[0] + 2

    with open("%s/%s.sby" % (cfgname, check), "w") as sby_file:
        print_hfmt(sby_file, """
                : [options]
                : mode bmc
                : append @append@
                : tbtop wrapper.dut
                : depth @depth_plus@
                :
                : [engines]
                : @engine@
                :
                : [script]
        """, **hargs)

        if "script-defines" in config:
            print_hfmt(sby_file, config["script-defines"], **hargs)

        print("read_verilog -sv %s.sv" % check, file=sby_file)

        if "script-sources" in config:
            print_hfmt(sby_file, config["script-sources"], **hargs)

        print_hfmt(sby_file, """
                : prep -flatten -nordff -top mfi_testbench
                :
                : [files]
                : @basedir@/@cfgname@/mfi_macros.vh
                : @basedir@/@cfgname@/mfi_testbench.sv
                : @basedir@/@cfgname@/mfi_inst_check.sv
                : @basedir@/insts/inst_@inst@.v
                :
                : [file defines.sv]
        """, **hargs)

        print_hfmt(sby_file, """
                : `define MINA_FORMAL
                : `define MINA_FORMAL_CHECKER mfi_inst_check
                : `define MINA_FORMAL_RESET_CYCLES 1
                : `define MINA_FORMAL_CHECK_CYCLE @depth@
                : `define MINA_FORMAL_INST_MODEL mfi_inst_@inst@
        """, **hargs)

        if blackbox:
            print("`define MINA_FORMAL_BLACKBOX_REGS", file=sby_file)

        if "defines" in config:
            print_hfmt(sby_file, config["defines"], **hargs)

        print_hfmt(sby_file, """
                : `include "mfi_macros.vh"
                :
                : [file @checkch@.sv]
                : `include "defines.sv"
                : `include "mfi_testbench.sv"
                : `include "mfi_inst_check.sv"
                : `include "inst_@inst@.v"
        """, **hargs)

with open("../insts/isa_%s.txt" % isa) as isa_file:
    for inst in isa_file:
        check_inst(inst.strip())

# ------------------------------ Consistency Checkers ------------------------------

def check_cons(check, start=None, trig=None, depth=None):
    hargs["check"] = check

    depth_cfg = get_depth_cfg([check])
    if depth_cfg is None: return

    if start is not None:
        start = depth_cfg[start]
    else:
        start = 1

    if trig is not None:
        trig = depth_cfg[trig]

    if depth is not None:
        depth = depth_cfg[depth]

    hargs["start"] = start
    hargs["depth"] = depth
    hargs["depth_plus"] = depth + 2

    hargs["checkch"] = check

    if test_disabled(check): return
    consistency_checks.add(check)

    with open("%s/%s.sby" % (cfgname, check), "w") as sby_file:
        print_hfmt(sby_file, """
                : [options]
                : mode bmc
                : append @append@
                : tbtop wrapper.dut
                : depth @depth_plus@
                :
                : [engines]
                : @engine@
                :
                : [script]
        """, **hargs)

        if "script-defines" in config:
            print_hfmt(sby_file, config["script-defines"], **hargs)

        if ("script-defines %s" % hargs["check"]) in config:
            print_hfmt(sby_file, config["script-defines %s" % hargs["check"]], **hargs)

        print_hfmt(sby_file, """
                : read_verilog -sv @checkch@.sv
        """, **hargs)

        if "script-sources" in config:
            print_hfmt(sby_file, config["script-sources"], **hargs)

        print_hfmt(sby_file, """
                : prep -flatten -nordff -top mfi_testbench
                :
                : [files]
                : @basedir@/@cfgname@/mfi_macros.vh
                : @basedir@/@cfgname@/mfi_testbench.sv
                : @basedir@/@cfgname@/mfi_@check@_check.sv
                :
                : [file defines.sv]
        """, **hargs)

        print_hfmt(sby_file, """
                : `define MINA_FORMAL
                : `define MINA_FORMAL_CHECKER mfi_@check@_check
                : `define MINA_FORMAL_RESET_CYCLES @start@
                : `define MINA_FORMAL_CHECK_CYCLE @depth@
        """, **hargs)

        if blackbox and hargs["check"] != "liveness":
            print("`define MINA_FORMAL_BLACKBOX_ALU", file=sby_file)

        if blackbox and hargs["check"] != "reg":
            print("`define MINA_FORMAL_BLACKBOX_REGS", file=sby_file)

        if trig is not None:
            print("`define MINA_FORMAL_TRIG_CYCLE %d" % trig, file=sby_file)

        if hargs["check"] in ("liveness", "hang"):
            print("`define MINA_FORMAL_FAIRNESS", file=sby_file)

        if "defines" in config:
            print_hfmt(sby_file, config["defines"], **hargs)

        if ("defines %s" % hargs["check"]) in config:
            print_hfmt(sby_file, config["defines %s" % hargs["check"]], **hargs)

        print_hfmt(sby_file, """
                : `include "mfi_macros.vh"
                :
                : [file @checkch@.sv]
                : `include "defines.sv"
                : `include "mfi_testbench.sv"
                : `include "mfi_@check@_check.sv"
        """, **hargs)

check_cons("reg", start=0, depth=1)
check_cons("pc_fwd", start=0, depth=1)
check_cons("pc_bwd", start=0, depth=1)
check_cons("liveness", start=0, trig=1, depth=2)
check_cons("unique", start=0, trig=1, depth=2)
check_cons("causal", start=0, depth=1)
check_cons("ill", depth=0)

check_cons("hang", start=0, depth=1)

# ------------------------------ Makefile ------------------------------

def checks_key(check):
    if "sort" in config:
        for index, line in enumerate(config["sort"].split("\n")):
            if re.fullmatch(line.strip(), check):
                return "%04d-%s" % (index, check)
    if check.startswith("inst_"):
        return "9999-%s" % check
    return "9998-%s" % check

with open("%s/makefile" % cfgname, "w") as mkfile:
    print("all:", end="", file=mkfile)

    checks = list(sorted(consistency_checks | instruction_checks, key=checks_key))

    for check in checks:
        print(" %s" % check, end="", file=mkfile)
    print(file=mkfile)

    for check in checks:
        print("%s: %s/.stamp" % (check, check), file=mkfile)
        print("%s/.stamp:" % check, file=mkfile)
        print("\t%s %s.sby" % (sbycmd, check), file=mkfile)
        print(".PHONY: %s" % check, file=mkfile)

print("Generated %d checks." % (len(consistency_checks) + len(instruction_checks)))
