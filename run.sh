echo "riscv64-unknown-elf-as boot.S -o boot.o"

riscv64-unknown-elf-as boot.S -o boot.o

echo "riscv64-unknown-elf-ld -T kernel.lds boot.o -o kernel.elf"
riscv64-unknown-elf-ld -T kernel.lds boot.o -o kernel.elf

echo "qemu-system-riscv64 -machine virt -cpu rv64 -smp 4 -m 128M -nographic -serial mon:stdio -bios none -kernel kernel.elf"
qemu-system-riscv64 -machine virt -cpu rv64 -smp 4 -m 128M -nographic -serial mon:stdio -bios none -kernel kernel.elf