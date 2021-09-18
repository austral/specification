SOURCES := spec.md \
           src/0.introduction.md \
           src/rationale/0.rationale.md \
           src/rationale/1.syntax.md \
           src/rationale/2.error-handling.md \
           src/rationale/3.resource-types.md \
           src/2.syntax.md \
	   src/3.modules.md \
	   src/4.types.md \
	   src/5.declarations.md \
	   src/6.statements.md \
	   src/7.expressions.md \
	   src/8.examples.md \
	   src/9.style.md \
	   src/appendix-a.md

spec.pdf: $(SOURCES)
	pandoc $(SOURCES) -t latex --toc -o spec.pdf

clean:
	rm spec.pdf
