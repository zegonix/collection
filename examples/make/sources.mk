
AS_FILES := ./startup_stm32l552xx.s
C_FILES  := ./main.c
C_FILES  += ./system_stm32l5xx.c
C_FILES  += ./sysmem.c
C_FILES  += ./syscalls.c

# determine path and prefix sources
SRC_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
SRC_PATH := $(notdir $(patsubst %/,%,$(dir $(SRC_PATH))))

AS_SOURCES += $(addprefix $(SRC_PATH)/,$(notdir $(AS_FILES)))
C_SOURCES  += $(addprefix $(SRC_PATH)/,$(notdir $(C_FILES)))
