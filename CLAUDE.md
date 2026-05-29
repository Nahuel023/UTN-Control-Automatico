# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a university course materials repository for **Control Automático** (Automatic Control) at UTN Facultad Regional — Ingeniería en Energía Eléctrica. It is used for creating course documents, assignments, and notes using LaTeX. Reference textbooks are stored here as PDFs.

**Author:** Ing. Nahuel Medina

## Conventions de contenido

- **Extensión objetivo por capítulo: 10–15 páginas** (sin contar figuras). Las figuras pueden sumar páginas adicionales. Capítulos que requieran más profundidad deben usar **Notas de Capítulo** (`\section*{Notas}`) o **apéndices** en `appendix/`.
- Priorizar claridad y densidad conceptual sobre extensión. Remitir a bibliografía para demostraciones exhaustivas.
- Cada capítulo puede referenciar apéndices adicionales para derivaciones largas, tablas de transformadas, etc.

## LaTeX Workflow

Documents are written in LaTeX and compiled to PDF. Use `latexmk` for compilation (it handles multiple passes automatically):

```powershell
# Compile a .tex file to PDF
latexmk -pdf <filename>.tex

# Compile with continuous watch mode
latexmk -pdf -pvc <filename>.tex

# Clean auxiliary files
latexmk -C <filename>.tex
```

Auxiliary files generated during compilation: `.aux`, `.log`, `.fls`, `.fdb_latexmk`, `.synctex.gz` — these can be ignored or cleaned.

## Course Topics

The course covers (in order):

1. **Transfer functions** — signal graphs, block diagrams
2. **Real implementation** — physical systems modeling
3. **Steady-state regime** — reference input, disturbance/load response
4. **Stability** — Routh-Hurwitz criterion, Bode diagrams, frequency-domain representation
5. **Compensation** — cascade and feedback compensation design
6. **State space** — state variables representation, state matrix, transfer function from state equations, reachability and controllability
7. **PLC programming** — simple control systems on PLCs
8. **Simulation** — MATLAB/Simulink for system analysis

## Available Reference Textbooks (local PDFs)

- `ingenieria-de-control-moderna-ogata-5ed.pdf` — Ogata, Modern Control Engineering (5th ed.) — **referencia principal**
- `Ingeniería de Control - Bolton.pdf` — Bolton, Ingeniería de Control — referencia complementaria

## Bibliography (`bibliography/references.bib`)

The `.bib` file contains entries for: Ogata, Bolton, Nise, Franklin/Powell, Åström/Wittenmark, Dorf/Bishop, Kuo, D'Azzo/Houpis, Shinners, Chesmond, Oppenheim (señales), MATLAB toolbox. Cite with `\cite{key}`. Add new entries when introducing new sources in a chapter.
