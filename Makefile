# Makefile for Heidelberg Catechism Illuminated Posters

LATEX = xelatex
LATEXFLAGS = -interaction=nonstopmode -output-directory=output

# Poster targets
POSTERS = poster-guilt poster-grace-1 poster-grace-2 poster-gratitude
OUTPUTS = $(addprefix output/,$(addsuffix .pdf,$(POSTERS)))

.PHONY: all clean guilt grace grace-1 grace-2 gratitude setup

# Default target: build all posters
all: setup $(OUTPUTS)

# Create output directory
setup:
	@mkdir -p output

# Individual poster targets
guilt: setup output/poster-guilt.pdf
grace: grace-1 grace-2
grace-1: setup output/poster-grace-1.pdf
grace-2: setup output/poster-grace-2.pdf
gratitude: setup output/poster-gratitude.pdf

# Guilt poster (Part 1: Of Man's Misery, Q1-11)
output/poster-guilt.pdf: posters/poster-guilt.tex content/guilt.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-guilt.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-guilt.tex

# Grace poster 1 (Part 2a: God the Son, Q12-52)
output/poster-grace-1.pdf: posters/poster-grace-1.tex content/grace-1.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-1.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-1.tex

# Grace poster 2 (Part 2b: God the Holy Spirit, Q53-85)
output/poster-grace-2.pdf: posters/poster-grace-2.tex content/grace-2.tex styles/*.sty
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-2.tex
	$(LATEX) $(LATEXFLAGS) posters/poster-grace-2.tex

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
	@echo "  all        - Build all four posters"
	@echo "  guilt      - Build Guilt poster (Q1-11)"
	@echo "  grace      - Build both Grace posters"
	@echo "  grace-1    - Build Grace poster 1 (Q12-52, God the Son)"
	@echo "  grace-2    - Build Grace poster 2 (Q53-85, God the Holy Spirit)"
	@echo "  gratitude  - Build Gratitude poster (Q86-129)"
	@echo "  clean      - Remove auxiliary files"
	@echo "  distclean  - Remove all generated files"
	@echo "  help       - Show this help message"
