# Simple Setup for RISC-V on Windows (WSL)

This guide will help you set up everything you need to run RISC-V programs on **Windows Subsystem for Linux (WSL)**. We'll go through installing the RISC-V toolchain, setting up QEMU for running virtual machines, and compiling a basic bootloader.

## Step 1: Install WSL

First, make sure you have WSL installed on your Windows machine. You can follow the [official instructions here](https://docs.microsoft.com/en-us/windows/wsl/install) if you don't have it set up yet.

## Step 2: Install the RISC-V Toolchain

You'll need the RISC-V toolchain to compile and link RISC-V programs. Here's how you can install it:

1. Open WSL (Ubuntu is recommended).
2. Follow the steps from this GitHub repo to install the toolchain: [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain).

Once installed, the following tools should be ready:
- **Assembler**: `riscv64-unknown-elf-as`
- **Linker**: `riscv64-unknown-elf-ld`

## Step 3: Install QEMU for RISC-V

QEMU lets you run virtual machines. We'll use it to emulate RISC-V hardware.

1. Follow the official guide to compile and install QEMU for RISC-V: [QEMU RISC-V Setup](https://www.qemu.org/docs/master/system/riscv/virt.html).

## Step 4: Run RISC-V Programs in QEMU

Once QEMU is set up, use this command to run a RISC-V virtual machine:

```bash
qemu-system-riscv64 -machine virt -cpu rv64 -smp 4 -m 128M -nographic -serial mon:stdio -bios none -kernel kernel.elf
