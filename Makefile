# Makefile for Heidelberg Catechism Illuminated Posters

LATEX = xelatex
LATEXFLAGS = -interaction=nonstopmode -output-directory=output

# Poster targets
POSTERS = poster-guilt poster-grace-1 poster-grace-2 poster-grace-3 poster-grace-4 poster-grace-5 poster-grace-6 poster-grace-7 poster-gratitude-1 poster-gratitude-2
OUTPUTS = $(addprefix output/,$(addsuffix .pdf,$(POSTERS)))

.PHONY: all clean guilt grace grace-1 grace-2 grace-3 grace-4 grace-5 grace-6 grace-7 gratitude gratitude-1 gratitude-2 setup

# Default target: build all posters
all: setup $(OUTPUTS)

# Create output directory
setup:
	@mkdir -p output

# Individual poster targets
guilt: setup output/poster-guilt.pdf
grace: grace-1 grace-2 grace-3 grace-4 grace-5 grace-6 grace-7
grace-1: setup output/poster-grace-1.pdf
grace-2: setup output/poster-grace-2.pdf
grace-3: setup output/poster-grace-3.pdf
grace-4: setup output/poster-grace-4.pdf
grace-5: setup output/poster-grace-5.pdf
grace-6: setup output/poster-grace-6.pdf
grace-7: setup output/poster-grace-7.pdf
gratitude: gratitude-1 gratitude-2
gratitude-1: setup output/poster-gratitude-1.pdf
gratitude-2: setup output/poster-gratitude-2.pdf

# Guilt poster (Part 1: Of Man's Misery, Q1-11)
output/poster-guilt.pdf: posters/poster-guilt.tex content/guilt.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-guilt.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-guilt.tex

# Grace poster 1 (Part 2a: The Mediator, Q12-23)
output/poster-grace-1.pdf: posters/poster-grace-1.tex content/grace-1.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-1.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-1.tex

# Grace poster 2 (Part 2b: Trinity and Father, Q24-36)
output/poster-grace-2.pdf: posters/poster-grace-2.tex content/grace-2.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-2.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-2.tex

# Grace poster 3 (Part 2c: Christ's Suffering and Death, Q37-45)
output/poster-grace-3.pdf: posters/poster-grace-3.tex content/grace-3.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-3.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-3.tex

# Grace poster 4 (Part 2d: Christ's Ascension and Glory, Q46-56)
output/poster-grace-4.pdf: posters/poster-grace-4.tex content/grace-4.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-4.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-4.tex

# Grace poster 5 (Part 2e: Justification and Sacraments, Q57-68)
output/poster-grace-5.pdf: posters/poster-grace-5.tex content/grace-5.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-5.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-5.tex

# Grace poster 6 (Part 2f: Baptism, Q69-77)
output/poster-grace-6.pdf: posters/poster-grace-6.tex content/grace-6.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-6.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-6.tex

# Grace poster 7 (Part 2g: Lord's Supper and Keys, Q78-85)
output/poster-grace-7.pdf: posters/poster-grace-7.tex content/grace-7.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-7.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-7.tex

# Gratitude poster 1 (Part 3a: Good Works and The Law, Q86-107)
output/poster-gratitude-1.pdf: posters/poster-gratitude-1.tex content/gratitude-1.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-gratitude-1.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-gratitude-1.tex

# Gratitude poster 2 (Part 3b: The Law and Prayer, Q108-129)
output/poster-gratitude-2.pdf: posters/poster-gratitude-2.tex content/gratitude-2.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-gratitude-2.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-gratitude-2.tex

# Clean auxiliary files
clean:
	rm -rf output/*.aux output/*.log output/*.out output/*.synctex.gz

# Clean everything including PDFs
distclean: clean
	rm -rf output/*.pdf

# Help target
help:
	@echo "Heidelberg Catechism Illuminated Posters"
	@echo ""
	@echo "Targets:"
	@echo "  all          - Build all ten posters"
	@echo "  guilt        - Build Guilt poster (Q1-11)"
	@echo "  grace        - Build all seven Grace posters"
	@echo "  grace-1      - Build Grace poster 1 (Q12-23, The Mediator)"
	@echo "  grace-2      - Build Grace poster 2 (Q24-36, Trinity/Father)"
	@echo "  grace-3      - Build Grace poster 3 (Q37-45, Suffering/Death)"
	@echo "  grace-4      - Build Grace poster 4 (Q46-56, Ascension/Glory)"
	@echo "  grace-5      - Build Grace poster 5 (Q57-68, Justification/Sacraments)"
	@echo "  grace-6      - Build Grace poster 6 (Q69-77, Baptism)"
	@echo "  grace-7      - Build Grace poster 7 (Q78-85, Lord's Supper/Keys)"
	@echo "  gratitude    - Build both Gratitude posters"
	@echo "  gratitude-1  - Build Gratitude poster 1 (Q86-107, Good Works/Law)"
	@echo "  gratitude-2  - Build Gratitude poster 2 (Q108-129, Law/Prayer)"
	@echo "  clean        - Remove auxiliary files"
	@echo "  distclean    - Remove all generated files"
	@echo "  help         - Show this help message"
