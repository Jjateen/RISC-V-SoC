cd firmware

make all
# riscv32-unknown-elf-gcc -c -mabi=ilp32 -march=rv32i -o code.o code.S
# riscv32-unknown-elf-gcc -Og -mabi=ilp32 -march=rv32i -ffreestanding -nostdlib -o code.elf -Wl,--build-id=none,-Bstatic,-T,sections.lds,-Map,code.map,--strip-debug code.o -lgcc
# riscv32-unknown-elf-objdump -d code.elf > dumpfile
# riscv32-unknown-elf-objcopy  -O binary code.elf code.bin
# python3 makehex.py code.bin 1024 > code.hex

cd ..
# Step 6: Run the OSS CAD Suite environment
oss
# Step 7: Compile Verilog source files with the testbench
iverilog src/*.v tb_processor.v -o program
# Step 8: Simulate the compiled program
./program
# Output: VCD info: dumpfile tb_processor.vcd opened for output.
# Step 9: View the waveform using GTKWave
gtkwave tb_processor.vcd
