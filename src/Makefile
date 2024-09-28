GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

ISO_DIR = iso
BUILD_DIR = build
objects = loader.o kernel.o

# Rule for C++ files
%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<

# Rule for Assembly files
%.o: %.s
	as $(ASPARAMS) -o $@ $<

# Target to build the kernel binary
mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T linker.ld -o $@ $(objects)

# Rule to create floppy image (optional)
$(BUILD_DIR)/mykernel_floppy.img: mykernel.bin
	mkdir -p $(BUILD_DIR)
	cp mykernel.bin $(BUILD_DIR)/mykernel_floppy.img
	truncate -s 1440k $(BUILD_DIR)/mykernel_floppy.img

# Rule to create bootable ISO file
mykernel.iso: mykernel.bin
	mkdir -p $(ISO_DIR)/boot/grub
	cp mykernel.bin $(ISO_DIR)/boot/
	echo 'set timeout=0' > $(ISO_DIR)/boot/grub/grub.cfg
	echo 'set default=0' >> $(ISO_DIR)/boot/grub/grub.cfg
	echo 'menuentry "MyKernel" {' >> $(ISO_DIR)/boot/grub/grub.cfg
	echo '    multiboot /boot/mykernel.bin' >> $(ISO_DIR)/boot/grub/grub.cfg
	echo '    boot' >> $(ISO_DIR)/boot/grub/grub.cfg
	echo '}' >> $(ISO_DIR)/boot/grub/grub.cfg
	grub-mkrescue -o mykernel.iso $(ISO_DIR)

install: mykernel.iso
	sudo cp mykernel.iso /boot/mykernel.iso

# Clean target
clean:
	rm -f $(objects) mykernel.bin mykernel.iso
	rm -rf $(ISO_DIR) $(BUILD_DIR)
