# Claude Code Context for Heidelberg Catechism Posters

This document provides context for continuing development of the Heidelberg Catechism illuminated manuscript-style poster project with Claude Code.

## Project Overview

This project creates beautiful, illuminated manuscript-style posters of the Heidelberg Catechism (1563) using LaTeX with XeLaTeX for OpenType font support. The catechism is divided into three parts:

1. **Guilt** (Part 1): Questions 1-11, Lord's Days I-IV - "Of Man's Misery"
2. **Grace** (Part 2): Questions 12-85, Lord's Days V-XXXI - "Of Man's Redemption"
3. **Gratitude** (Part 3): Questions 86-129, Lord's Days XXXII-LII - "Of Thankfulness"

## Project Structure

```
Heidelberg-Catechism/
├── Makefile                    # Build system
├── content/                    # Catechism text content files
│   ├── guilt.tex              # Q1-11 (11 questions)
│   ├── grace-1.tex through grace-7.tex  # Original Grace splits
│   ├── grace-part-a.tex through grace-part-d.tex  # Balanced 24x36" splits
│   └── gratitude-1.tex through gratitude-4.tex
├── posters/                    # Poster source files
│   ├── poster-guilt.tex       # 18x24" Guilt poster
│   ├── poster-grace-*.tex     # 18x24" Grace posters (7 files)
│   ├── poster-gratitude-*.tex # 18x24" Gratitude posters (4 files)
│   ├── experiments/           # Typography experiments
│   │   └── poster-guilt-v1-v5 # Part title font variations
│   └── large/                 # 24x36" large format posters
│       ├── poster-guilt-24x36.tex
│       ├── poster-grace-a-24x36.tex through d
│       └── poster-gratitude-a-24x36.tex through b
├── styles/                     # LaTeX style packages
│   ├── colors.sty             # Color definitions
│   ├── typography.sty         # Fonts and text macros
│   └── ornamental-borders.sty # Decorative borders
└── output/                     # Compiled PDFs (git-ignored)
```

## Key Technical Details

### Fonts Used
- **Title font**: Harbour Decor (decorative display)
- **Title shadow**: Harbour Rough
- **Body text**: EB Garamond (with OldStyle numbers)
- **Headers**: EB Garamond Small Caps
- **Drop caps**: EB Garamond Initials

Font paths reference Adobe Creative Cloud fonts at:
`/Users/micahcooper/Library/Application Support/Adobe/CoreSync/plugins/livetype/.r/`

### Color Scheme
- **Guilt (Part 1)**: Burgundy (`guiltprimary`)
- **Grace (Part 2)**: Ultramarine blue (`graceprimary`)
- **Gratitude (Part 3)**: Forest green (`gratitudeprimary`)
- **Accents**: Gold, parchment background

### Poster Formats
1. **18x24"** - Standard format, 7 Grace + 4 Gratitude + 1 Guilt = 12 posters
2. **24x36"** - Large format, 4 Grace + 2 Gratitude + 1 Guilt = 7 posters

### Key Macros (styles/typography.sty)
- `\lordsday{N}` - Lord's Day header with Roman numeral
- `\catechismqa{N}{question}{answer}` - Question/answer formatting
- `\fleuron[color]` - Small decorative ornament

### Border Commands (styles/ornamental-borders.sty)
- `\illuminatedborder[color]` - Full border with side lines
- `\illuminatedborderlarge[color]` - Border without side lines
- `\illuminatedborderlargenobottom[color]` - No bottom flourish (for dense content)

## Build Commands

```bash
make all          # Build all 18x24" posters
make large        # Build all 24x36" posters
make experiments  # Build typography experiment posters
make clean        # Remove output files
make guilt        # Build just the Guilt poster
make grace        # Build all Grace posters
make gratitude    # Build all Gratitude posters
```

## Current State

### Completed
- All 18x24" posters (12 total)
- All 24x36" posters (7 total)
- Typography experiments (5 variations of Part title)
- Part title updated to Harbour Decor font (matching main title)
- Balanced content distribution for 24x36" Grace posters
- Border variants for different content densities

### Known Issues / Future Work
- Grace-d (24x36") uses tighter spacing and no bottom border due to content density
- The `\samepage` environment in `\catechismqa` doesn't fully prevent column breaks in multicol
- Some content files have `\columnbreak` for manual layout control

## Styling Decisions Made

1. **Part Title Font**: Changed from EB Garamond small caps to Harbour Decor to match main title
2. **Footer Layout**: Gold ornament above "Composed at Heidelberg / ANNO DOMINI MDLXIII" text
3. **Large Format**: No vertical side lines, wider margins
4. **Content Balance**: 24x36" Grace posters split as:
   - Part A: Q12-30 (19 questions)
   - Part B: Q31-49 (19 questions)
   - Part C: Q50-68 (19 questions)
   - Part D: Q69-85 (17 questions)

## How to Continue Development

### Adding New Poster Formats
1. Copy an existing poster file as template
2. Adjust geometry settings for new paper size
3. Adjust `\setstretch` and `\parskip` to fit content
4. Test compile and iterate on spacing

### Modifying Typography
1. Edit `styles/typography.sty` for global changes
2. Font definitions use fontspec with explicit paths
3. The `\catechismqa` macro controls Q&A formatting

### Adding New Border Styles
1. Add new commands to `styles/ornamental-borders.sty`
2. Use pgfornament package - see http://altermundus.fr/pages/tkz.html for ornament catalog
3. Common ornaments: 61 (corners), 75 (horizontal bars), 80 (dividers), 4 (fleurons)

## Interaction History Summary

Key requests and decisions from development:
1. Created illuminated manuscript-style posters with ornamental borders
2. Expanded from single posters to multiple per section for readability
3. Created 24x36" large format variants with consolidated content
4. Experimented with 5 typography options for Part title, selected Harbour Decor
5. Balanced content distribution across Grace posters for 24x36" format
6. Added border variant without bottom flourish for dense content (Grace-d)
7. Footer text positioned above gold ornament, with space below to clear border

## Tips for Claude Code Users

1. **Always compile after changes** - Use `xelatex -output-directory=output <file>.tex`
2. **Check page count** - Look for "Output written on ... (N pages)" in compile output
3. **Iterate on spacing** - Adjust `\setstretch`, `\parskip`, margins to fit content
4. **Test with `make`** - The Makefile handles all dependencies correctly
5. **Preview PDFs** - Use `open output/<file>.pdf` on macOS
