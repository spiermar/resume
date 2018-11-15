\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4C4C4C}
\definecolor{silver}{HTML}{808080}
\definecolor{lightgray}{HTML}{999999}
\definecolor{white}{HTML}{FFFFFF}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{wine}{HTML}{A2033c}

\ifdefined\@cv@print
  \colorlet{green}{darkgray}
  \colorlet{orange}{darkgray}
  \colorlet{purple}{darkgray}
  \colorlet{red}{darkgray}
  \colorlet{blue}{darkgray}
  \colorlet{filltitle}{white}
  \colorlet{title}{darkgray}
\else
  \colorlet{filltitle}{darkgray}
  \colorlet{title}{white}
\fi
\colorlet{textcolor}{darkgray}
\colorlet{headercolor}{darkgray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}

\newfontfamily\titlefont{GaramondPremrPro.otf}
\newfontfamily\headingfont{GaramondPremrPro-Smbd.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, ItalicFont=GaramondPremrPro-It.otf, BoldFont=GaramondPremrPro-Smbd.otf, Numbers=OldStyle]{GaramondPremrPro.otf}
\setmonofont[Mapping=tex-text, ItalicFont=GaramondPremrPro-It.otf, BoldFont=GaramondPremrPro-Smbd.otf]{GaramondPremrPro.otf}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \titlefont%
  \color{white}%
}

\newcommand{\header}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=filltitle, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{24pt}{36pt}\color{title}\scshape #1%
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{title}%
      \titlefont #2%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

\RequirePackage{enumitem}
\setitemize{noitemsep, leftmargin=\parindent, labelindent=\parindent}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{longtable}
\RequirePackage{tabu}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{longtabu} to \textwidth {@{\extracolsep{\fill}}ll}
}{%
  \end{longtabu}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simple list environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\simpleentry}[3]{%
  #1&\parbox[t]{11.8cm}{%
    #2%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}%
    \vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=numeric, defernumbers=true, maxnames=99, backend=biber]{biblatex}
\setlength\bibhang{0pt}

\defbibenvironment{bibliography}{%
  \list
    {\printfield[labelnumberwidth]{labelnumber}}
    {%
      \setlength{\labelwidth}{\labelnumberwidth}%
      \setlength{\leftmargin}{\labelwidth}%
      \setlength{\labelsep}{\biblabelsep}%
      \addtolength{\leftmargin}{-\labelwidth}% <- Changed
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}%
    }%
  \renewcommand*{\makelabel}[1]{\hss##1}%
}
{\endlist}
{\item}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\def\newblock{\hskip 0pt plus 0pt minus 0pt}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \textcolor{lightgray}{\printfield{doi}}%
    \newunit%
    \finentry%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
    \finentry%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
    \finentry%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
    \finentry%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
    \finentry%
  }
  \par\vspace{0.3\baselineskip}
}

% biblatex name formatting changed with version 3.3.
% After this change the line "\ifblank{#3}{}{#3\space}#1%" gives an error.
% See also: http://tex.stackexchange.com/questions/327316/updating-friggeris-cv-making-it-work-with-texlive-2015-and-up-too-many-erro

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \nameparts{#1}\ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \newrefcontext[sorting=chronological]
    \printbibliography[type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingTemplate{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm, top=2cm, right=1.5cm, bottom=2.5cm, nohead, nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{microtype}
