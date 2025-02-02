
OUTPUT    := output
SINGLE    := $(wildcard *.md)
MULTI     := $(wildcard *.txt)
TARGET_S  := $(SINGLE:.md=)
TARGET_M  := $(MULTI:.txt=)

PANDOC_OPT = --standalone \
-V linkcolor:blue \
-V geometry:a4paper \
-V geometry:margin=2cm \
-V monofont="JetBrainsMono Nerd Font" \
--pdf-engine=xelatex

.PHONY: all clean out_dir test $(DIRECTORIES)

all: $(TARGET_S) $(TARGETS_M)

clean:
	rm -f $(OUTPUT)/*

test:
	@echo "test test :)"
	@echo "$(MULTI)"

$(TARGET_S): out_dir
	@pandoc $(PANDOC_OPT) $@.md -o $(OUTPUT)/$@.pdf

$(TARGET_M): out_dir
	@pandoc $(PANDOC_OPT) $(shell cat $@.txt | xargs) -o $(OUTPUT)/$@.pdf

out_dir:
	@if [[ ! -d $(OUTPUT) ]]; then\
		mkdir $(OUTPUT);\
	fi


