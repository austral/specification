BUILD    := build
MARKDOWN := $(BUILD)/source.md
HTML     := $(BUILD)/spec.html

SOURCE_LIST := $(addprefix src/, $(shell cat sources.list))

.DEFAULT_GOAL := all


$(BUILD):
	mkdir -p $(BUILD)

$(MARKDOWN): $(BUILD) $(SOURCE_LIST)
	cat $(SOURCE_LIST) > $(MARKDOWN)

$(HTML): $(MARKDOWN)
	pandoc $(MARKDOWN) -f markdown -t html -s -o $(HTML)

all: $(HTML)

clean:
	rm -rf $(BUILD)
