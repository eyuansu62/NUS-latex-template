# NUSPaper Template

An unofficial NUS-flavoured LaTeX template for research preprints, benchmark reports, and lab technical reports.

This is **not** an official NUS template. The bundled first-page masthead keeps `assets/NUS_logo_full-horizontal.jpg`, the horizontal NUS logo from the public NUS identity guideline page:
`https://nus.edu.sg/identity/guidelines/logo-colour-and-background`. The displayed masthead uses `assets/NUS_logo_full-horizontal-tight.png`, a transparent-background derivative generated from that JPG and cropped for cleaner placement on the cover. Follow the university identity rules and your school/lab policy when using the logo.

## What it gives you

- Single-column academic body layout
- A wide first-page cover panel inspired by modern arXiv technical reports
- Centered title block, compact author affiliations, light first-page abstract highlight, keywords, release links, side arXiv stamp, and bottom correspondence note
- A first-page masthead with the horizontal NUS logo, right-aligned date, and horizontal rule
- Running header using `\shorttitle{...}`
- NUS-inspired colour palette: `NUSBlue`, `NUSGold`, `NUSYellow`, `NUSOrange`, white cover background, and soft highlight colours
- Named layout tokens for the cover width, padding, radius, and title spacing
- `booktabs` table defaults and highlight helpers
- Figure/table caption styling
- Theorem, definition, proposition, lemma, remark environments
- Code listing style
- Anonymous, compact, review, cover-density, title-colour, no-stamp, and letterpaper options

## Quick start

```bash
latexmk -pdf main.tex
```

Or upload the folder to Overleaf and compile `main.tex` with pdfLaTeX. The template has XeLaTeX/LuaLaTeX fallbacks, but pdfLaTeX is the canonical path for matching the preview PDF.

To check whether the local TeX install has the required packages:

```bash
make check-deps
```

If you use a minimal TinyTeX install, install the template packages first:

```bash
tlmgr install fancyhdr titlesec preprint caption subcaption multirow enumitem tcolorbox listings xurl cleveref xcharter newtx inconsolata upquote cm-super xpatch xstring mweights carlisle fontaxes oberdiek tex-gyre txfonts
```

For a quick visual check of the first page:

```bash
make preview
```

This writes `build/main.pdf` and `build/preview/page1.png`.

## Minimal manuscript

```tex
\documentclass{nuspaper}

\title{Your Paper Title}
\shorttitle{Short Running Title}
\date{2026-06-15}
\venue{Technical Report}
\version{v1}
\arxivstamp{arXiv:XXXX.XXXXXv1 [cs.LG] 15 Jun 2026}

\author[1,*]{First Author}
\author[1]{Second Author}
\affil[1]{National University of Singapore}

\paperlinks{%
  \ProjectLink{Project Website}{https://example.com}
  \SourceLink{GitHub Repository}{https://github.com/example/repo}
}
\correspondence{author@example.edu}
\titlefootnote{* Equal contribution.}

\begin{document}
\maketitle

\begin{abstract}
Your abstract goes here. It appears on the first page, inside a light highlight box within the rounded cover card.
\end{abstract}

\keywords{preprint; LaTeX template; research communication}
% If you do not want keywords, omit \keywords and the first \section
% will close the designed first page automatically. You can also write
% \finishfrontmatter explicitly after the abstract.

\section{Introduction}
Your paper starts here.

\bibliographystyle{plainnat}
\bibliography{refs}
\end{document}
```

## Changing the first-page title colour

The title uses `NUSFrontTitle`, which defaults to the darker `NUSGold` for strong contrast on the white first-page cover.

```tex
% Put this after \documentclass{nuspaper}, before \title{...}
\colorlet{NUSFrontTitle}{NUSBlue}
```

For the brighter yellow title:

```tex
\documentclass[yellowtitle]{nuspaper}
```

To imitate the crimson title in the reference paper:

```tex
\definecolor{ReferenceCrimson}{HTML}{E01843}
\colorlet{NUSFrontTitle}{ReferenceCrimson}
```

To restore or change the cover background card:

```tex
\definecolor{NUSCoverBg}{HTML}{FFF7EA}
```

To change the body section heading colour:

