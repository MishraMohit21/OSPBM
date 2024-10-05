# MSPOS: My Small Project OS

Welcome to **MSPOS** (My Small Project OS)! This is a personal project where I'm building a minimal operating system from scratch for the **RISC-V architecture**. The ultimate goal? To get **Doom** running on it! This project will involve low-level systems programming, learning about how operating systems work, and using tools like the RISC-V toolchain and **QEMU** for hardware emulation.

## Project Overview

### Objective

- **Create MSPOS**: A minimal OS built for the RISC-V architecture.
- **Run Doom**: As a fun and challenging goal, I aim to get Doom (the 1993 game) running on MSPOS.
- **Learn by doing**: This is a learning project, where I get hands-on experience with OS development and RISC-V architecture.

I’ll be building this OS using **assembly** and **C**, compiling with the RISC-V GNU toolchain, and running everything on QEMU for RISC-V emulation.

## Setting Up the Development Environment

If you'd like to try this out on your own, or just follow along, you can set up the same development environment on Windows using **Windows Subsystem for Linux (WSL)**. Here’s how:

### Step 1: Install WSL

First, ensure you have **Windows Subsystem for Linux (WSL)** installed on your machine. You can follow the instructions in this [WSL Installation Guide](https://docs.microsoft.com/en-us/windows/wsl/install).

- I recommend using **Ubuntu** for ease of setup.

### Step 2: Install the RISC-V Toolchain

To build MSPOS, we need the RISC-V GNU toolchain for compiling and linking RISC-V code. Here’s how to set it up:

1. Open your WSL terminal (Ubuntu recommended).
2. Follow the instructions from the official RISC-V GNU Toolchain repository to install it:
   - [riscv-gnu-toolchain GitHub](https://github.com/riscv-collab/riscv-gnu-toolchain)
3. After installation, the following key tools should be available:
   - **Assembler**: `riscv64-unknown-elf-as`
   - **Linker**: `riscv64-unknown-elf-ld`

### Step 3: Install QEMU for RISC-V

QEMU is a machine emulator and virtualizer that allows you to emulate RISC-V hardware on your machine. Here’s how to install it:

1. Follow the instructions from the QEMU documentation to install QEMU with RISC-V support:
   - [QEMU RISC-V Setup Guide](https://www.qemu.org/docs/master/system/riscv/virt.html)
   
### Step 4: Running MSPOS in QEMU

Once QEMU is set up, use the following command to run MSPOS in the emulated RISC-V environment:

```bash
qemu-system-riscv64 -machine virt -cpu rv64 -smp 4 -m 128M -nographic -serial mon:stdio -bios none -kernel kernel.elf
