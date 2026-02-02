# Heidelberg Catechism Illuminated Posters

Beautiful, illuminated manuscript-style posters of the Heidelberg Catechism (1563) created with LaTeX.

![Sample](https://img.shields.io/badge/Format-18x24%22%20%26%2024x36%22-blue)
![LaTeX](https://img.shields.io/badge/Engine-XeLaTeX-green)

## Overview

This project produces printable posters of the complete Heidelberg Catechism in an elegant, historical style featuring:

- Decorative ornamental borders using pgfornament
- Historical typefaces (EB Garamond, Harbour Decor)
- Color-coded sections (Burgundy, Ultramarine, Forest Green)
- Parchment-colored backgrounds
- Gold accent elements

The catechism is organized into three parts:
1. **Of Man's Misery** (Guilt) - Questions 1-11
2. **Of Man's Redemption** (Grace) - Questions 12-85
3. **Of Thankfulness** (Gratitude) - Questions 86-129

## Poster Formats

### 18x24" Standard Format (12 posters)
- 1 Guilt poster
- 7 Grace posters
- 4 Gratitude posters

### 24x36" Large Format (7 posters)
- 1 Guilt poster
- 4 Grace posters (balanced ~18-19 questions each)
- 2 Gratitude posters

## Requirements

- **TeX Distribution**: TeX Live 2024+ or MacTeX
- **Engine**: XeLaTeX (required for OpenType fonts)
- **Fonts**:
  - EB Garamond (available via Adobe Fonts or Google Fonts)
  - Harbour Decor / Harbour Rough (Adobe Fonts)
- **Packages**: fontspec, microtype, tikz, pgfornament, multicol, geometry

## Building

```bash
# Build all 18x24" posters
make all

# Build all 24x36" large format posters
make large

# Build specific sections
make guilt
make grace
make gratitude

# Build typography experiments
make experiments

# Clean output
make clean
```

Compiled PDFs are placed in the `output/` directory.

## Project Structure

```
├── Makefile              # Build system
├── content/              # Catechism text (question/answer content)
├── posters/              # Poster source files
│   ├── experiments/      # Typography experiments
│   └── large/            # 24x36" format posters
├── styles/               # LaTeX style packages
│   ├── colors.sty        # Color definitions
│   ├── typography.sty    # Font and macro definitions
│   └── ornamental-borders.sty  # Decorative borders
└── output/               # Compiled PDFs (git-ignored)
```

## Customization

### Colors
Edit `styles/colors.sty` to change the color scheme. Each section has primary and secondary colors.

### Typography
Edit `styles/typography.sty` to modify fonts, the Q&A macro, or Lord's Day headers.

### Borders
Edit `styles/ornamental-borders.sty` to create new border styles. See the [pgfornament documentation](http://altermundus.fr/pages/tkz.html) for available ornaments.

## For Claude Code Users

This project was developed with Claude Code. To continue development:

1. Read `CLAUDE_CONTEXT.md` for full project context and history
2. The context file includes:
   - Technical details about fonts, colors, and macros
   - Styling decisions and rationale
   - Known issues and future work
   - Tips for iterating on poster layouts

Example prompt to continue:
> "Continue working on the Heidelberg Catechism posters. Read CLAUDE_CONTEXT.md for project context."

## Text Source

The catechism text is from Philip Schaff's 1877 English translation (public domain).

## License

The catechism text is in the public domain. The LaTeX code and styling in this repository is available under the MIT License.

---

*Composed at Heidelberg, Anno Domini MDLXIII*
