% resume.cls - adapted from Trey Hunner's resume class (LaTeXTemplates.com,
% "Medium Length Professional CV" v2.0). rSubsection takes three arguments
% ({title}{date}{subtitle}) to match how LTC Webb's CV calls it.
\ProvidesClass{resume}[2026/10/13 Resume class]
\LoadClass[11pt,letterpaper]{article}
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\pagestyle{empty}

\def\name#1{\def\@name{#1}}
\def\@name{}
\def\addressSep{$\diamond$}

\let\@addressone\relax
\let\@addresstwo\relax
\let\@addressthree\relax
\def\address#1{%
  \@ifundefined{@addresstwo}{\def\@addresstwo{#1}}{%
  \@ifundefined{@addressthree}{\def\@addressthree{#1}}{\def\@addressone{#1}}}}

\def\printaddress#1{%
  \begingroup\def\\{\addressSep\ }\centerline{#1}\endgroup\par\addressskip}
\def\printname{%
  \begingroup\hfil{\MakeUppercase{\namesize\bf \@name}}\hfil\nameskip\break\endgroup}

\let\ori@document=\document
\renewcommand{\document}{%
  \ori@document
  \printname
  \@ifundefined{@addressone}{}{\printaddress{\@addressone}}%
  \@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}%
  \@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}}

\newenvironment{rSection}[1]{%
  \sectionskip
  \MakeUppercase{\bf #1}%
  \sectionlineskip
  \hrule
  \begin{list}{}{\setlength{\leftmargin}{1.5em}}%
  \item[]}{\end{list}}

\newenvironment{rSubsection}[3]{%
  {\bf #1}\hfill{#2}%
  \ifthenelse{\equal{#3}{}}{}{\\{\em #3}}%
  \par}{\par\vspace{0.3em}}

\def\namesize{\huge}
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\nameskip{\bigskip}
\def\sectionskip{\medskip}
