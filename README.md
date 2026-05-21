# Apunte de Control Automático — UTN IEE

Apunte universitario completo para la asignatura **Control Automático** de la
carrera Ingeniería en Energía Eléctrica (UTN). Desarrollado en LaTeX con
compilación local (MiKTeX + latexmk) y compatible con Overleaf vía Git Integration.

---

## Compilación

### Comando principal

```bash
latexmk -pdf -shell-escape main.tex
```

> La flag `-shell-escape` es **obligatoria** para que `minted` pueda ejecutar
> Pygments y generar el syntax highlighting del código MATLAB.

### Limpiar archivos auxiliares

```bash
latexmk -C main.tex
```

### Compilación manual paso a paso (sin latexmk)

```bash
pdflatex -shell-escape main.tex
biber main
pdflatex -shell-escape main.tex
pdflatex -shell-escape main.tex
```

---

## Dependencias y requisitos

### LaTeX

- **MiKTeX** (Windows) o **TeX Live** (Linux/macOS) — versión reciente (2022+)
- **Perl** — requerido por `latexmk` (incluido en MiKTeX; en Windows usar
  [Strawberry Perl](https://strawberryperl.com/))
- **Biber** — backend de bibliografía (incluido con biblatex en MiKTeX)

### Python y Pygments (para minted)

```bash
# Verificar Python
python --version   # Requiere Python 3.x

# Instalar Pygments
pip install pygments
```

### Paquetes LaTeX relevantes

Todos se instalan automáticamente con MiKTeX al compilar la primera vez:

| Paquete | Uso |
|---------|-----|
| `tcolorbox` | Todas las cajas pedagógicas (definición, teorema, ejemplo, etc.) |
| `minted` | Código MATLAB con syntax highlighting |
| `biblatex` + `biber` | Bibliografía estilo IEEE |
| `tikz` + `circuitikz` | Diagramas en bloques y circuitos |
| `amsmath`, `mathtools` | Entornos matemáticos |
| `siunitx` | Unidades del SI |
| `hyperref` | Referencias cruzadas navegables |
| `babel` (spanish) | Idioma español |

---

## Estructura de carpetas

```
/
├── main.tex                    ← Documento raíz (compilar este)
├── README.md
├── .gitignore
├── .latexmkrc                  ← Configuración de latexmk
│
├── styles/
│   ├── preamble.sty            ← Todos los paquetes y configuración global
│   ├── boxes.sty               ← Cajas tcolorbox (definicion, ejemplo, etc.)
│   └── commands.sty            ← Comandos matemáticos personalizados
│
├── chapters/
│   ├── _template.tex           ← Plantilla para capítulos nuevos
│   ├── chapter01_introduction.tex
│   └── (chapter02..17 a generar)
│
├── bibliography/
│   └── references.bib          ← Entradas bibliográficas (Ogata, Bolton, etc.)
│
├── figures/                    ← Figuras/imágenes estáticas (.pdf, .png, .jpg)
├── plots/                      ← Gráficos generados por MATLAB
├── matlab/                     ← Scripts .m de cada capítulo
│   └── cap01_introduccion.m
└── appendix/                   ← Apéndices futuros
```

---

## Cómo agregar un capítulo nuevo

1. Copiar la plantilla:
   ```bash
   cp chapters/_template.tex chapters/chapterXX_nombre.tex
   ```

2. Editar el archivo nuevo: reemplazar todos los marcadores `[...]` con
   el contenido real. Seguir la estructura obligatoria de 14 secciones
   definida en el template.

3. Descomentar la línea correspondiente en `main.tex`:
   ```latex
   \include{chapters/chapterXX_nombre}
   ```

4. Compilar con `latexmk -pdf -shell-escape main.tex`.

---

## Cajas pedagógicas disponibles

Definidas en `styles/boxes.sty`:

```latex
\begin{definicion}{Título}  ...  \end{definicion}
\begin{teorema}{Título}     ...  \end{teorema}
\begin{propiedad}{Título}   ...  \end{propiedad}
\begin{ejemplo}{Título}     ...  \end{ejemplo}          % con contador
\begin{ejercicioresuelto}{Título} ... \end{ejercicioresuelto}  % con contador
\begin{observacion}         ...  \end{observacion}
\begin{nota}                ...  \end{nota}
\begin{errorcomon}          ...  \end{errorcomon}
\begin{conceptosclave}      ...  \end{conceptosclave}
\begin{resultado}           ...  \end{resultado}
\begin{aplicacion}          ...  \end{aplicacion}

% Código MATLAB:
\begin{matlabcode}  ...  \end{matlabcode}
\begin{matlabcodetitulo}{Título}  ...  \end{matlabcodetitulo}
```

---

## Overleaf (Git Integration)

Este proyecto es compatible con Overleaf via Git Integration:

1. En Overleaf: **New Project → Import from GitHub** o **Git**.
2. Configurar el compilador en Overleaf: `Settings → Compiler → pdfLaTeX`.
3. Activar `-shell-escape`: en Overleaf, el shell escape está habilitado
   por defecto para `minted`.
4. El archivo principal es `main.tex`.

> **Nota:** Overleaf requiere que `minted` use `\usepackage[cache=false]{minted}`
> en algunos casos. Si hay errores de compilación en Overleaf relacionados
> con minted, agregar `cache=false` en `styles/preamble.sty`.

---

## Capítulos planificados (17 en total)

| # | Archivo | Título | Estado |
|---|---------|--------|--------|
| 1 | `chapter01_introduction.tex` | Introducción a los sistemas de control | ✅ Completo |
| 2 | `chapter02_transfer_functions.tex` | Modelado matemático y función de transferencia | ⬜ Pendiente |
| 3 | `chapter03_block_diagrams.tex` | Diagramas en bloques y grafos de señal | ⬜ Pendiente |
| 4 | `chapter04_temporal_response.tex` | Respuesta temporal de sistemas | ⬜ Pendiente |
| 5 | `chapter05_steady_state_error.tex` | Error en régimen permanente | ⬜ Pendiente |
| 6 | `chapter06_stability.tex` | Estabilidad de sistemas | ⬜ Pendiente |
| 7 | `chapter07_routh_hurwitz.tex` | Criterio de Routh-Hurwitz | ⬜ Pendiente |
| 8 | `chapter08_root_locus.tex` | Lugar geométrico de las raíces | ⬜ Pendiente |
| 9 | `chapter09_frequency_response.tex` | Respuesta en frecuencia | ⬜ Pendiente |
| 10 | `chapter10_bode.tex` | Diagramas de Bode | ⬜ Pendiente |
| 11 | `chapter11_stability_freq.tex` | Criterios de estabilidad en frecuencia | ⬜ Pendiente |
| 12 | `chapter12_compensators.tex` | Compensadores y diseño de control | ⬜ Pendiente |
| 13 | `chapter13_pid.tex` | Controladores PID | ⬜ Pendiente |
| 14 | `chapter14_state_variables.tex` | Variables de estado | ⬜ Pendiente |
| 15 | `chapter15_controllability.tex` | Controlabilidad y observabilidad | ⬜ Pendiente |
| 16 | `chapter16_simulink.tex` | Introducción a Simulink | ⬜ Pendiente |
| 17 | `chapter17_applications.tex` | Aplicaciones reales | ⬜ Pendiente |
