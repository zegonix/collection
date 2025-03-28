# Makefile for Nucleo-H563ZI test project

SHELL := /usr/bin/env bash

# directories
BUILD_DIR  := ./build
OBJ_DIR    := $(BUILD_DIR)/.obj
SRC_DIR    := ./source
INC_DIR    := ./include
COMMON_DIR := ../common
SYS_DIR    := $(COMMON_DIR)/system-files
STUBS_DIR  := $(COMMON_DIR)/libc-stubs
CMD_DIR    := $(COMMON_DIR)/jlink-commands

# output
TARGET := debounce

# hardware
DEVICE := STM32H573II

# include c sources list
AS_SOURCES := 
C_SOURCES  := 
include ./src.mk

# compiler commands
PREFIX := arm-none-eabi-
CC     := $(PREFIX)gcc
CP     := $(PREFIX)objcopy
SZ     := $(PREFIX)size
HEX    := $(CP) -O ihex
BIN    := $(CP) -O binary -S

# compiler flags
TARGET_FLAGS := -mcpu=cortex-m33 \
			    -mfpu=fpv4-sp-d16 \
			    -mfloat-abi=hard \
			    -specs=nano.specs \
			    -mthumb \
			    -mlittle-endian
COMP_FLAGS   := -Wall -Wextra -fdata-sections -ffunction-sections

OPT   := -Og
DEBUG := 1
ifeq ($(DEBUG), 1)
	DBG_FLAGS := -g
else
	DBG_FLAGS := 
endif

AS_DEFS  := -DSTM32H563xx
AS_INC   := 
AS_FLAGS := -x assembler-with-cpp $(TARGET_FLAGS) $(AS_DEFS) $(AS_INC) $(OPT) $(DBG_FLAGS) $(COMP_FLAGS)

C_DEFS   := -DSTM32H563xx
C_INC    := -I$(INC_DIR) \
			-I$(COMMON_DIR)/CMSIS/Device/ST/STM32H5xx/Include \
			-I$(COMMON_DIR)/CMSIS/Include \
			-I$(COMMON_DIR)/HAL
C_FLAGS  := $(TARGET_FLAGS) $(C_DEFS) $(C_INC) $(OPT) $(DBG_FLAGS) $(COMP_FLAGS)

LIBS      := -lc -lm -lnosys
LD_SCRIPT := $(SYS_DIR)/STM32H563xx_FLASH.ld
LD_FLAGS  := $(TARGET_FLAGS) -T$(LD_SCRIPT) $(LIB_DIR) $(LIBS) -Wl,--gc-sections

# object files
OBJECTS := $(addprefix $(OBJ_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
OBJECTS += $(addprefix $(OBJ_DIR)/,$(notdir $(AS_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(AS_SOURCES)))

# rules
.PHONY: all clean rebuild test

all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

# build objects from c files
$(OBJ_DIR)/%.o: %.c $(SOURCE_LIST) | $(OBJ_DIR)
	$(CC) -c $(C_FLAGS) $< -o $@

# build objects from assembly files
$(OBJ_DIR)/%.o: %.s $(SOURCE_LIST) | $(OBJ_DIR)
	$(CC) -c $(AS_FLAGS) $< -o $@

# build binary file
$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) $(SOURCE_LIST) | $(OBJ_DIR)
	$(CC) $(OBJECTS) $(LD_FLAGS) -o $@
	$(SZ) $@

# generate .hex file
$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(OBJ_DIR)
	$(HEX) $< $@

# generate .bin file
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(OBJ_DIR)
	$(BIN) $< $@

# ensure that the build dir exists
$(OBJ_DIR):
	@mkdir -p $@

clean: | $(OBJ_DIR)
	@rm -rf $(BUILD_DIR)/*.{elf,hex,bin}
	@rm -rf $(OBJ_DIR)/*
	@echo "output files deleted"

flash: all $(BUILD_DIR)/flash.jlink
	JLinkExe -Device $(DEVICE) -NoGui 1 -ExitOnError 1 -CommandFile $(BUILD_DIR)/flash.jlink

# add path to binary to the jlink command file
$(BUILD_DIR)/flash.jlink: $(CMD_DIR)/flash.jlink
	$(shell  cat $(CMD_DIR)/flash.jlink | sed "s|<path-to-binary>|$(BUILD_DIR)/$(TARGET).hex|g" > $(BUILD_DIR)/flash.jlink)

rebuild: clean all

test:
	@echo "assembly source files: $(AS_SOURCES)"
	@echo "c source files: $(C_SOURCES)"
	@echo "object files: $(OBJECTS)"
