# Makefile for Heidelberg Catechism Illuminated Posters

LATEX = xelatex
LATEXFLAGS = -interaction=nonstopmode -output-directory=output

# Poster targets
POSTERS = poster-guilt poster-grace poster-gratitude
OUTPUTS = $(addprefix output/,$(addsuffix .pdf,$(POSTERS)))

.PHONY: all clean guilt grace gratitude setup

# Default target: build all posters
all: setup $(OUTPUTS)

# Create output directory
setup:
	@mkdir -p output

# Individual poster targets
guilt: setup output/poster-guilt.pdf
grace: setup output/poster-grace.pdf
gratitude: setup output/poster-gratitude.pdf

# Guilt poster (Part 1: Of Man's Misery, Q1-11)
output/poster-guilt.pdf: posters/poster-guilt.tex content/guilt.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-guilt.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-guilt.tex

# Grace poster (Part 2: Of Man's Redemption, Q12-85)
output/poster-grace.pdf: posters/poster-grace.tex content/grace.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace.tex

# Gratitude poster (Part 3: Of Thankfulness, Q86-129)
output/poster-gratitude.pdf: posters/poster-gratitude.tex content/gratitude.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-gratitude.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-gratitude.tex

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
	@echo "  all        - Build all three posters"
	@echo "  guilt      - Build Guilt poster (Q1-11)"
	@echo "  grace      - Build Grace poster (Q12-85)"
	@echo "  gratitude  - Build Gratitude poster (Q86-129)"
	@echo "  clean      - Remove auxiliary files"
	@echo "  distclean  - Remove all generated files"
	@echo "  help       - Show this help message"
