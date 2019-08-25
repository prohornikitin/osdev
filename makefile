KERNEL_CPP_SOURCES:=kernel.cpp \
	interrupts/PIC.cpp \
	io/ports/ports.cpp \
	terminals/text_terminal.cpp \
	MultiThreading/Lock.cpp \
	graphics/RgbaPixel.cpp


KERNEL_NASM_SOURCES:=cpuid/checkCompatibility.nasm \
	multiboot_header.nasm \
	bootstrap.nasm \
	GDT.nasm \
	start64.nasm \
	graphics/framebuffer.nasm \
	interrupts/APIC/APIC.nasm \
	interrupts/APIC/xAPIC.nasm \
	interrupts/APIC/x2APIC.nasm \
	interrupts/APIC/RegisterOffsets.nasm \
	interrupts/handlers.nasm \
	io/ports/portsCppAdapter.nasm \
	io/MSR/MSR.nasm \
	interrupts/IDT.nasm \
	multiboot/findStruct.nasm \
	ACPI/validateCheckSum.nasm \
	ACPI/getValidXSDP.nasm \
	ACPI/FindTable.nasm \
	ACPI/Data.nasm \
	ACPI/allocateAcpiMemRegion.nasm \
	cpuid/detectCpuVendor.nasm \
	MultiThreading/simpleLock.nasm \
	MultiThreading/CpuTopology.nasm \
	MultiThreading/identifyCpuTopology.nasm \
	MultiThreading/CpuTopologyDomain.nasm \
	terminals/asm_terminal.nasm


STDLIB_CPP_SOURCES:=string/char8/len.cpp \
	string/char8/copy.cpp \
	string/char8/copyN.cpp \
	string/char8/compare.cpp \
	string/char8/compareN.cpp \
	string/char8/concatenate.cpp \
	string/char8/concatenateN.cpp \
	string/char8/findChar.cpp \
	string/char8/findStr.cpp \
	string/char16/len.cpp \
	string/char16/copy.cpp \
	string/char16/copyN.cpp \
	string/char16/compare.cpp \
	string/char16/compareN.cpp \
	string/char16/concatenate.cpp \
	string/char16/concatenateN.cpp \
	string/char16/findChar.cpp \
	string/char16/findStr.cpp \
	string/char32/len.cpp \
	string/char32/copy.cpp \
	string/char32/copyN.cpp \
	string/char32/compare.cpp \
	string/char32/compareN.cpp \
	string/char32/concatenate.cpp \
	string/char32/concatenateN.cpp \
	string/char32/findChar.cpp \
	string/char32/findStr.cpp \
	error/error.cpp \
	memory/find.cpp \
	memory/safeMove.cpp

STDLIB_NASM_SOURCES:=memory/copy.nasm \
	memory/isEqual.nasm \
	memory/set.nasm \
	memory/compare.nasm \
	memory/copyBackward.nasm



BUILD_DIR:= build

KERNEL_CPP_OBJECTS=$(addprefix $(BUILD_DIR)/kernel/,$(KERNEL_CPP_SOURCES:.cpp=.o))
KERNEL_NASM_OBJECTS=$(addprefix $(BUILD_DIR)/kernel/,$(KERNEL_NASM_SOURCES:.nasm=.o))
STDLIB_CPP_OBJECTS=$(addprefix $(BUILD_DIR)/stdlib/,$(STDLIB_CPP_SOURCES:.cpp=.o))
STDLIB_NASM_OBJECTS=$(addprefix $(BUILD_DIR)/stdlib/,$(STDLIB_NASM_SOURCES:.nasm=.o))


OBJECTS = $(KERNEL_CPP_OBJECTS) $(KERNEL_NASM_OBJECTS) $(STDLIB_NASM_OBJECTS) $(STDLIB_CPP_OBJECTS)
ISO=$(BUILD_DIR)/myos.iso
EXECUTABLE=$(BUILD_DIR)/myos.bin

INCLUDE_DIRS=-I kernel/include -I stdlib/include	


CPP_FLAGS=$(INCLUDE_FOLDERS) -Ofast -fno-stack-protector -ffreestanding -mno-red-zone -Wall -m64 -Wextra -fno-exceptions -fno-rtti -ftree-vectorize -funroll-loops -mavx#-march=znver2 -std=c++2a 
NASM_FLAGS=-f elf64 -w all $(INCLUDE_DIRS)
LD_FLAGS=-n -T link.ld $(INCLUDE_DIRS)

all: $(ISO)

rebuild: clean 
	make all


clean:
	rm -f $(OBJECTS)
	rm -rf $(EXECUTABLE)
	rm -rf $(BUILD_DIR)/iso/
	rm -rf $(ISO)


CREATE_ISO_DIR:
	mkdir -p $(BUILD_DIR)/iso/boot/grub

copyGrubCfg: CREATE_ISO_DIR
	cp grub.cfg $(BUILD_DIR)/iso/boot/grub/

copyExecutable: CREATE_ISO_DIR $(EXECUTABLE)
	cp $(EXECUTABLE) $(BUILD_DIR)/iso/boot/

$(ISO): copyGrubCfg copyExecutable 
	grub-mkrescue -o $(ISO) $(BUILD_DIR)/iso
	#--xorriso=/home/prokhor40/opt/source_packages/bin/xorriso

debug: all run

debug_bios: all run_bios

run:
	qemu-system-x86_64 -enable-kvm -cpu host -bios /usr/share/ovmf/x64/OVMF_CODE.fd -cdrom $(BUILD_DIR)/myos.iso
run_bios:
	qemu-system-x86_64 -enable-kvm -cpu host -cdrom $(BUILD_DIR)/myos.iso


$(EXECUTABLE): $(OBJECTS)
	ld $(LD_FLAGS) -o $@ $^

$(BUILD_DIR)/%.o: %.nasm | $(BUILD_DIR)
	nasm $(NASM_FLAGS) $< -o $@ 

$(BUILD_DIR)/%.o: %.cpp | $(BUILD_DIR)
	g++ $(CPP_FLAGS) $(INCLUDE_DIRS) -c $< -o $@ 
