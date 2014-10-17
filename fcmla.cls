\ProvidesClass{fcmla}
\LoadClass[12pt]{article}

% headsep + headheight gives a full inch for the top
% margin. headsep gives .5in for the surname and page number.
\usepackage[top=1in, bottom=1in, left=1in, right=1in, headheight=0.5in, headsep=0.5in]{geometry}
\usepackage{setspace}
\usepackage{fancyhdr}
\usepackage{ifthen}
% TODO: Find a way to use Times Roman or Times New Roman without pslatex.
\usepackage{pslatex} % For Times Roman font

%%% Define and redefine commands for MLA header
\renewcommand{\title}[1]{\def \thistitle {#1}}
\renewcommand{\author}[2]{\def \thisfirst {#1} \def \thislast {#2}}
\renewcommand{\date}[1]{\def \thisdate {\ifthenelse{\equal{#1}{}}{\today}{#1}}}
\newcommand{\course}[1]{\def \thiscourse {#1}}
\newcommand{\professor}[1]{\def \thisprof {#1}}
\renewcommand{\maketitle}{
  \noindent \ifthenelse{\equal{\thisfirst}{}}{\thislast}{\thisfirst\ \thislast}
  \ifthenelse{\equal{\thisprof}{}}{}{\\ \thisprof}
  \ifthenelse{\equal{\thiscourse}{}}{}{\\ \thiscourse}
  \\ \thisdate

  \begin{center}
    \thistitle
  \end{center}
}
% Set title, author, professor, date, course to nothing
\title{}
\author{}{}
\date{}
\professor{}
\course{}

%%% MLA Margin Header
\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{\thislast \hspace{.10cm} \thepage}
\fancyfoot[C]{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\setlength{\parindent}{.5in} % Indentations are half an in for MLA.
\linespread{2}               % Lining spacing is always double.

\renewenvironment{quote}{\list{}{\leftmargin=1in\rightmargin=0in}\item[]}{\endlist}
\renewcommand{\cite}[2][]{(\ifthenelse{\equal{#1}{}}{#2}{#1 #2})} % \cite[page number]{author}

% TODO: Make environments and commands for an MLA bibliography.
