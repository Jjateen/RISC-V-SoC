cd firmware_asm

# Step 1: Assemble the RISC-V assembly source code into an object file
riscv32-unknown-elf-gcc -c -mabi=ilp32 -march=rv32i -o code.o code.S

# Step 2: Link the object file into an ELF executable
riscv32-unknown-elf-gcc -Og -mabi=ilp32 -march=rv32i -ffreestanding -nostdlib \
    -Wl,--build-id=none,-Bstatic,-T,sections.lds,-Map,code.map,--strip-debug \
    code.o -lgcc -o code.elf

# Step 3: Disassemble the ELF executable for debugging or inspection
riscv32-unknown-elf-objdump -d code.elf > dumpfile

# Step 4: Convert the ELF executable into a raw binary file
riscv32-unknown-elf-objcopy -O binary code.elf code.bin

# Step 5: Convert the raw binary file into a hex format with the specified memory size
python3 makehex.py code.bin 1024 > code.hex

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