```tex
\colorlet{NUSSectionTitle}{NUSBlue}
```

## Cover layout tokens

The first-page card uses named lengths so the house style can be tuned without editing the title-page implementation:

```tex
\setlength{\NUSCoverGrow}{10mm}      % card grows past the body text width
\setlength{\NUSCoverPadX}{7mm}       % horizontal inner padding
\setlength{\NUSCoverPadTop}{5mm}     % top inner padding
\setlength{\NUSCoverPadBottom}{10mm} % bottom inner padding
\setlength{\NUSCoverRadius}{9pt}     % rounded corner radius
\setlength{\NUSCoverTopSkip}{-18mm}  % move the first-page card toward the top edge
\setlength{\NUSBrandLogoWidth}{20mm} % first-page horizontal logo width
\setlength{\NUSStampX}{15pt}         % vertical stamp x-position from lower-left page corner
\setlength{\NUSStampY}{250pt}        % vertical stamp y-position from lower-left page corner
\renewcommand{\NUSStampFont}{\fontsize{18}{20}\selectfont}
```

## Page geometry

The default A4 layout uses 22 mm left/right margins, giving a body text width of about 166 mm. The `letterpaper` option uses 0.98 in left/right margins for a similar technical-report width.

## Class options

```tex
\documentclass{nuspaper}               % default A4
\documentclass[anonymous]{nuspaper}    % hide author block
\documentclass[review]{nuspaper}       % anonymous, compact, and no stamp
\documentclass[compact]{nuspaper}      % tighter section spacing
\documentclass[tightcover]{nuspaper}   % tighter first-page card
\documentclass[narrowcover]{nuspaper}  % card stays within the body text width
\documentclass[widecover]{nuspaper}    % explicit default wide cover card
\documentclass[goldtitle]{nuspaper}    % explicit default title colour
\documentclass[yellowtitle]{nuspaper}  % brighter yellow title
\documentclass[bluetitle]{nuspaper}    % blue title
\documentclass[nobrand]{nuspaper}      % hide the top NUS text mark
\documentclass[nostamp]{nuspaper}      % hide vertical arXiv-style stamp
\documentclass[letterpaper]{nuspaper}  % US Letter page geometry
```

Options can be combined:

```tex
\documentclass[anonymous,compact,tightcover,nostamp]{nuspaper}
```

## Important commands

| Command | Purpose |
|---|---|
| `\shorttitle{...}` | Running header text after the title page |
| `\brandmark{...}` | Override the first-page top brand mark |
| `\date{...}` | Right-aligned masthead date when branding is enabled |
| `\venue{...}` | First-page venue or report type metadata |
| `\version{...}` | First-page version metadata |
| `\arxivstamp{...}` | Vertical stamp on the first page |
| `\paperlinks{...}` | Project/code/data links on the first page |
| `\FrontLink{Label}{Text}{URL}` | First-page resource link row |
| `\ProjectLink{Text}{URL}` | Project-page shortcut for `\paperlinks{...}` |
| `\DemoLink{Text}{URL}` | Demo-link shortcut for `\paperlinks{...}` |
| `\ArtifactLink{Text}{URL}` | Artifact-link shortcut for `\paperlinks{...}` |
| `\SourceLink{Text}{URL}` | Source-link shortcut for `\paperlinks{...}` |
| `\PaperLink{Name}{URL}` | Simple inline link helper |
| `\correspondence{...}` | Correspondence email printed below the cover card |
| `\titlefootnote{...}` | Contribution/correspondence note at the bottom of the title page |
| `\keywords{...}` | Optional keywords after the abstract; also finishes the designed first page |
| `\finishfrontmatter` | Explicitly finish the designed first page when omitting keywords or starting with custom content |

## Table helpers

```tex
\hlblue{...}
\hlorange{...}
\hlred{...}
```

These wrap content in light cell background colours. They are designed for subtle emphasis rather than loud heatmaps.

## Recommended workflow

Use this template for preprints, arXiv drafts, technical reports, and lab-internal papers. When submitting to a conference or journal, switch to the official venue class and keep only the manuscript body, macros, figures, tables, and bibliography.

## License

MIT. See `LICENSE`.
