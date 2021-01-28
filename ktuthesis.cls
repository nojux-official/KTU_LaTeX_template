\LoadClass[12pt,a4paper]{article}
\RequirePackage[left=3cm,right=1cm,top=1.5cm,bottom=1.5cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{scrextend}
\RequirePackage{fontspec}
\RequirePackage{sectsty}
\RequirePackage{titlesec}

\setmainfont{Times New Roman}

\definecolor{brown}{HTML}{D4AF37}
\definecolor{gray}{HTML}{808080}

\renewcommand\LARGE{\@setfontsize\LARGE{18}{18}}

\newcommand*\supervisor[1]{\gdef\@supervisor{#1}}
\newcommand*\@supervisor{\@latex@error{\noexpand\supervisor is not provided.}}
\newcommand*\authortext[1]{\gdef\@authortext{#1}}
\newcommand*\@authortext{Projekto autorius}
\newcommand*\supervisortext[1]{\gdef\@supervisortext{#1}}
\newcommand*\@supervisortext{Vadovas}
\newcommand*\reviewer[1]{\gdef\@reviewer{#1}}
\newcommand*\@reviewer{\@latex@error{\noexpand\reviewer is not provided.}}
\newcommand*\reviewertext[1]{\gdef\@reviewertext{#1}}
\newcommand*\@reviewertext{Recenzentas}
\newcommand*\authorgenitive[1]{\gdef\@authorgenitive{#1}}
\newcommand*\@authorgenitive{\@latex@error{\noexpand\authorgenitive is not provided.}}

\renewcommand{\contentsname}{Turinys}
\renewcommand{\listfigurename}{Paveikslų sąrašas}
\renewcommand{\listtablename}{Lentelių sąrašas}

\linespread{1.15}
\setlength{\parindent}{0cm}
\setlength{\parskip}{3.5mm}

\sectionfont{\fontsize{12}{15}\selectfont}
\titlespacing{\section}{0pt}{0pt}{0.35cm}
\titlespacing{\subsection}{0pt}{0pt}{13.5mm}

\renewcommand\maketitle{
  % First title page
  \thispagestyle{empty}  % hide page number
  {\parskip=2.1mm
    \begin{center}
      \vspace*{7.1mm}

      \includegraphics{logo}

      \vspace{10.6mm}
      \textbf{Kauno technologijos universitetas}

      Informatikos fakultetas
      \vspace{33.5mm}

      {\LARGE \textbf{\@title}}

      {\large Baigiamasis bakalauro studijų projektas}
      \vspace{33.1mm}

      \noindent{\textcolor{brown}{\rule{9cm}{0.5pt}}}
      \vspace{9mm}

      \parbox[s]{9cm}{\centering \textbf{\@author}}

      \@authortext
      \vspace{8.6mm}

      \parbox[s]{9cm}{\centering \textbf{\@supervisor}}

      \@supervisortext
      \vspace{8.6mm}

      \noindent{\textcolor{brown}{\rule{9cm}{0.5pt}}}

      \vfill

      \textbf{Kaunas, \the\year}
      \vspace{16mm}
    \end{center}
  }
  \clearpage
  % second page
  \thispagestyle{empty}
  {\parskip=2.1mm
    \begin{center}
      \vspace*{7.1mm}

      \includegraphics{logo}

      \vspace{10.6mm}
      \textbf{Kauno technologijos universitetas}

      Informatikos fakultetas
      \vspace{30.5mm}

      {\LARGE \textbf{\@title}}

      {\large Baigiamasis bakalauro studijų projektas}

      {\large Programų sistemos (612I30002)}
      \vspace{16.5mm}

    \end{center}
    \begin{addmargin}[8cm]{0cm}
      \noindent{\textcolor{brown}{\rule{9cm}{0.5pt}}}
      \vspace{6mm}

      \noindent{\parbox[s]{7cm}{\textbf{\@author}}}

      \noindent{\@authortext}
      \vspace{8.6mm}

      \noindent{\parbox[s]{7cm}{\textbf{\@supervisor}}}

      \noindent{\@supervisortext}
      \vspace{8.6mm}

      \noindent{\parbox[s]{7cm}{\textbf{\@reviewer}}}

      \noindent{\@reviewertext}
      \vspace{6mm}

      \noindent{\textcolor{brown}{\rule{9cm}{0.5pt}}}

    \end{addmargin}
    \begin{center}
      \vfill
      \textbf{Kaunas, \the\year}
      \vspace{12mm}
    \end{center}
  }
  \clearpage
  \thispagestyle{empty}
  {\parskip=2.1mm
    \begin{center}
      \vspace*{7.1mm}

      \includegraphics{logo}

      \vspace{10.6mm}
      \textbf{Kauno technologijos universitetas}

      Informatikos fakultetas

      \@author
      \vspace{26.8mm}

      {\LARGE \textbf{\@title}}
      \vspace{2.1mm}

      {\large{Akademinio sąžiningumo deklaracija}}
      \vspace{14.1mm}
    \end{center}
  }

  Patvirtinu, kad mano, \@authorgenitive, baigiamasis projektas tema „\@title“ yra parašytas visiškai savarankiškai ir
  visi pateikti duomenys ar tyrimų rezultatai yra teisingi ir gauti sąžiningai.
  Šiame darbe nei viena dalis nėra plagijuota nuo jokių spausdintinių ar internetinių šaltinių, visos kitų šaltinių
  tiesioginės ir netiesioginės citatos nurodytos literatūros nuorodose.
  Įstatymų nenumatytų piniginių sumų už šį darbą niekam nesu mokėjęs.

  Aš suprantu, kad išaiškėjus nesąžiningumo faktui, man bus taikomos nuobaudos, remiantis Kauno technologijos
  universitete galiojančia tvarka.

  \vspace{20mm}

  \begin{addmargin}[56.6mm]{0cm}
    \begin{tabular}{p{70.7mm}@{\hskip 7.1mm}p{35.7mm}}
      \hrulefill & \hrulefill \\
      \multicolumn{1}{c}{\textcolor{gray}{(vardą ir pavardę įrašyti ranka)}} &
      \multicolumn{1}{c}{\textcolor{gray}{(parašas)}}
    \end{tabular}
  \end{addmargin}
  \clearpage
}
