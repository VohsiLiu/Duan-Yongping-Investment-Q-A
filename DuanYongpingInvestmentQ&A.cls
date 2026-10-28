\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DuanYongpingInvestmentQ&A}
\LoadClass[zihao=-4,a4paper,12pt,twoside,fontset=none]{ctexart}
\RequirePackage[top=3.2cm,bottom=2.7cm,left=3.18cm,right=3.18cm]{geometry}
\RequirePackage{xcolor,graphicx}

% 中文各字体独立设置；西文保留模板的 Times New Roman。
\RequirePackage[AutoFallBack=true]{xeCJK}
\setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
\setCJKsansfont[BoldFont={FZHei-B01}]{FZHei-B01}
\setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\setCJKfamilyfont{zhsong}[BoldFont={FZHei-B01}]{FZShuSong-Z01}
\setCJKfamilyfont{zhhei}[BoldFont={FZHei-B01}]{FZHei-B01}
\setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
\setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\providecommand{\songti}{}
\renewcommand*{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{}
\renewcommand*{\heiti}{\CJKfamily{zhhei}}
\providecommand{\kaishu}{}
\renewcommand*{\kaishu}{\CJKfamily{zhkai}}
\providecommand{\fangsong}{}
\renewcommand*{\fangsong}{\CJKfamily{zhfs}}
\newCJKfontfamily\xbsong{FZXiaoBiaoSong-B05S}
\setCJKfallbackfamilyfont{\CJKrmdefault}{TH-Sy-P0,FZSongS--GB1-5,FZSONG_ZHSJ_02--GB1-5}
\xeCJKDeclareCharClass{CJK}{"2160 -> "216F, "2460 -> "2473}
\setmainfont{Times New Roman}[SmallCapsFont=TeX Gyre Termes:+smcp]
\RequirePackage{newunicodechar}
\newunicodechar{∶}{\ensuremath{\mathrel{:}}}
\xeCJKsetup{CJKecglue=\hskip 0.15em plus 0.05em minus 0.03em}

% 正文与页眉。封面的字体、字号和页面参数沿用原模板。
\RequirePackage{fancyhdr,emptypage,indentfirst,setspace}
\setlength{\parindent}{2em}
\setlength{\parskip}{0.25em}
\setstretch{1.5}
\setlength{\emergencystretch}{2em}
% 与参考模板一致，避免页眉盒高度将正文和页码整体向下推移。
\setlength{\headheight}{15pt}
\setlength{\footskip}{30pt}
\raggedbottom
\fancypagestyle{tocstyle}{%
  \fancyhf{}\renewcommand{\headrulewidth}{0.35pt}%
  \fancyhead[C]{\kaishu\small 目录}\fancyfoot[C]{\small\thepage}}
\fancypagestyle{docstyle}{%
  \fancyhf{}\renewcommand{\headrulewidth}{0.35pt}%
  \fancyhead[CO]{\kaishu\small\nouppercase{\leftmark}}%
  \fancyhead[CE]{\kaishu\small 段永平投资问答录}%
  \fancyfoot[C]{\small\thepage}}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\renewcommand{\subsectionmark}[1]{}

% 章、节、小标题：目录层级按原书 PDF。
\RequirePackage{titlesec}
% 每个正文主题（section）从奇数页开始。
\newcommand{\sectionbreak}{\cleardoublepage}
\setcounter{secnumdepth}{0}
\setcounter{tocdepth}{2}
\titleformat{\section}[block]
  {\centering\xbsong\zihao{-2}\xeCJKsetup{CJKglue=\hskip 1.5pt}}
  {}{0pt}{}
\titleformat{\subsection}[block]
  {\centering\heiti\setstretch{1.25}\zihao{-3}}{}{0pt}{}
\titleformat{\subsubsection}[block]
  {\heiti\setstretch{1.25}\zihao{4}}{}{0pt}{}
\titlespacing*{\section}{0pt}{1.8em}{1.6em}
\titlespacing*{\subsection}{0pt}{1.5em}{0.8em}
\titlespacing*{\subsubsection}{0pt}{1.1em}{0.5em}
\titleformat{\paragraph}[block]{\heiti\normalsize}{}{0pt}{}
\titlespacing*{\paragraph}{0pt}{0.8em}{0.3em}
\newcommand{\q}{\ \ }
\renewcommand*{\l@part}[2]{%
  \vskip 0.6em\@plus\p@\@dottedtocline{0}{0em}{0em}{\bfseries #1}{\bfseries #2}}
\renewcommand*{\l@section}[2]{%
  \vskip 0.3em\@plus\p@\@dottedtocline{1}{1.5em}{0em}{\bfseries #1}{#2}}
\renewcommand*{\l@subsection}[2]{\@dottedtocline{2}{3em}{0em}{#1}{#2}}
% 章标题单独成页；正文主题使用 section，目录归属于对应章。
\newcommand{\BookPart}[2]{%
  \cleardoublepage\phantomsection\markboth{#1\q #2}{}%
  \addcontentsline{toc}{part}{#1\q #2}\thispagestyle{empty}%
  \vspace*{0.15\textheight}%
  \begin{center}{\heiti\zihao{3}#1\par}\vspace{1.6em}%
  {\xbsong\zihao{-1}#2\par}\end{center}\cleardoublepage}
\newcommand{\BookFront}[1]{%
  \clearpage\phantomsection\section*{#1}\markboth{#1}{}}
% 原书目录未收录的章内短标题，不写入目录及页眉。
\newcommand{\BookMinorHeading}[1]{%
  \paragraph*{#1}}
\newcommand{\BookQuestion}[1]{{\fangsong #1\par}}
\newcommand{\BookChapter}[1]{%
  \clearpage\setcounter{section}{#1}\setcounter{table}{0}\setcounter{figure}{0}}
\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}.\arabic{table}}

% 列表沿用正文行距。
\RequirePackage{enumitem}
\setlist{topsep=0pt,partopsep=0pt,itemsep=0pt,parsep=\parskip,leftmargin=2em}
\setlist[itemize]{label=\textbullet}

\RequirePackage[stable,bottom]{footmisc}
\RequirePackage{perpage}
\MakePerPage{footnote}
\RequirePackage{hyperref}
\def\toclevel@part{0}
\hypersetup{colorlinks=true,allcolors=black,linktoc=all,
  bookmarksopen=true,bookmarksopenlevel=1,
  pdftitle={段永平投资问答录},pdfauthor={赵理亚 选；芒格书院 编}}
\renewcommand{\theHfigure}{\arabic{section}.\arabic{figure}}
\renewcommand{\theHtable}{\arabic{section}.\arabic{table}}
\endinput
