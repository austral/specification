BUILD    := build
TMP0     := $(BUILD)/tmp0.md
TMP1     := $(BUILD)/tmp1.md
HTML_OUT := $(BUILD)/spec.html
PDF_OUT  := $(BUILD)/spec.pdf

PANDOC_FLAGS := --standalone --smart --table-of-contents --variable urlcolor=cyan

MACROS := macros.m4
SOURCES := $(addprefix src/, $(shell cat sources.list))

.DEFAULT_GOAL := all

$(BUILD):
	mkdir -p $(BUILD)

# We have a three staged compilation process: cat the macros.m4 file and all
# source files together, run m4 on it, and run pandoc.
$(TMP0): $(SOURCES)
	cat $(MACROS) $(SOURCES) > $@

$(TMP1): $(TMP0)
	m4 $^ > $@

$(HTML_OUT): $(TMP1)
	pandoc $(TMP1) -f markdown -t html $(PANDOC_FLAGS) -o $@

$(PDF_OUT): $(TMP1)
	pandoc $(TMP1) -f markdown -t latex --latex-engine=xelatex $(PANDOC_FLAGS) -o $@

all: $(BUILD) $(HTML_OUT) $(PDF_OUT)

clean:
	rm -rf $(BUILD)
