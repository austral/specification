BUILD    := build
HTML     := $(BUILD)/spec.html
PDF      := $(BUILD)/spec.pdf

PANDOC_FLAGS := --standalone --smart --table-of-contents

SOURCE_LIST := $(addprefix src/, $(shell cat sources.list))

.DEFAULT_GOAL := all


$(BUILD):
	mkdir -p $(BUILD)

$(HTML): $(BUILD) $(SOURCE_LIST)
	pandoc $(SOURCE_LIST) -f markdown -t html $(PANDOC_FLAGS) -o $(HTML)

$(PDF): $(BUILD) $(SOURCE_LIST)
	pandoc $(SOURCE_LIST) -f markdown -t latex --latex-engine=xelatex $(PANDOC_FLAGS) -o $(PDF)

html: $(HTML)

pdf: $(PDF)

all: html

clean:
	rm -rf $(BUILD)
