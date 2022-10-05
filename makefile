BUILD_DIR:=build
SRC_DIR:=src
CPP_BASE_FLAGS:=-O0 -fno-stack-protector -fno-pie -ffreestanding -mno-red-zone -Wall -Wextra -fno-exceptions -fno-rtti -ftree-vectorize -funroll-loops -mno-avx -std=c++2a
NASM_BASE_FLAGS:=-w all

#BOOTSTRAP
BOOTSTRAP_SRC_DIR:=$(SRC_DIR)/bootstrap
BOOTSTRAP_SRC_CPP:=$(shell find $(BOOTSTRAP_SRC_DIR) -name '*.cpp')
BOOTSTRAP_SRC_NASM:=$(shell find $(BOOTSTRAP_SRC_DIR) -name '*.nasm')
BOOTSTRAP_INCLUDE_DIRS:=$(SRC_DIR)/include/bootstrap $(SRC_DIR)/include/general

BOOTSTRAP_NASM_FLAGS:=$(NASM_BASE_FLAGS) $(addprefix -I, $(BOOTSTRAP_INCLUDE_DIRS)) -f elf32
BOOTSTRAP_CPP_FLAGS:=$(CPP_BASE_FLAGS) $(addprefix -I, $(BOOTSTRAP_INCLUDE_DIRS)) -m32
BOOTSTRAP_OBJ_CPP:=$(addprefix $(BUILD_DIR)/, $(BOOTSTRAP_SRC_CPP:.cpp=.o))
BOOTSTRAP_OBJ_NASM:=$(addprefix $(BUILD_DIR)/, $(BOOTSTRAP_SRC_NASM:.nasm=.o))
BOOTSTRAP_OBJ:=$(BOOTSTRAP_OBJ_CPP) $(BOOTSTRAP_OBJ_NASM)
BOOTSTRAP_LD_FLAGS:=-n -T $(BOOTSTRAP_SRC_DIR)/link.ld -m elf_i386
BOOTSTRAP_BIN:=$(BUILD_DIR)/bootstrap.bin

$(BOOTSTRAP_OBJ_CPP): CPP_FLAGS:=$(BOOTSTRAP_CPP_FLAGS)

$(BOOTSTRAP_OBJ_NASM): NASM_FLAGS:=$(BOOTSTRAP_NASM_FLAGS)



#KERNEL
KERNEL_SRC_DIR:=$(SRC_DIR)/kernel
KERNEL_SRC_CPP:=$(shell find $(KERNEL_SRC_DIR) -name '*.cpp')
KERNEL_SRC_NASM:=$(shell find $(KERNEL_SRC_DIR) -name '*.nasm')
KERNEL_INCLUDE_DIRS:=$(SRC_DIR)/include/kernel $(SRC_DIR)/include/general

KERNEL_NASM_FLAGS:=$(NASM_BASE_FLAGS) $(addprefix -I, $(KERNEL_INCLUDE_DIRS)) -f elf64
KERNEL_CPP_FLAGS:=$(CPP_BASE_FLAGS) $(addprefix -I, $(KERNEL_INCLUDE_DIRS))
KERNEL_OBJ_CPP:=$(addprefix $(BUILD_DIR)/, $(KERNEL_SRC_CPP:.cpp=.o))
KERNEL_OBJ_NASM:=$(addprefix $(BUILD_DIR)/, $(KERNEL_SRC_NASM:.nasm=.o))
KERNEL_OBJ:=$(KERNEL_OBJ_CPP) $(KERNEL_OBJ_NASM)
KERNEL_LD_FLAGS:=-n -T $(KERNEL_SRC_DIR)/link.ld
KERNEL_BIN:=$(BUILD_DIR)/kernel.bin

$(KERNEL_OBJ_CPP): CPP_FLAGS:=$(KERNEL_CPP_FLAGS)

$(KERNEL_OBJ_NASM): NASM_FLAGS:=$(KERNEL_NASM_FLAGS)



CONFIG=grub.cfg
ISO:=$(BUILD_DIR)/myos.iso

$(ISO): $(BOOTSTRAP_BIN) $(KERNEL_BIN) $(CONFIG)
	mkdir -p $(BUILD_DIR)/iso/boot/grub
	cp $(CONFIG) $(BUILD_DIR)/iso/boot/grub/
	cp $(BOOTSTRAP_BIN) $(BUILD_DIR)/iso/boot/
	cp $(KERNEL_BIN) $(BUILD_DIR)/iso/boot/
	grub-mkrescue -o $(ISO) $(BUILD_DIR)/iso
	#--xorriso=/home/prokhor40/opt/source_packages/bin/xorriso


all: $(ISO)


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
	qemu-system-x86_64 -enable-kvm -cpu host -bios /usr/share/ovmf/x64/OVMF_CODE.fd -cdrom $(BUILD_DIR)/myos.iso
run_bios:
	qemu-system-x86_64 -enable-kvm -cpu host -cdrom $(BUILD_DIR)/myos.iso


$(EXECUTABLE): $(OBJECTS)
	x86_64-elf-ld $(LD_FLAGS) -o $@ $^

$(OBJECTS): $(HEADER_SRC)
$(BUILD_DIR)/%.o: %.nasm | $(BUILD_DIR)
	@mkdir -p $(@D)
	nasm $(NASM_FLAGS) $< -o $@

$(BUILD_DIR)/%.o: %.cpp | $(BUILD_DIR)
	#$(shell x86_64-elf-g++ $(CPP_FLAGS) -M $<) #deps
	@mkdir -p $(@D)
	x86_64-elf-g++ $(CPP_FLAGS) -c $< -o $@

$(BOOTSTRAP_BIN): $(BOOTSTRAP_OBJ)
	x86_64-elf-ld $(BOOTSTRAP_LD_FLAGS) -o $(BOOTSTRAP_BIN) $(BOOTSTRAP_OBJ)

$(KERNEL_BIN): $(KERNEL_OBJ)
	x86_64-elf-ld $(KERNEL_LD_FLAGS) -o $(KERNEL_BIN) $(KERNEL_OBJ)
