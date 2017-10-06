BUILD    := build
TMP0     := $(BUILD)/source0.md
TMP      := $(BUILD)/source.md
HTML     := $(BUILD)/spec.html
PDF      := $(BUILD)/spec.pdf

FILTER   := $(shell awk -f script.awk abbrevs.txt)

PANDOC_FLAGS := --standalone --smart --table-of-contents --variable urlcolor=cyan

SOURCE_LIST := $(addprefix src/, $(shell cat sources.list))

.DEFAULT_GOAL := all


$(BUILD):
	mkdir -p $(BUILD)

$(TMP0): $(SOURCE_LIST)
	sed -s '$$G' $(SOURCE_LIST) > $(TMP0)

$(TMP): $(TMP0)
	cat $(TMP0) $(FILTER) > $(TMP)

$(HTML): $(BUILD) $(TMP)
	pandoc $(TMP) -f markdown -t html $(PANDOC_FLAGS) -o $(HTML)

$(PDF): $(BUILD) $(TMP)
	pandoc $(TMP) -f markdown -t latex --latex-engine=xelatex $(PANDOC_FLAGS) -o $(PDF)

html: $(HTML)

pdf: $(PDF)

all: html

clean:
	rm -rf $(BUILD)
