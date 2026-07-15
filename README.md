# NUSPaper Overleaf Template

Unofficial NUS-flavoured LaTeX preprint template. This is not an official NUS template.

## Overleaf

1. Upload this folder, or upload `nuspaper-overleaf-clean.zip` as a new Overleaf project.
2. Set the main file to `main.tex`.
3. Use pdfLaTeX for the closest match to the preview design.
4. Compile.

## Main Files

- `main.tex`: example manuscript
- `nuspaper.cls`: template class
- `refs.bib`: example bibliography
- `sections/`: example paper sections
- `assets/`: NUS horizontal logo assets used by the first-page masthead

## Common Edits

```tex
\documentclass[yellowtitle]{nuspaper}
\documentclass[bluetitle]{nuspaper}
\documentclass[anonymous,review]{nuspaper}
```

```tex
\setlength{\NUSBrandLogoWidth}{16mm}
\setlength{\NUSStampX}{15pt}
\setlength{\NUSStampY}{250pt}
```

If you do not want keywords, omit `\keywords{...}`. The first `\section` will close the first-page front matter automatically.
