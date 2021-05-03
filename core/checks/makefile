all: causal liveness pc_bwd pc_fwd reg unique inst_add inst_and inst_ld inst_or inst_st inst_sub
causal: causal/.stamp
causal/.stamp:
	sby causal.sby
.PHONY: causal
liveness: liveness/.stamp
liveness/.stamp:
	sby liveness.sby
.PHONY: liveness
pc_bwd: pc_bwd/.stamp
pc_bwd/.stamp:
	sby pc_bwd.sby
.PHONY: pc_bwd
pc_fwd: pc_fwd/.stamp
pc_fwd/.stamp:
	sby pc_fwd.sby
.PHONY: pc_fwd
reg: reg/.stamp
reg/.stamp:
	sby reg.sby
.PHONY: reg
unique: unique/.stamp
unique/.stamp:
	sby unique.sby
.PHONY: unique
inst_add: inst_add/.stamp
inst_add/.stamp:
	sby inst_add.sby
.PHONY: inst_add
inst_and: inst_and/.stamp
inst_and/.stamp:
	sby inst_and.sby
.PHONY: inst_and
inst_ld: inst_ld/.stamp
inst_ld/.stamp:
	sby inst_ld.sby
.PHONY: inst_ld
inst_or: inst_or/.stamp
inst_or/.stamp:
	sby inst_or.sby
.PHONY: inst_or
inst_st: inst_st/.stamp
inst_st/.stamp:
	sby inst_st.sby
.PHONY: inst_st
inst_sub: inst_sub/.stamp
inst_sub/.stamp:
	sby inst_sub.sby
.PHONY: inst_sub
