BUILD    := build
TMP0     := $(BUILD)/tmp0.md
TMP1     := $(BUILD)/tmp1.md
HTML_OUT := $(BUILD)/spec.html
PDF_OUT  := $(BUILD)/spec.pdf

PANDOC_FLAGS := --standalone --smart --table-of-contents --variable urlcolor=cyan

MACROS := macros.m4
SOURCES := src/book.md \
           src/intro.md \
	   src/syntax.md \
	   src/compilation.md \
	   src/types.md \
	   src/functions.md \
	   src/memory.md \
	   src/modules.md \
	   src/effects.md \
	   src/ref/intro.md \
	   src/ref/flow.md \
	   src/ref/binding.md \
	   src/ref/boolean.md \
	   src/ref/equality.md \
	   src/ref/order.md \
	   src/ref/math-modular.md \
	   src/ref/math-checked.md \
	   src/ref/math-saturation.md \
	   src/ref/math-float.md \
	   src/ref/bitwise.md \
	   src/ref/functions.md \
	   src/ref/types.md \
	   src/ref/macros.md \
	   src/ref/modules.md \
	   src/ref/tuples.md \
	   src/ref/disjunctions.md \
	   src/ref/memory.md \
	   src/ref/effects.md \
	   src/ref/features.md \
	   src/documentation.md \
	   src/glossary.md \
	   src/exported.md

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
	pandoc $(TMP1) -f markdown -t latex --latex-engine=xelatex $(PANDOC_FLAGS) \
		-V papersize=a4 \
		-V documentclass=book \
		-o $@

all: $(BUILD) $(HTML_OUT) $(PDF_OUT)

clean:
	rm -rf $(BUILD)
