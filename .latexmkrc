# .latexmkrc
# Configuración de latexmk para el proyecto Control Automático — UTN IEE
# Ejecutar con: latexmk -pdf -shell-escape main.tex

# Motor de compilación: pdflatex con shell-escape (necesario para minted)
$pdflatex = 'pdflatex -shell-escape -interaction=nonstopmode -file-line-error %O %S';

# Usar biber como backend bibliográfico (biblatex)
$biber = 'biber %O %B';

# Modo de compilación: PDF directo
$pdf_mode = 1;

# No generar DVI ni PS
$dvi_mode = 0;
$ps_mode  = 0;

# Archivos auxiliares a limpiar con latexmk -C
$clean_ext = 'acn acr alg bbl bcf blg brf fdb_latexmk fls glg glo gls ' .
             'idx ilg ind ist lof lot mw nav out run.xml snm synctex.gz ' .
             'toc vrb xdy _minted-%R';

# Ejecutar latexmk con -pdf desde el directorio del proyecto
ensure_path('TEXINPUTS', './styles//');
