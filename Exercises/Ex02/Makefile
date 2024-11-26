# Makefile for Hello World in NASM

# This is the target executable name
TARGET = demo

# Source and object files
ASM_SOURCE = demo.asm
OBJ_FILE = demo.o

# Assembler and linker flags
ASM_FLAGS = -f elf32
LD_FLAGS = -m elf_i386

# Default rule
all: $(TARGET)

# Rule to link the program
$(TARGET): $(OBJ_FILE)
	ld $(LD_FLAGS) -o $(TARGET) $(OBJ_FILE)

# Rule to assemble the program
$(OBJ_FILE): $(ASM_SOURCE)
	nasm $(ASM_FLAGS) $(ASM_SOURCE) -o $(OBJ_FILE)

# Rule to clean the workspace
clean:
	rm -f $(OBJ_FILE) $(TARGET)

.PHONY: all clean
