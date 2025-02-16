# Ubuntu packages needed:
cd ~
sudo apt-get install autoconf automake autotools-dev curl libmpc-dev \
        libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo \
    gperf libtool patchutils bc zlib1g-dev git libexpat1-dev

sudo mkdir /opt/riscv32i
# sudo chown $USER /opt/riscv32i

git clone https://github.com/riscv-collab/riscv-gnu-toolchain riscv-gnu-toolchain-rv32i
cd riscv-gnu-toolchain-rv32i
#git checkout 411d134
#git submodule update --init --recursive

# mkdir build; cd build
# ../configure --with-arch=rv32i --prefix=/opt/riscv32i
./configure --with-arch=rv32i --prefix=/opt/riscv32i
sudo make -j$(nproc)
