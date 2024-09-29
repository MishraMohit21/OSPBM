GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

BUILD_DIR = build
ISO_DIR = $(BUILD_DIR)/iso

objects = $(BUILD_DIR)/loader.o $(BUILD_DIR)/gdt.o $(BUILD_DIR)/port.o $(BUILD_DIR)/kernel.o

# Rule for C++ files
$(BUILD_DIR)/%.o: %.cpp
	mkdir -p $(BUILD_DIR)
	g++ $(GPPPARAMS) -o $@ -c $<

# Rule for Assembly files
$(BUILD_DIR)/%.o: %.s
	mkdir -p $(BUILD_DIR)
	as $(ASPARAMS) -o $@ $<

# Target to build the kernel binary
$(BUILD_DIR)/mykernel.bin: linker.ld $(objects)
	mkdir -p $(BUILD_DIR)
	ld $(LDPARAMS) -T linker.ld -o $@ $(objects)

# Rule to create floppy image (optional)
$(BUILD_DIR)/mykernel_floppy.img: $(BUILD_DIR)/mykernel.bin
	cp $< $@
	truncate -s 1440k $@

# Rule to create bootable ISO file
$(BUILD_DIR)/mykernel.iso: $(BUILD_DIR)/mykernel.bin
	mkdir -p $(ISO_DIR)/boot/grub
	cp $(BUILD_DIR)/mykernel.bin $(ISO_DIR)/boot/
	echo 'set timeout=0' > $(ISO_DIR)/boot/grub/grub.cfg
	echo 'set default=0' >> $(ISO_DIR)/boot/grub/grub.cfg
	echo 'menuentry "MyKernel" {' >> $(ISO_DIR)/boot/grub/grub.cfg
	echo '    multiboot /boot/mykernel.bin' >> $(ISO_DIR)/boot/grub/grub.cfg
	echo '    boot' >> $(ISO_DIR)/boot/grub/grub.cfg
	echo '}' >> $(ISO_DIR)/boot/grub/grub.cfg
	grub-mkrescue -o $(BUILD_DIR)/mykernel.iso $(ISO_DIR)
	rm -rf iso

install: $(BUILD_DIR)/mykernel.iso
	sudo cp $< /boot/mykernel.iso

# Clean target
clean:
	rm -rf $(BUILD_DIR)

run: $(BUILD_DIR)/mykernel.iso
	cd $(BUILD_DIR) && qemu-system-x86_64 -cdrom mykernel.iso -m 2G -smp 2 -boot d
