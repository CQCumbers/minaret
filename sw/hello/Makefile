TOOLCHAIN := /Users/alexanderzhang/Documents/llvm-project/build/bin
SYSROOT := /Users/alexanderzhang/Documents/minaret/sw/sysroot
COMMON  := /Users/alexanderzhang/Documents/minaret/sw/common

CC := $(TOOLCHAIN)/clang
OBJCOPY := $(TOOLCHAIN)/llvm-objcopy

CFLAGS := -target mina32-elf -g -Os
CFLAGS += -I$(COMMON) --sysroot=$(SYSROOT)
LDFLAGS := -Wl,-T$(COMMON)/minaret.ld

.PHONY: clean

hello.hex: hello
	$(OBJCOPY) -O ihex $^ $@

hello: hello.c $(COMMON)/minaret.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

clean:
	rm hello.hex hello
