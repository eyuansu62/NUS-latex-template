% nuspaper.cls -- NUS-flavoured preprint / technical report class
% Original template scaffold generated for research preprints. Not an official NUS template.
% Compile with pdfLaTeX. XeLaTeX and LuaLaTeX are supported with matched
% text fonts and a best-effort Unicode math fallback when available.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nuspaper}[2026/06/15 v0.1 NUS-style research preprint class]
\makeatletter

% -----------------------------------------------------------------------------
% Options
% -----------------------------------------------------------------------------
\newif\ifnus@anonymous
\newif\ifnus@compact
\newif\ifnus@letterpaper
\newif\ifnus@draft
\newif\ifnus@showstamp
\newif\ifnus@showbrand
\newif\ifnus@widecover
\newif\ifnus@tightcover
\newif\ifnus@frontmatteropen
\nus@showstamptrue
\nus@showbrandtrue
\nus@widecovertrue
\def\nus@fronttitlecolor{NUSGold}

\DeclareOption{anonymous}{\nus@anonymoustrue}
\DeclareOption{compact}{\nus@compacttrue}
\DeclareOption{letterpaper}{\nus@letterpapertrue}
\DeclareOption{draft}{\nus@drafttrue}
\DeclareOption{nostamp}{\nus@showstampfalse}
\DeclareOption{nobrand}{\nus@showbrandfalse}
\DeclareOption{review}{\nus@anonymoustrue\nus@compacttrue\nus@showstampfalse\nus@showbrandfalse}
\DeclareOption{widecover}{\nus@widecovertrue}
\DeclareOption{narrowcover}{\nus@widecoverfalse}
\DeclareOption{tightcover}{\nus@tightcovertrue}
\DeclareOption{goldtitle}{\def\nus@fronttitlecolor{NUSGold}}
\DeclareOption{yellowtitle}{\def\nus@fronttitlecolor{NUSYellow}}
\DeclareOption{bluetitle}{\def\nus@fronttitlecolor{NUSBlue}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[11pt]{article}

% -----------------------------------------------------------------------------
% Page geometry and core packages
% -----------------------------------------------------------------------------
\RequirePackage{iftex}
\RequirePackage{etoolbox}
\RequirePackage{microtype}
\RequirePackage{geometry}
\ifnus@letterpaper
  \geometry{letterpaper,left=0.98in,right=0.98in,top=0.92in,bottom=1.05in,headheight=14pt,headsep=0.23in}
\else
  \geometry{a4paper,left=22mm,right=22mm,top=24mm,bottom=27mm,headheight=14pt,headsep=6mm}
\fi

\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage{amsmath,amsthm}
  \IfFileExists{XCharter.sty}{%
    \RequirePackage[lining,tabular]{XCharter}%
    \RequirePackage[charter]{newtxmath}%
  }{%
    \IfFileExists{newtxtext.sty}{%
      \RequirePackage{newtxtext,newtxmath}%
    }{%
      \IfFileExists{mathptmx.sty}{%
        \RequirePackage{mathptmx}%
      }{%
        \RequirePackage{lmodern}%
      }%
    }%
  }%
  \IfFileExists{zi4.sty}{%
    \RequirePackage[scaled=0.9]{zi4}%
  }{}%
  % If XCharter is unavailable, fall back to the previous Times-like stack.
\else
  \RequirePackage{amsmath,amsthm}
  \RequirePackage{fontspec}
  \IfFileExists{unicode-math.sty}{%
    \RequirePackage{unicode-math}%
  }{}%
  \IfFileExists{XCharter-Roman.otf}{%
    \setmainfont{XCharter-Roman.otf}[
      BoldFont=XCharter-Bold.otf,
      ItalicFont=XCharter-Italic.otf,
      BoldItalicFont=XCharter-BoldItalic.otf
    ]%
  }{%
    \IfFileExists{texgyretermes-regular.otf}{%
      \setmainfont{texgyretermes-regular.otf}[
        BoldFont=texgyretermes-bold.otf,
        ItalicFont=texgyretermes-italic.otf,
        BoldItalicFont=texgyretermes-bolditalic.otf
      ]%
    }{%
      \setmainfont{lmroman10-regular.otf}[
        BoldFont=lmroman10-bold.otf,
        ItalicFont=lmroman10-italic.otf,
        BoldItalicFont=lmroman10-bolditalic.otf
      ]%
    }%
  }%
  \IfFileExists{texgyreheros-regular.otf}{%
    \setsansfont{texgyreheros-regular.otf}[
      BoldFont=texgyreheros-bold.otf,
      ItalicFont=texgyreheros-italic.otf,
      BoldItalicFont=texgyreheros-bolditalic.otf
    ]%
  }{%
    \setsansfont{lmsans10-regular.otf}[
      BoldFont=lmsans10-bold.otf,
      ItalicFont=lmsans10-oblique.otf,
      BoldItalicFont=lmsans10-boldoblique.otf
    ]%
  }%
  \IfFileExists{Inconsolatazi4-Regular.otf}{%
    \setmonofont{Inconsolatazi4-Regular.otf}[
      BoldFont=Inconsolatazi4-Bold.otf,
      Scale=0.9
    ]%
  }{%
    \setmonofont{lmmono10-regular.otf}[
      ItalicFont=lmmono10-italic.otf
    ]%
  }%
  \@ifpackageloaded{unicode-math}{%
    \IfFileExists{latinmodern-math.otf}{%
      \setmathfont{latinmodern-math.otf}%
    }{}%
  }{}%
\fi

\RequirePackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{authblk}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{enumitem}
\RequirePackage{tcolorbox}
\RequirePackage{listings}
\RequirePackage{xurl}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage[colorlinks=true]{hyperref}
\RequirePackage[nameinlink,noabbrev]{cleveref}

% -----------------------------------------------------------------------------
% House colours
% -----------------------------------------------------------------------------
\definecolor{NUSBlue}{HTML}{003D7C}
\definecolor{NUSOrange}{HTML}{EF7C00}
\definecolor{NUSYellow}{HTML}{F7C948}
\definecolor{NUSGold}{HTML}{C69214}
\definecolor{NUSDeepBlue}{HTML}{002B55}
\definecolor{NUSInk}{HTML}{111111}
\definecolor{NUSMuted}{HTML}{6A6A6A}
\definecolor{NUSRule}{HTML}{4A4A4A}
\definecolor{NUSPaleBlue}{HTML}{EDF5FF}
\definecolor{NUSPaleOrange}{HTML}{FFF1E2}
\definecolor{NUSPaleRed}{HTML}{FBE3E3}
\definecolor{NUSPaleGray}{HTML}{F5F5F5}
\definecolor{NUSCoverBg}{HTML}{FFFFFF}
\definecolor{NUSAbstractBg}{HTML}{F4FAFF}
\definecolor{NUSLinkBlue}{HTML}{1D5FA7}
\colorlet{NUSFrontTitle}{\nus@fronttitlecolor}
\colorlet{NUSSectionTitle}{NUSBlue}
\colorlet{NUSFrontAccent}{NUSOrange}
\colorlet{NUSMastheadRule}{NUSBlue}
\colorlet{nusgold}{NUSGold}
\colorlet{nusyellow}{NUSYellow}
\colorlet{nusblue}{NUSBlue}

\hypersetup{
  linkcolor=NUSOrange,
  citecolor=NUSOrange,
  urlcolor=NUSOrange,
  pdfborder={0 0 0}
}

% -----------------------------------------------------------------------------
% Layout tokens
% -----------------------------------------------------------------------------
\newlength{\NUSCoverGrow}
\newlength{\NUSCoverPadX}
\newlength{\NUSCoverPadTop}
\newlength{\NUSCoverPadBottom}
\newlength{\NUSCoverRadius}
\newlength{\NUSCoverTopSkip}
\newlength{\NUSCoverTitleSkip}
\newlength{\NUSCoverAfterAuthorSkip}
\newlength{\NUSCoverMetaSkip}
\newlength{\NUSMastheadRuleHeight}
\newlength{\NUSMastheadAfterSkip}
\newlength{\NUSStampX}
\newlength{\NUSStampY}

\setlength{\NUSCoverGrow}{10mm}
\setlength{\NUSCoverPadX}{7mm}
\setlength{\NUSCoverPadTop}{5mm}
\setlength{\NUSCoverPadBottom}{10mm}
\setlength{\NUSCoverRadius}{9pt}
\setlength{\NUSCoverTopSkip}{-18mm}
\setlength{\NUSCoverTitleSkip}{1.25em}
\setlength{\NUSCoverAfterAuthorSkip}{1.65em}
\setlength{\NUSCoverMetaSkip}{0.55em}
\setlength{\NUSMastheadRuleHeight}{0.55pt}
\setlength{\NUSMastheadAfterSkip}{0.95em}
\setlength{\NUSStampX}{15pt}
\setlength{\NUSStampY}{250pt}

\ifnus@widecover\else
  \setlength{\NUSCoverGrow}{0pt}
\fi
\ifnus@tightcover
  \setlength{\NUSCoverPadTop}{4mm}
  \setlength{\NUSCoverPadBottom}{8mm}
  \setlength{\NUSCoverTopSkip}{-19mm}
  \setlength{\NUSCoverTitleSkip}{0.9em}
  \setlength{\NUSCoverAfterAuthorSkip}{1.15em}
  \setlength{\NUSMastheadAfterSkip}{0.85em}
\fi

\newcommand{\NUSCoverTitleFont}{\fontsize{24.5}{29.5}\selectfont\bfseries}
\newcommand{\NUSStampFont}{\fontsize{18}{20}\selectfont}
\newlength{\NUSBrandLogoWidth}
\setlength{\NUSBrandLogoWidth}{20mm}
\newcommand{\NUSDefaultBrandMark}{%
  \IfFileExists{assets/NUS_logo_full-horizontal-tight.png}{%
    \includegraphics[width=\NUSBrandLogoWidth]{assets/NUS_logo_full-horizontal-tight.png}%
  }{\IfFileExists{assets/NUS_logo_full-horizontal-transparent.png}{%
    \includegraphics[width=\NUSBrandLogoWidth]{assets/NUS_logo_full-horizontal-transparent.png}%
  }{\IfFileExists{assets/NUS_logo_full-horizontal.jpg}{%
    \includegraphics[width=\NUSBrandLogoWidth,trim=46bp 47bp 45bp 44bp,clip]{assets/NUS_logo_full-horizontal.jpg}%
  }{\IfFileExists{assets/nus-logo-full-horizontal.png}{%
    \includegraphics[width=\NUSBrandLogoWidth]{assets/nus-logo-full-horizontal.png}%
  }{%
    {\sffamily\bfseries\fontsize{18}{19}\selectfont
      {\color{NUSBlue}N}%
      {\color{NUSOrange}U}%
      {\color{NUSBlue}S}}%
  }}}}%
}

% -----------------------------------------------------------------------------
% Metadata commands
% -----------------------------------------------------------------------------
\def\nus@shorttitle{}
\def\nus@paperlinks{}
\def\nus@titlefootnote{}
\def\nus@arxivstamp{}
\def\nus@herofigure{}
\def\nus@preprintnote{Preprint. Not peer reviewed.}
\def\nus@venue{}
\def\nus@version{}
\def\nus@correspondence{}
\def\nus@brandmark{\NUSDefaultBrandMark}

\newcommand{\shorttitle}[1]{\gdef\nus@shorttitle{#1}}
\newcommand{\paperlinks}[1]{\gdef\nus@paperlinks{#1}}
\newcommand{\titlefootnote}[1]{\gdef\nus@titlefootnote{#1}}
\newcommand{\arxivstamp}[1]{\gdef\nus@arxivstamp{#1}}
\newcommand{\preprintnote}[1]{\gdef\nus@preprintnote{#1}}
\newcommand{\venue}[1]{\gdef\nus@venue{#1}}
\newcommand{\version}[1]{\gdef\nus@version{#1}}
\newcommand{\correspondence}[1]{\gdef\nus@correspondence{#1}}
\newcommand{\brandmark}[1]{\gdef\nus@brandmark{#1}}
\long\def\herofigure#1{\gdef\nus@herofigure{#1}}

\newcommand{\PaperLink}[2]{\href{#2}{#1}}
\newcommand{\FrontLink}[3]{\par\noindent{\bfseries #1:}~\href{#3}{#2}}
\newcommand{\ProjectLink}[2]{\FrontLink{Project Page}{#1}{#2}}
\newcommand{\DemoLink}[2]{\FrontLink{Online Demo}{#1}{#2}}
\newcommand{\ArtifactLink}[2]{\FrontLink{Artifacts}{#1}{#2}}
\newcommand{\SourceLink}[2]{\FrontLink{Source Code}{#1}{#2}}
\newcommand{\linksep}{\quad {\color{NUSMuted}|} \quad}
\newcommand{\printfrontmeta}{%
  \ifnus@showbrand
    \ifboolexpr{
      test {\ifstrempty{\nus@venue}}
      and test {\ifstrempty{\nus@version}}
    }{}{%
      \vspace{\NUSCoverMetaSkip}%
      {\small\color{NUSMuted}%
        \ifstrempty{\nus@venue}{}{\nus@venue}%
        \ifstrempty{\nus@version}{}{%
          \ifstrempty{\nus@venue}{}{\linksep}%
          \nus@version
        }%
        \par}%
    }%
  \else
    \ifboolexpr{
      test {\ifstrempty{\nus@venue}}
      and test {\ifstrempty{\nus@version}}
      and test {\ifstrempty{\@date}}
    }{}{%
      \vspace{\NUSCoverMetaSkip}%
      {\small\color{NUSMuted}%
        \ifstrempty{\nus@venue}{}{\nus@venue}%
        \ifstrempty{\nus@version}{}{%
          \ifstrempty{\nus@venue}{}{\linksep}%
          \nus@version
        }%
        \ifstrempty{\@date}{}{%
          \ifboolexpr{
            test {\ifstrempty{\nus@venue}}
            and test {\ifstrempty{\nus@version}}
          }{}{\linksep}%
          \@date
        }%
        \par}%
    }%
  \fi
}
\newcommand{\printmasthead}{%
  \ifnus@showbrand
    \noindent
    \hbox to \linewidth{%
      \vbox{\hbox{\nus@brandmark}}%
      \hfil
      \vbox{\hbox{\raisebox{1.6ex}{\footnotesize\color{NUSMuted}\strut\@date}}}%
    }\par
    \nointerlineskip
    \vspace{4mm}%
    {\color{NUSMastheadRule}\hrule height \NUSMastheadRuleHeight width \linewidth}%
    \vspace{\NUSMastheadAfterSkip}%
  \fi
}
\newcommand{\printpaperlinks}{%
  \ifstrempty{\nus@paperlinks}{}{%
    \vspace{0.75em}%
    {\small\setlength{\parskip}{0.25em}\nus@paperlinks\par}%
  }%
}
\newcommand{\printtitlefootnote}{%
  \ifboolexpr{
    test {\ifstrempty{\nus@titlefootnote}}
    and test {\ifstrempty{\nus@correspondence}}
  }{}{%
    \noindent\rule{\textwidth}{0.45pt}\par
    \ifstrempty{\nus@titlefootnote}{}{%
      {\footnotesize\itshape\nus@titlefootnote\par}%
    }%
    \ifstrempty{\nus@correspondence}{}{%
      {\footnotesize\itshape Correspondence: \href{mailto:\nus@correspondence}{\nus@correspondence}\par}%
    }%
  }%
}
\newcommand{\finishfrontmatter}{%
  \ifnus@frontmatteropen
    \printpaperlinks
    \end{tcolorbox}%
    \vspace{1.0em}%
    \printtitlefootnote
    \clearpage
    \setcounter{page}{2}%
    \global\nus@frontmatteropenfalse
  \fi
}
\newcommand{\keywords}[1]{%
  \par\vspace{0.65em}%
  \ifblank{#1}{}{%
    \noindent\textbf{Keywords:} #1\par
  }%
  \finishfrontmatter
}

% Author block styling
\renewcommand\Authfont{\normalsize\bfseries}
\renewcommand\Affilfont{\small\normalfont}
\setlength{\affilsep}{0.25em}
\renewcommand{\Authands}{, }

% -----------------------------------------------------------------------------
% Header / footer
% -----------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\small\ifstrempty{\nus@shorttitle}{\@title}{\nus@shorttitle}}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[C]{\small\ifstrempty{\nus@shorttitle}{\@title}{\nus@shorttitle}}%
  \fancyfoot[C]{\thepage}%
  \renewcommand{\headrulewidth}{0.4pt}%
}

% -----------------------------------------------------------------------------
% Title page
% -----------------------------------------------------------------------------
\renewcommand{\maketitle}{%
  \thispagestyle{empty}%
  \AddToShipoutPictureFG*{%
    \ifnus@showstamp
      \ifstrempty{\nus@arxivstamp}{}{%
        \AtPageLowerLeft{%
          \put(\strip@pt\NUSStampX,\strip@pt\NUSStampY){\rotatebox{90}{\color{NUSMuted}\NUSStampFont\nus@arxivstamp}}%
        }%
      }%
    \fi
  }%
  \vspace*{\NUSCoverTopSkip}%
  \noindent
  \begin{tcolorbox}[
    grow sidewards by=\NUSCoverGrow,
    colback=NUSCoverBg,
    colframe=NUSCoverBg,
    boxrule=0pt,
    arc=\NUSCoverRadius,
    left=\NUSCoverPadX,
    right=\NUSCoverPadX,
    top=\NUSCoverPadTop,
    bottom=\NUSCoverPadBottom
  ]%
  \global\nus@frontmatteropentrue
  \printmasthead
  \begin{center}
    {\NUSCoverTitleFont\color{NUSFrontTitle}\@title\par}%
    \vspace{\NUSCoverTitleSkip}%
    \ifnus@anonymous
      {\normalsize\bfseries Anonymous Authors\par}%
      \vspace{0.35em}%
      {\small Affiliation withheld for review.\par}%
    \else
      {\@author\par}%
    \fi
    \printfrontmeta
  \end{center}%
  \vspace{\NUSCoverAfterAuthorSkip}%
}

\AtBeginDocument{%
  \pretocmd{\section}{\finishfrontmatter}{}{}%
  \pretocmd{\part}{\finishfrontmatter}{}{}%
  \pretocmd{\appendix}{\finishfrontmatter}{}{}%
  \pretocmd{\bibliography}{\finishfrontmatter}{}{}%
  \AtBeginEnvironment{thebibliography}{\finishfrontmatter}%
}
\AtEndDocument{\finishfrontmatter}

% -----------------------------------------------------------------------------
% Abstract and section typography
% -----------------------------------------------------------------------------
\renewenvironment{abstract}{%
  \par\noindent
  \begin{tcolorbox}[
    colback=NUSAbstractBg,
    colframe=NUSAbstractBg,
    boxrule=0pt,
    arc=6pt,
    left=4.5mm,
    right=4.5mm,
    top=3.5mm,
    bottom=3.5mm
  ]%
  \noindent\ignorespaces
}{%
  \par\end{tcolorbox}%
  \vspace{0.55em}
}

\titleformat{\section}
  {\Large\bfseries\color{NUSSectionTitle}}
  {\thesection.}
  {1.0em}
  {}
\titleformat{\subsection}
  {\large\bfseries\color{NUSSectionTitle}}
  {\thesubsection}
  {0.8em}
  {}
\titleformat{\subsubsection}
  {\normalsize\bfseries\color{NUSSectionTitle}}
  {\thesubsubsection}
  {0.7em}
  {}

\ifnus@compact
  \titlespacing*{\section}{0pt}{1.6ex plus .3ex minus .2ex}{0.7ex}
  \titlespacing*{\subsection}{0pt}{1.2ex plus .2ex minus .2ex}{0.5ex}
\else
  \titlespacing*{\section}{0pt}{2.4ex plus .5ex minus .2ex}{1.0ex}
  \titlespacing*{\subsection}{0pt}{1.8ex plus .4ex minus .2ex}{0.8ex}
\fi

% -----------------------------------------------------------------------------
% Captions, tables, lists
% -----------------------------------------------------------------------------
\captionsetup{
  font=small,
  labelfont=bf,
  labelsep=colon,
  justification=raggedright,
  singlelinecheck=false
}
\captionsetup[figure]{skip=0.55em}
\captionsetup[table]{skip=0.55em}

\setlist[itemize]{topsep=0.35em,itemsep=0.12em,leftmargin=1.4em}
\setlist[enumerate]{topsep=0.35em,itemsep=0.12em,leftmargin=1.6em}

\newcolumntype{Y}{>{\raggedright\arraybackslash}X}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcommand{\hlblue}[1]{\cellcolor{NUSPaleBlue}{#1}}
\newcommand{\hlorange}[1]{\cellcolor{NUSPaleOrange}{#1}}
\newcommand{\hlred}[1]{\cellcolor{NUSPaleRed}{#1}}

% -----------------------------------------------------------------------------
% Theorems and callouts
% -----------------------------------------------------------------------------
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{assumption}[theorem]{Assumption}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}

\newtcolorbox{takeawaybox}{
  colback=NUSAbstractBg,
  colframe=NUSBlue,
  boxrule=0pt,
  leftrule=2.4pt,
  rightrule=0pt,
  toprule=0pt,
  bottomrule=0pt,
  arc=0pt,
  left=1.05em,
  right=1.0em,
  top=0.7em,
  bottom=0.75em,
  before upper={%
    \noindent\textcolor{NUSBlue}{\small\bfseries\MakeUppercase{Takeaway}}\par\vspace{0.35em}%
  }
}

% -----------------------------------------------------------------------------
% Code style
% -----------------------------------------------------------------------------
\lstdefinestyle{nuscode}{
  basicstyle=\ttfamily\small,
  breaklines=true,
  frame=single,
  rulecolor=\color{NUSRule!60},
  backgroundcolor=\color{NUSPaleGray},
  numbers=left,
  numberstyle=\tiny\color{NUSMuted},
  keywordstyle=\color{NUSBlue}\bfseries,
  commentstyle=\color{NUSMuted}\itshape,
  stringstyle=\color{NUSOrange!85!black},
  showstringspaces=false,
  tabsize=2
}
\lstset{style=nuscode}

% -----------------------------------------------------------------------------
% Draft mode
% -----------------------------------------------------------------------------
\ifnus@draft
  \overfullrule=5pt
\fi

\makeatother
\endinput
