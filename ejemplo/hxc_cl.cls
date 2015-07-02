\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hxc_cl}[2011/12/23 My Class]

%% Article options
\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}

%% Custom package options
\DeclareOption{sansserif}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption{neverindent}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{10pt}

%% Process given options
\ProcessOptions\relax

%% Load base
\LoadClass[11pt,a4paper]{article}

%% Load additional packages and commands.
%\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish,es-tabla]{babel}
\RequirePackage{multicol}
\RequirePackage[left=3cm,right=3cm]{geometry}

\RequirePackage{titling}
\RequirePackage{titlesec}
\RequirePackage[xetex]{graphicx}
\RequirePackage{fontspec,xunicode}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{xcolor}
\RequirePackage{framed}
\RequirePackage{float}
\RequirePackage{environ}
\RequirePackage{tikz}
\RequirePackage{pgf}
\usetikzlibrary{arrows,automata,positioning}

\definecolor{TitleColor}{RGB}{71,61,139}
\definecolor{BGColor}{RGB}{202,199,230}
\definecolor{BGColoro}{RGB}{180,180,210}

\tikzset{
  abstrtz/.style = {
    rectangle, rounded corners=0.5cm,
    draw = BGColoro, fill = BGColor, line width = 2pt,
    minimum height = 2em, inner sep = 10pt,
  },
}

\setlength{\headheight}{15.2pt}
\setlength{\unitlength}{5cm}
\pagestyle{fancy}
\lhead[\scshape\@author]{\scshape\@title}
%\rhead[\scshape\@title]{\scshape\@author}
%\chead[\begin{picture}(0,0) \put(0,0){\includegraphics[width=5cm]{banner_s}} \end{picture}\\ www.hackxcrack.net]{\begin{picture}(0,0) \put(-0.47,0.01){\includegraphics[width=5cm]{banner_s}} \end{picture} \\ www.hackxcrack.net\vspace{0.5cm}}

\newcommand{\correoe}[1]{\gdef\@correoe{#1}}%
\newcommand{\@correoe}{\@latex@warning@no@line{No \noexpand\correoe given}}

\def\@maketitle{%
  %\end{multicols}
  %\begin{picture}(0,0)\put(-0.525,-0.1){\includegraphics[width=210mm]{banner}}\end{picture}
  %\null
  \vspace*{1cm}%
  \begin{center}%
  \let \footnote \thanks
    {\Huge {\color{TitleColor}\textbf{\scshape\@title}} \par}%
    \vskip 1.5em%
    %{\large
    %  \lineskip .5em%
    %  \begin{tabular}[t]{ll}%
    %    Autor:& \scshape\@author\\
    %    \footnotesize Contacto:& \footnotesize\@correoe
    %  \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em
  %\begin{multicols}{2}
}
  
\titleformat{\section}[hang]{\Large\bf\scshape\color{TitleColor}}{\thesection.}{1em}{}
\titleformat{\subsection}[hang]{\large\bf\scshape\color{TitleColor}}{\thesubsection.}{1em}{}
\titleformat{\subsubsection}[hang]{\normalsize\bf\scshape\color{TitleColor}}{\thesubsubsection.}{1em}{}

\setmainfont[Ligatures=TeX,Path = /usr/share/fonts/opentype/,BoldFont =FiraSans-Medium.otf,ItalicFont = FiraSans-LightItalic.otf, BoldItalicFont  = FiraSans-MediumItalic.otf]{FiraSans-Light.otf}
\newcommand{\subtitle}[1]{%
  \posttitle{%
    \par\end{center}
    \begin{center}\large#1\end{center}
    \vskip0.5em}%
}
%% Additional TeX/LaTeX code...
%\newsavebox{\resbox}
%\renewenvironment{abstract}{%
%	\newcommand\colboxcolor{BGColor}%
%	\begin{lrbox}{\resbox}%
%	\begin{minipage}{\textwidth}
%    \begin{center}{{\color{TitleColor}\scshape Resumen}}\end{center}}
%    {\end{minipage}\end{lrbox}%
%    \hspace*{-0.8cm}\colorbox{BGColoro}{\colorbox{BGColor}{\usebox{\resbox}}}
%    \vspace{0.5cm}\tableofcontents\vspace{2cm}}

\NewEnviron{resumen}{
  \begin{center}
  \begin{tikzpicture}
    \node[abstrtz] (ABSTRACT) {
      \begin{minipage}{0.8\textwidth}
        {\color{TitleColor}\scshape \bf Resúmen} \\
        \BODY
      \end{minipage}
    };
  \end{tikzpicture}
  \end{center}
}

\NewEnviron{colabs}{
\clearpage
\begin{center}
\begin{tikzpicture}
\node[abstrtz] (ABSTRACT) {
      \begin{minipage}{0.8\textwidth}
      \addcontentsline{toc}{section}{Colaboradores}
        {\color{TitleColor}\scshape \bf Colaboradores:} \\
        Lista de colaboradores de este documento, en orden cronológico:
      \begin{multicols}{2}
        \BODY
        \end{multicols}
      \end{minipage}
    };
\end{tikzpicture}
\end{center}
}

\NewEnviron{requisitos}{
	\begin{center}
  \begin{tikzpicture}
    \node[abstrtz] (ABSTRACT) {
      \begin{minipage}{0.8\textwidth}
        {\color{TitleColor}\scshape \bf Requisitos} \\
        \BODY
      \end{minipage}
    };
  \end{tikzpicture}
  \end{center}
  \vfill
  %\section*{Cuadernos}
Este cuaderno pertenece a un conjunto de cuadernos escritos de forma colaborativa. Más cuadernos como este, junto con material para su creación, se encuentran en el repositorio de \texttt{github: https://github.com/HackXCrack/fennix}
  \clearpage
  \tableofcontents
  \clearpage
}



%\BeforeBeginEnvironment{abstract}{\end{multicols}}
%\AfterEndEnvironment{abstract}{\begin{multicols}{2}}

%\BeforeBeginEnvironment{resumen}{\end{multicols}}
%\AfterEndEnvironment{resumen}{\begin{multicols}{2}}

%\AtBeginDocument{\begin{multicols}{2}}
\AtEndDocument{
%\end{multicols}
}
\endinput
