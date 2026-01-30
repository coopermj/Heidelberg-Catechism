# Makefile for Heidelberg Catechism Illuminated Posters

LATEX = xelatex
LATEXFLAGS = -interaction=nonstopmode -output-directory=output

# Poster targets
POSTERS = poster-guilt poster-grace-1 poster-grace-2 poster-grace-3 poster-gratitude-1 poster-gratitude-2
OUTPUTS = $(addprefix output/,$(addsuffix .pdf,$(POSTERS)))

.PHONY: all clean guilt grace grace-1 grace-2 grace-3 gratitude gratitude-1 gratitude-2 setup

# Default target: build all posters
all: setup $(OUTPUTS)

# Create output directory
setup:
	@mkdir -p output

# Individual poster targets
guilt: setup output/poster-guilt.pdf
grace: grace-1 grace-2 grace-3
grace-1: setup output/poster-grace-1.pdf
grace-2: setup output/poster-grace-2.pdf
grace-3: setup output/poster-grace-3.pdf
gratitude: gratitude-1 gratitude-2
gratitude-1: setup output/poster-gratitude-1.pdf
gratitude-2: setup output/poster-gratitude-2.pdf

# Guilt poster (Part 1: Of Man's Misery, Q1-11)
output/poster-guilt.pdf: posters/poster-guilt.tex content/guilt.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-guilt.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-guilt.tex

# Grace poster 1 (Part 2a: The Mediator, Q12-32)
output/poster-grace-1.pdf: posters/poster-grace-1.tex content/grace-1.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-1.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-1.tex

# Grace poster 2 (Part 2b: Christ's Work, Q33-52)
output/poster-grace-2.pdf: posters/poster-grace-2.tex content/grace-2.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-2.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-2.tex

# Grace poster 3 (Part 2c: Holy Spirit and Sacraments, Q53-85)
output/poster-grace-3.pdf: posters/poster-grace-3.tex content/grace-3.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-3.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-3.tex

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
	@echo "  all          - Build all six posters"
	@echo "  guilt        - Build Guilt poster (Q1-11)"
	@echo "  grace        - Build all three Grace posters"
	@echo "  grace-1      - Build Grace poster 1 (Q12-32, The Mediator)"
	@echo "  grace-2      - Build Grace poster 2 (Q33-52, Christ's Work)"
	@echo "  grace-3      - Build Grace poster 3 (Q53-85, Holy Spirit/Sacraments)"
	@echo "  gratitude    - Build both Gratitude posters"
	@echo "  gratitude-1  - Build Gratitude poster 1 (Q86-107, Good Works/Law)"
	@echo "  gratitude-2  - Build Gratitude poster 2 (Q108-129, Law/Prayer)"
	@echo "  clean        - Remove auxiliary files"
	@echo "  distclean    - Remove all generated files"
	@echo "  help         - Show this help message"
