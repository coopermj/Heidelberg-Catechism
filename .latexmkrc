# .latexmkrc - latexmk configuration for XeLaTeX

# Use XeLaTeX
$pdf_mode = 5;
$xelatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';

# Output directory
$out_dir = 'output';
$aux_dir = 'output';

# Clean up auxiliary files
$clean_ext = 'aux log out synctex.gz fls fdb_latexmk toc lof lot';

# Don't prompt for errors
$pdflatex_silent_switch = '-interaction=batchmode';
