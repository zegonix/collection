
OUT_DIR = ./output
SRC_FILES = $(wildcard *.md)
OUT_FILES = $(SRC_FILES:.md=.pdf)
TARGETS   = $(SRC_FILES:.md=)

PANDOC_OPT = --standalone

.PHONY: all clean test

all: $(TARGETS)

clean:
	rm -f $(OUT_DIR)/*

$(TARGETS): %: $(OUT_DIR)/%.pdf

$(OUT_DIR)/%.pdf: %.md
	pandoc $(PANDOC_OPT) $^ -o $@

