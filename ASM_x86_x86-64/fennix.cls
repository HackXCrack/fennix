%%Definición de clase y versión de LaTeX
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fennix}[2015/06/06 fennix Class]

%% Opciones generales de la clase,
%% la mayoría son de la clase article
%% y se pasan a ella directamente.
\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{sansserif}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption{neverindent}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption*{
  \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}
\ExecuteOptions{10pt}
\ProcessOptions\relax

%% Documento base: clase artículo a 11 puntos
\LoadClass[11pt,a4paper]{article}

%% No incluir estos paquetes en el documento .tex
\RequirePackage[latin1]{inputenc}
%\RequirePackage[spanish,es-tabla]{babel}
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
\RequirePackage[font={small}]{caption}

%Títulos para no usar babel (problemas con tikz)
\renewcommand{\contentsname}{Índice}
\renewcommand{\figurename}{Figura}
\renewcommand{\tablename}{Tabla}

%%Opciones de paquetes superiores:
\setlength{\columnseprule}{0.4pt}
\setlength{\headheight}{15.2pt}
\setlength{\unitlength}{5cm}

\usetikzlibrary{arrows,automata,positioning}
%\spanishdeactivate{<,>}

\definecolor{TitleColor}{RGB}{71,61,139}
\definecolor{BGColor}{RGB}{202,199,230}
\definecolor{BGColoro}{RGB}{180,180,210}

%%Bloque de tikz
\tikzset{
  abstrtz/.style = {
    rectangle, rounded corners=0.5cm,
    draw = BGColoro, fill = BGColor, line width = 2pt,
    minimum height = 2em, inner sep = 10pt,
  },
}

%Headers
\pagestyle{fancy}
\lhead[\scshape\@author]{\scshape\@title}

%Parámetros de fuentes
\setmainfont[Ligatures=TeX,Path = fonts/,BoldFont =FiraSans-Medium.otf,ItalicFont = FiraSans-LightItalic.otf, BoldItalicFont  = FiraSans-MediumItalic.otf]{FiraSans-Light.otf}
\newcommand{\subtitle}[1]{%
  \posttitle{%
    \par\end{center}
    \begin{center}\large#1\end{center}
    \vskip0.5em}%
}

%Redefinición de título
%Es la misma de la clase article modificada para
%cambiar algunos parámetros
\def\@maketitle{%
  \vspace*{1cm}%
  \begin{center}%
  \let \footnote \thanks
    {\Huge {\color{TitleColor}\textbf{\scshape\@title}} \par}%
    \vskip 1.5em%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em
}

%Definición de cabeceras de secciones
\titleformat{\section}[hang]{\Large\bf\scshape\color{TitleColor}}{\thesection.}{1em}{}
\titleformat{\subsection}[hang]{\large\bf\scshape\color{TitleColor}}{\thesubsection.}{1em}{}
\titleformat{\subsubsection}[hang]{\normalsize\bf\scshape\color{TitleColor}}{\thesubsubsection.}{1em}{}


%---------------------------------------------
%%Definición de entornos concretos para fennix
%---------------------------------------------

%Entorno resumen, no contiene nada extra
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

%Entorno requisitos, incluye índice y saltos de página: NECESARIO
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
Este cuaderno pertenece a un conjunto de cuadernos escritos de forma colaborativa. Más cuadernos como este, junto con material para su creación, se encuentran en el repositorio de \texttt{github: https://github.com/HackXCrack/fennix}
  \clearpage
  \tableofcontents
  \clearpage
}

%Entorno colaboradores, incluye header y formato
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
      	\scriptsize
        \BODY
        \end{multicols}
      \end{minipage}
    };
\end{tikzpicture}
\end{center}
}

\endinput
