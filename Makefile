BUILD    := build
HTML     := $(BUILD)/spec.html

SOURCE_LIST := $(addprefix src/, $(shell cat sources.list))

.DEFAULT_GOAL := all


$(BUILD):
	mkdir -p $(BUILD)

$(HTML): $(BUILD) $(SOURCE_LIST)
	pandoc $(SOURCE_LIST) -f markdown -t html -s -o $(HTML)

all: $(HTML)

clean:
	rm -rf $(BUILD)
