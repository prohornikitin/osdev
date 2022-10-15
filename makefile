BUILD_DIR:=build
SRC_DIR:=src
CXX_BASE_FLAGS:= $(CXXFLAGS) -O0 -fno-stack-protector -fno-pie -ffreestanding -mno-red-zone -Wall -Wextra -fno-exceptions -fno-rtti -ftree-vectorize -funroll-loops -mno-avx -std=c++2a
NASM_BASE_FLAGS:=-w all

CONFIG:=grub.cfg
ISO:=$(BUILD_DIR)/myos.iso
QEMU_FLAGS:=-enable-kvm -cpu host -cdrom $(ISO)

#BOOTSTRAP
BOOTSTRAP_CXX:=i686-elf-g++
BOOTSTRAP_SRC_DIR:=$(SRC_DIR)/bootstrap
BOOTSTRAP_SRC_CXX:=$(shell find $(BOOTSTRAP_SRC_DIR) -name '*.cpp')
BOOTSTRAP_SRC_NASM:=$(shell find $(BOOTSTRAP_SRC_DIR) -name '*.nasm')
BOOTSTRAP_INCLUDE_DIRS:=$(SRC_DIR)/include/bootstrap $(SRC_DIR)/include/general

BOOTSTRAP_NASM_FLAGS:=$(NASM_BASE_FLAGS) $(addprefix -I, $(BOOTSTRAP_INCLUDE_DIRS)) -f elf32
BOOTSTRAP_CXX_FLAGS:=$(CXX_BASE_FLAGS) $(addprefix -I, $(BOOTSTRAP_INCLUDE_DIRS)) -m32
BOOTSTRAP_OBJ_CXX:=$(addprefix $(BUILD_DIR)/, $(BOOTSTRAP_SRC_CXX:.cpp=.o))
BOOTSTRAP_OBJ_NASM:=$(addprefix $(BUILD_DIR)/, $(BOOTSTRAP_SRC_NASM:.nasm=.o))
BOOTSTRAP_OBJ:=$(BOOTSTRAP_OBJ_CXX) $(BOOTSTRAP_OBJ_NASM)
BOOTSTRAP_LINK_FLAGS:=-T $(BOOTSTRAP_SRC_DIR)/link.ld -ffreestanding -nostdlib -lgcc -flto
BOOTSTRAP_BIN:=$(BUILD_DIR)/bootstrap.bin

$(BOOTSTRAP_OBJ_CXX): CXX_FLAGS:=$(BOOTSTRAP_CXX_FLAGS)
$(BOOTSTRAP_OBJ_CXX): CXX:=$(BOOTSTRAP_CXX)

$(BOOTSTRAP_OBJ_NASM): NASM_FLAGS:=$(BOOTSTRAP_NASM_FLAGS)



#KERNEL
KERNEL_CXX:=x86_64-elf-g++
KERNEL_SRC_DIR:=$(SRC_DIR)/kernel
KERNEL_SRC_CXX:=$(shell find $(KERNEL_SRC_DIR) -name '*.cpp')
KERNEL_SRC_NASM:=$(shell find $(KERNEL_SRC_DIR) -name '*.nasm')
KERNEL_INCLUDE_DIRS:=$(SRC_DIR)/include/kernel $(SRC_DIR)/include/general

KERNEL_NASM_FLAGS:=$(NASM_BASE_FLAGS) $(addprefix -I, $(KERNEL_INCLUDE_DIRS)) -f elf64
KERNEL_CXX_FLAGS:=$(CXX_BASE_FLAGS) $(addprefix -I, $(KERNEL_INCLUDE_DIRS))
KERNEL_OBJ_CXX:=$(addprefix $(BUILD_DIR)/, $(KERNEL_SRC_CXX:.cpp=.o))
KERNEL_OBJ_NASM:=$(addprefix $(BUILD_DIR)/, $(KERNEL_SRC_NASM:.nasm=.o))
KERNEL_OBJ:=$(KERNEL_OBJ_CXX) $(KERNEL_OBJ_NASM)
KERNEL_LINK_FLAGS:=-n -T $(KERNEL_SRC_DIR)/link.ld -flto
KERNEL_BIN:=$(BUILD_DIR)/kernel.bin

$(KERNEL_OBJ_CXX): CXX_FLAGS:=$(KERNEL_CXX_FLAGS)
$(KERNEL_OBJ_CXX): CXX:=$(KERNEL_CXX)

$(KERNEL_OBJ_NASM): NASM_FLAGS:=$(KERNEL_NASM_FLAGS)



all: $(ISO)

$(ISO): $(BOOTSTRAP_BIN) $(KERNEL_BIN) $(CONFIG)
	mkdir -p $(BUILD_DIR)/iso/boot/grub
	cp $(CONFIG) $(BUILD_DIR)/iso/boot/grub/
	cp $(BOOTSTRAP_BIN) $(BUILD_DIR)/iso/boot/
	cp $(KERNEL_BIN) $(BUILD_DIR)/iso/boot/
	grub-mkrescue -o $(ISO) $(BUILD_DIR)/iso
	#--xorriso=/home/prokhor40/opt/source_packages/bin/xorriso



rebuild:
	make clean
	make all

yes:
	@echo $(KERNEL_OBJ)


clean:
	rm -r $(BUILD_DIR)/*


debug: $(ISO) | run
debug_bios: $(ISO) | run_bios

run:
	qemu-system-x86_64 $(QEMU_FLAGS) -bios /usr/share/ovmf/x64/OVMF_CODE.fd
run_bios:
	qemu-system-x86_64 $(QEMU_FLAGS)


$(BUILD_DIR)/%.o: %.nasm | $(BUILD_DIR)
	@mkdir -p $(@D)
	nasm $(NASM_FLAGS) $< -o $@

$(BUILD_DIR)/%.o: %.cpp | $(BUILD_DIR)
	@mkdir -p $(@D)
	$(CXX) $(CXX_FLAGS) -c $< -o $@

$(BOOTSTRAP_BIN): $(BOOTSTRAP_OBJ)
	i686-elf-gcc -o $(BOOTSTRAP_BIN) $(BOOTSTRAP_OBJ) $(BOOTSTRAP_LINK_FLAGS)

$(KERNEL_BIN): $(KERNEL_OBJ)
	x86_64-elf-ld -o $(KERNEL_BIN) $(KERNEL_OBJ) $(KERNEL_LINK_FLAGS)
