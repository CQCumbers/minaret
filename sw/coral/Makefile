TOOLCHAIN := /Users/alexanderzhang/Documents/llvm-project/build/bin
SYSROOT := /Users/alexanderzhang/Documents/mina32-newlib/examples/sysroot
COMMON  := /Users/alexanderzhang/Documents/mina32-newlib/examples/common

CC := $(TOOLCHAIN)/clang
OBJCOPY := $(TOOLCHAIN)/llvm-objcopy

CFLAGS := -target mina32-elf -g -Os
CFLAGS += -I$(COMMON) --sysroot=$(SYSROOT)
LDFLAGS := -Wl,-T$(COMMON)/minaret.ld

.PHONY: clean

coral.hex: coral
	$(OBJCOPY) -O ihex $^ $@

coral: coral.c $(COMMON)/minaret.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ $(LDLIBS) -o $@

clean:
	rm coral.hex coral
