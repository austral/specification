BUILD    := build
HTML     := $(BUILD)/spec.html

PANDOC_FLAGS := --standalone --smart --table-of-contents

SOURCE_LIST := $(addprefix src/, $(shell cat sources.list))

.DEFAULT_GOAL := all


$(BUILD):
	mkdir -p $(BUILD)

$(HTML): $(BUILD) $(SOURCE_LIST)
	pandoc $(SOURCE_LIST) -f markdown -t html $(PANDOC_FLAGS) -o $(HTML)

all: $(HTML)

clean:
	rm -rf $(BUILD)
