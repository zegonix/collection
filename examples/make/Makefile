# Makefile for Nucleo-L552ZE-Q test project

SHELL := /usr/bin/env bash

# directories
BUILD_DIR := ./build
OBJ_DIR   := $(BUILD_DIR)/.obj
SRC_DIR   := ./src
INC_DIR   := ./inc

# output
TARGET  := testapp

# include c sources list
C_SOURCES = 
SOURCE_LIST := $(SRC_DIR)/sources.mk
include $(SOURCE_LIST)

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

AS_DEFS  := -DSTM32L552xx
AS_INC   := 
AS_FLAGS := -x assembler-with-cpp $(TARGET_FLAGS) $(AS_DEFS) $(AS_INC) $(OPT) $(DBG_FLAGS) $(COMP_FLAGS)

C_DEFS   := -DSTM32L552xx
C_INC    := -I$(INC_DIR) \
			-I./drivers/CMSIS/Device/ST/STM32L5xx/Include \
			-I./drivers/CMSIS/Include
C_FLAGS  := $(TARGET_FLAGS) $(C_DEFS) $(C_INC) $(OPT) $(DBG_FLAGS) $(COMP_FLAGS)

LIBS      := -lc -lm -lnosys
LD_SCRIPT := STM32L552xE_FLASH.ld
LD_FLAGS  := $(TARGET_FLAGS) -T$(LD_SCRIPT) $(LIB_DIR) $(LIBS) -Wl,--gc-sections

# object files
OBJECTS := $(addprefix $(OBJ_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
OBJECTS += $(addprefix $(OBJ_DIR)/,$(notdir $(AS_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(AS_SOURCES)))

# rules
.PHONY: all clean test

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
	@mkdir $@

clean: | $(OBJ_DIR)
	@rm -rf $(BUILD_DIR)/*
	@echo "output files deleted"

test:
	@echo "$(AS_SOURCES)"
	@echo "$(C_SOURCES)"
	@echo "$(OBJECTS)"
