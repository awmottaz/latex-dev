%% This is the mathhw document class for writing mathematics homework solutions.
%
% LICENSE: This project is released under the LaTeX Project Public License, v1.3c or later. See
%
%                          http://www.latex-project.org/lppl.txt
%
%% Initialization
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathhw}[2016/08/24 v0.01 Math Homework Document Class]
%
%% Load the article class and pull in the packages
\LoadClass[letterpaper]{article}
\RequirePackage{layout}
\RequirePackage{geometry}
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathtools}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{dsfont}
\RequirePackage{mathrsfs}
\RequirePackage{cancel}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{array}
\RequirePackage{arydshln}
\RequirePackage{relsize}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{needspace}
\RequirePackage[textwidth = 0.9\marginparwidth]{todonotes}
\RequirePackage{fancyhdr}
\RequirePackage[parfill]{parskip}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{framed}
\RequirePackage{wasysym}
\RequirePackage{lipsum}
\RequirePackage{alphalph}
\RequirePackage{pdfpages}
\RequirePackage{float}
\RequirePackage{tabularx}
\RequirePackage{textgreek}
\RequirePackage{upgreek}
\RequirePackage{signchart}
\RequirePackage{microtype}
\RequirePackage{multicol}
\RequirePackage{tikz-cd}
%
%% Declare class options
\DeclareOption{fdefn}{ % put frames around definitions
	\let\olddefn\defn
	\let\oldenddefn\enddefn
	\renewenvironment{defn}{\begin{framed} \olddefn}{\oldenddefn \end{framed}}
}
\DeclareOption{fthm}{ % put frames around theorems
	\let\oldthm\thm
	\let\oldendthm\endthm
	\renewenvironment{thm}{\begin{framed} \oldthm}{\oldendthm \end{framed}}
	\let\oldlem\lem
	\let\oldendlem\endlem
	\renewenvironment{lem}{\begin{framed} \oldlem}{\oldendlem \end{framed}}
	\let\oldprop\prop
	\let\oldendprop\endprop
	\renewenvironment{prop}{\begin{framed} \oldprop}{\oldendprop \end{framed}}
	\let\oldcor\cor
	\let\oldendcor\endcor
	\renewenvironment{cor}{\begin{framed} \oldcor}{\oldendcor \end{framed}}
}
\DeclareOption{fnthm}{ % put frames around enumerated theorems
	\let\oldnthm\nthm
	\let\oldendnthm\endnthm
	\renewenvironment{nthm}{\begin{framed} \oldnthm}{\oldendnthm \end{framed}}
	\let\oldnlem\nlem
	\let\oldendnlem\endnlem
	\renewenvironment{nlem}{\begin{framed} \oldnlem}{\oldendnlem \end{framed}}
	\let\oldnprop\nprop
	\let\oldendnprop\endnprop
	\renewenvironment{nprop}{\begin{framed} \oldnprop}{\oldendnprop \end{framed}}
	\let\oldncor\ncor
	\let\oldendncor\endncor
	\renewenvironment{ncor}{\begin{framed} \oldncor}{\oldendncor \end{framed}}
}
\DeclareOption{darktheme}{ % inverts page colors
	\pagecolor[rgb]{0.1,0.1,0.1}
	\color[rgb]{0.95,0.95,0.95}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%
%% Settings for packages
\geometry{
	headheight = 1.3em,
	headsep = 1.3em,
	marginparsep = 1.5em,
	footnotesep = 3em,
	hdivide={0.15\paperwidth,0.62\paperwidth,*},
	vdivide={0.1\paperheight,0.78\paperheight,*},
	marginparwidth=0.18\paperwidth
}
\setlength{\extrarowheight}{1pt}
\usetikzlibrary{shapes}
\usetikzlibrary{arrows}
\pgfplotsset{compat = 1.10}% You may use a later version, if you wish.
\usepgfplotslibrary{fillbetween}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	linkbordercolor=white,
	urlcolor=blue,
	unicode
}
%% Customizations of behavior
% Footnote symbols
\makeatletter%
\newcommand*{\myfnsymbolsingle}[1]{%
	\ensuremath{%
		\ifcase#1
		\or
			\dag
		\or
			\ddag
		\or
			\kreuz
		\or
			\star
		\else
			\@ctrerr  
		\fi
	}%   
}   
\makeatother%
\newcommand*{\myfnsymbol}[1]{%
	\myfnsymbolsingle{\value{#1}}%
}
\newalphalph{\myfnsymbolmult}[mult]{\myfnsymbolsingle}{}%
\renewcommand*{\thefootnote}{%
	\myfnsymbolmult{\value{footnote}}%
}
%
% footnote references
\crefformat{footnote}{#2\footnotemark[#1]#3}%
%
% I want math inside of \textbf{•} to also be bolded font
\DeclareTextFontCommand{\textbf}{\boldmath\bfseries}
% Here I redefine the proof environment so that if fewer than 4 lines will
% show at the bottom of a page, then the entire environment will be pushed
% onto the next page.
\expandafter\let\expandafter\oldproof\csname\string\proof\endcsname
\let\oldendproof\endproof
\renewenvironment{proof}[1][\proofname]{%
	\Needspace*{4\baselineskip} \oldproof[#1]}
	{\oldendproof}
%
%% Math macros
%----- DOUBLE STROKE CHARACTERS -----%
\newcommand{\N}{\mathds{N}}			% Naturals
\newcommand{\Z}{\mathds{Z}}			% Integers
\newcommand{\Q}{\mathds{Q}}			% Rationals
\newcommand{\R}{\mathds{R}}			% Reals
\renewcommand{\C}{\mathds{C}}	% Complex numbers
\renewcommand{\H}{\mathds{H}}	% Quaternions (Hamiltonions)
\newcommand{\F}{\mathds{F}}			% Generic field
%
%----- AUTOMATICALLY SCALED DELIMITERS -----%
\DeclarePairedDelimiter{\paren}{(}{)}							%  ( )
\DeclarePairedDelimiter{\ang}{\langle}{\rangle}	%  < >
\DeclarePairedDelimiter{\brc}{\{}{\}}							%  { }
\DeclarePairedDelimiter{\brkt}{[}{]}							%  [ ]
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}		%  | |
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}		% || ||
\renewcommand{\mid}{\mkern4mu\middle\vert\mkern4mu}
%
% Swap the definition of starred and non-starred versions.
% Non-starred delimeters will auto-scale, and starred versions will not.
\makeatletter
\let\oldparen\paren % \paren
\def\paren{\@ifstar{\oldparen}{\oldparen*}}
\let\oldang\ang % \ang
\def\ang{\@ifstar{\oldang}{\oldang*}}
\let\oldbrc\brc % \brc
\def\brc{\@ifstar{\oldbrc}{\oldbrc*}}
\let\oldbrkt\brkt % \brkt
\def\brkt{\@ifstar{\oldbrkt}{\oldbrkt*}}
\let\oldabs\abs % \abs
\def\abs{\@ifstar{\oldabs}{\oldabs*}}
\let\oldnorm\norm % \norm
\def\norm{\@ifstar{\oldnorm}{\oldnorm*}}
\makeatother
%
%----- FUNCTIONS -----%
\newcommand{\ceil}[1]{\left\lceil #1 \right\rceil}			% Ceiling function
\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}	% Floor function
\renewcommand{\bar}[1]{																		% The complex conjugate
	\mkern 1mu\overline{\mkern-1mu#1\mkern-1mu}}
%
%----- OPERATORS -----%
\newcommand{\iso}{\cong}									% The 'is isomorphic to' symbol
\newcommand{\nsg}{\unlhd}								% The 'normal subgroup' symbol
\newcommand{\rnsg}{\unrhd}								% Reversed 'normal subgroup' symbol
\newcommand{\nnsg}{\ntrianglelefteq}		% Negated 'normal subgroup' symbol
\newcommand{\del}{\nabla}								% The 'del', or 'gradient' operator
\DeclareMathOperator{\ord}{ord}					% Order
\DeclareMathOperator{\sgn}{sgn}					% Sign function
\DeclareMathOperator{\lcm}{lcm}					% Least common multiple
\DeclareMathOperator{\aut}{Aut}					% Group of automorphisms
\DeclareMathOperator{\inn}{Inn}					% Group of inner automorphisms
\DeclareMathOperator{\sym}{Sym}					% Symmetric group
\DeclareMathOperator{\id}{id}						% Identity operator
\DeclareMathOperator{\img}{Im}						% Image of a function
\DeclareMathOperator{\stab}{Stab}				% Stabilizer
\DeclareMathOperator{\orb}{Orb}					% Orbit
\DeclareMathOperator{\cl}{C\ell}					% Conjugacy class
\DeclareMathOperator{\core}{core}				% Core
\DeclareMathOperator{\syl}{Syl}					% Sylow group
\DeclareMathOperator{\cha}{char}					% Characteristic
\DeclareMathOperator{\tr}{tr}						% Trace of a matrix
\DeclareMathOperator{\fun}{Fun}					% Set of functions
\DeclareMathOperator{\cis}{cis}					% Cos + i Sin
\DeclareMathOperator{\Arg}{Arg}					% Principal argument
\DeclareMathOperator{\Frac}{Frac}				% Field of fractions
\DeclareMathOperator{\ann}{Ann}					% Annihilator
\DeclareMathOperator{\tor}{Tor}					% Torsion set
\DeclareMathOperator{\End}{End}					% Set of endomorphisms
\DeclareMathOperator{\Hom}{Hom}					% Set of homomorphisms
\renewcommand{\limsup}{\varlimsup}			% Limit superior
\renewcommand{\liminf}{\varliminf}			% Limit inferior
\renewcommand{\Re}{\operatorname{Re}}		% Real part
\renewcommand{\Im}{\operatorname{Im}}		% Imaginary part
\def\upint{\mathchoice										% Upper integral
	{\mkern13mu\overline{\vphantom{\intop}\mkern7mu}\mkern-20mu}
	{\mkern7mu\overline{\vphantom{\intop}\mkern7mu}\mkern-14mu}
	{\mkern7mu\overline{\vphantom{\intop}\mkern7mu}\mkern-14mu}
	{\mkern7mu\overline{\vphantom{\intop}\mkern7mu}\mkern-14mu}
	\int}
\def\lowint{																% Lower integral
	\mkern3mu\underline{\vphantom{\intop}\mkern7mu}\mkern-10mu\int}
\newcommand{\dsum}{\displaystyle\sum\limits}% Like \dfrac, but for inline sums
\newcommand{\bigboxplus}{								% Big 'boxplus' symbol
	\mathop{%
		\mathchoice{\dobigboxplus\Large}%
								{\dobigboxplus\large}
								{\dobigboxplus\normalsize}
								{\dobigboxplus\small}
	}\displaylimits
}
\newcommand{\dobigboxplus}[1]{%
\vcenter{#1\kern.2ex\hbox{$\boxplus$}\kern.2ex}}
% 'Divides' relation
\newcommand{\divides}{\bigm|}
\newcommand{\ndivides}{%
	\mathrel{\mkern.5mu % small adjustment
		% superimpose \nmid to \big|
		\ooalign{\hidewidth$\big|$\hidewidth\cr$\nmid$\cr}%
	}%
}
%
%% Theorem Styles
%
%----- DEFINE THE STYLES -----%
\newtheoremstyle{first_style}
	{\baselineskip}
	{0.7\baselineskip}
	{\slshape}
	{}
	{\bfseries}
	{.}
	{0.5em}
	{}
\newtheoremstyle{second_style}
	{\baselineskip}
	{0.7\baselineskip}
	{\normalfont}
	{}
	{\bfseries}
	{:}
	{0.5em}
	{}
\newtheoremstyle{third_style}
	{1ex}
	{-0.5\baselineskip}
	{\normalfont}
	{}
	{\slshape\bfseries}
	{:}
	{0.25em}
	{}
%----- DEFINE THE ENVIRONMENTS -----%
\theoremstyle{first_style}
	\newtheorem{nthm}{Theorem}[section]
	\newtheorem{nlem}[nthm]{Lemma}
	\newtheorem{nprop}[nthm]{Proposition}
	\newtheorem{ncor}[nthm]{Corollary}
	\newtheorem*{thm}{Theorem}
	\newtheorem*{lem}{Lemma}
	\newtheorem*{prop}{Proposition}
	\newtheorem*{cor}{Corollary}
\theoremstyle{second_style}
	\newtheorem*{defn}{Definition}
	\newtheorem*{exmp}{Example}
	\newtheorem*{sol}{Solution}
	\newtheorem*{case}{Case}
\theoremstyle{third_style}
	\newtheorem*{note}{Note}
	\newtheorem*{claim}{Claim}
%
%% Customize the header
\newcommand{\cn}{<Course Title>}
\newcommand{\as}{<Assignment Title>}
\newcommand{\nm}{Tony Mottaz} % <== REPLACE WITH YOUR NAME
\newcommand{\coursetitle}[1]{\renewcommand{\cn}{#1}}
\newcommand{\hwtitle}[1]{\renewcommand{\as}{#1}}
\newcommand{\myname}[1]{\renewcommand{\nm}{#1}}
\lhead{\scshape \cn}
\chead{\scshape \as}
\rhead{\scshape \nm}
\pagestyle{fancy}
%
%% Other macros
% If you want something circled, this will do it nicely.
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
	\node[shape=ellipse,draw,inner sep=1pt] (char) {#1};}}
% Margin paragraphs
\newcommand{\mpar}[1]{\marginpar{\footnotesize#1}}
