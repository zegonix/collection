
OUT_DIR = ./output
SRC_FILES = $(wildcard *.md)
OUT_FILES = $(SRC_FILES:.md=.pdf)

PANDOC_OPT = --standalone

.PHONY: all clean git test

all: $(OUT_FILES)

clean:
	rm -f $(OUT_DIR)/*

%.pdf: %.md
	pandoc $(PANDOC_OPT) $^ -o $(OUT_DIR)/$@

