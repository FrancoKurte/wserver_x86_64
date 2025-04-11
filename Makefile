# Makefile for wsrv project

# Directories
SRC_DIR := src
BUILD_DIR := build
INCLUDE_DIR := include

# Output executable
EXEC := $(BUILD_DIR)/wsrv

# Tools
ASM := nasm
LD := ld
ASMFLAGS := -f elf64
LDFLAGS :=

# Find all .s and .asm files recursively in src/
SOURCES := $(shell find $(SRC_DIR) -type f \( -name "*.s" -o -name "*.asm" \))
# Generate object file paths in build/, preserving directory structure
OBJECTS := $(patsubst $(SRC_DIR)/%.s,$(BUILD_DIR)/%.o,$(patsubst $(SRC_DIR)/%.asm,$(BUILD_DIR)/%.o,$(SOURCES)))

# Include files for dependency tracking
INCLUDES := $(wildcard $(INCLUDE_DIR)/*.inc)

# Default target
all: $(EXEC)

# Link object files into executable
$(EXEC): $(OBJECTS)
	@mkdir -p $(@D)
	$(LD) $(LDFLAGS) -o $@ $^

# Compile .s and .asm files to .o
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(@D)
	$(ASM) $(ASMFLAGS) -I$(INCLUDE_DIR) -o $@ $<

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.asm
	@mkdir -p $(@D)
	$(ASM) $(ASMFLAGS) -I$(INCLUDE_DIR) -o $@ $<

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Rebuild everything
rebuild: clean all

# Phony targets
.PHONY: all clean rebuild
