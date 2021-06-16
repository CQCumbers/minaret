CFLAGS = --target=mina32-elf -ffreestanding -nostdlib
TOOLCHAIN_PREFIX = ~/Documents/llvm-project/build/bin

.PHONY: test clean

test: testbench.vvp test.hex
	vvp -N testbench.vvp

testbench.vvp: testbench.v minaret.v
	iverilog -o testbench.vvp testbench.v minaret.v
	chmod -x testbench.vvp

test.mif: test.bin
	./bin2mif -d 1024 -w 32 -f 0 -i $^ -o $@

test.hex: test.elf
	$(TOOLCHAIN_PREFIX)/llvm-objcopy -O ihex $^ $@

test.bin: test.elf
	$(TOOLCHAIN_PREFIX)/llvm-objcopy -O binary $^ $@

test.elf: test.s
	$(TOOLCHAIN_PREFIX)/clang $(CFLAGS) -o $@ $^

clean:
	rm -rf *.o *.elf *.bin *.hex *.mif testbench.vvp testbench.vcd
