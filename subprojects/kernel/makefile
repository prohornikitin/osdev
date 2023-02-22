BUILD_DIR?=build
PROJECT_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SRC_DIR:=$(PROJECT_DIR)/src
CXX?=x86_64-elf-g++
ASM?=nasm

INCLUDE_DIRS:=$(SRC_DIR)

SRC_CXX:=$(shell find $(SRC_DIR) -name '*.cpp')
SRC_ASM:=$(shell find $(SRC_DIR) -name '*.asm')
HEADERS_CXX:=$(shell find $(SRC_DIR) -name '*.h')
HEADERS_ASM:=$(shell find $(SRC_DIR) -name '*.asmi')
LINKER_SCRIPT:=$(SRC_DIR)/link.ld

CXX_FLAGS:=$(CXXFLAGS) -O0 -fno-stack-protector -fno-pie -ffreestanding -mno-red-zone -Wall -Wextra -fno-exceptions -fno-rtti -ftree-vectorize -funroll-loops -mno-avx -std=c++2a $(addprefix -I, $(INCLUDE_DIRS))
ASM_FLAGS:=-w all -f elf64 $(addprefix -I, $(INCLUDE_DIRS))

OBJ_CXX:=$(addprefix $(BUILD_DIR)/, $(SRC_CXX:.cpp=.o))
OBJ_ASM:=$(addprefix $(BUILD_DIR)/, $(SRC_ASM:.asm=.o))
OBJ:=$(OBJ_CXX) $(OBJ_ASM)

LINK_FLAGS:=-n -T $(LINKER_SCRIPT) -flto
BIN:=$(BUILD_DIR)/kernel.bin


all: $(BIN)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.asm $(HEADERS_ASM) | $(BUILD_DIR) 
	@mkdir -p $(@D)
	$(ASM) $(ASM_FLAGS) $< -o $@

$(BUILD_DIR)/%.o: %.cpp $(HEADERS_CXX) | $(BUILD_DIR) 
	@mkdir -p $(@D)
	$(CXX) $(CXX_FLAGS) -c $< -o $@

$(BIN): $(OBJ)
	x86_64-elf-ld -o $(BIN) $(OBJ) $(LINK_FLAGS)
