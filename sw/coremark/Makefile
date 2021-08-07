TOOLCHAIN := /Users/alexanderzhang/Documents/llvm-project/build/bin
SYSROOT := /Users/alexanderzhang/Documents/minaret/sw/sysroot
COMMON  := /Users/alexanderzhang/Documents/minaret/sw/common

CC := $(TOOLCHAIN)/clang
OBJCOPY := $(TOOLCHAIN)/llvm-objcopy

CFLAGS := -target mina32-elf -g -Os
CFLAGS += -I$(COMMON) --sysroot=$(SYSROOT)
LDFLAGS := -Wl,-T$(COMMON)/minaret.ld

APP_SRC := core_list_join.c	core_main.c core_matrix.c core_portme.c
APP_SRC += core_state.c core_util.c cvt.c ee_printf.c

.PHONY: clean

coremark.hex: coremark
	$(OBJCOPY) -O ihex $^ $@

coremark: $(APP_SRC) $(COMMON)/minaret.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ $(LDLIBS) -o $@

clean:
	rm coremark.hex coremark
