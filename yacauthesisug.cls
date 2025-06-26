%% yacauthesisug.cls
%% Copyright 2023 李明阳
%% Copyright 2025 Max Chang
%% This is a modified version of the caugraduatethesis.cls
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   https://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%%
%% The Current Maintainer of this work is Max Chang.
%%
%% This work consists of the file yacauthesisug.cls
%% and the derived files:
%%   Logo.jpg
%%   CAU_Course_Thesis_Template.tex
%%   CAU_Course_Thesis_Template.pdf
%%   gb7714-2015.bbx
%%   中国农业大学课程论文写作格式.doc
%% ---------------------------------------------------------------------------
%% Class Name   : yacauthesisug
%% Description  : Yet Another China Agricultural University LaTeX Thesis Template for Undergraduate
%% Repository   : https://github.com/maxchang3/yacauthesisug
%% Version      : 0.1
%% Copyright    : 2025 Max Chang
%% E-mail       : hi@maxchang.me
%% License      : LaTeX Project Public License v1.3c or later
%% License URI  : https://www.latex-project.org/lppl.txt
%% Files        : yacauthesisug.cls
%%                pictures/fig1.png
%%                pictures/signature
%%                pictures/title.jpg
%%                pictures/title.png
%%                causetup.tex
%%                thesis.tex
%% ---------------------------------------------------------------------------
%% Class Name   : caugraduatethesis
%% Description  : China Agricultural University Undergraduate Thesis LaTeX Template
%% Repository   : https://github.com/Wubeizhongxinghua/CAU-Undergraduate-Thesis-Template
%% Version      : 0.2
%% Copyright    : 2023 李明阳
%% E-mail       : limingyang200101@gmail.com
%% License      : LaTeX Project Public License v1.3c or later
%% License URI  : https://www.latex-project.org/lppl.txt
%% Files        : caugraduatethesis.cls
%%                pictures/fig1.png
%%                pictures/title.png
%%                CAU_Undergraduate_Thesis_Template.tex
%%                CAU_Undergraduate_Thesis_Template.pdf
%% ---------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                      类声明和基本设置                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{yacauthesisug}
\NeedsTeXFormat{LaTeX2e}
\LoadClass[a4paper]{article} % 继承自 article 文档类
\input{causetup} % 导入配置文件

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         宏包导入                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 基础支持
\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[zihao=-4,UTF8,fontset=none]{ctex}
\RequirePackage{fontspec}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{zhnumber}
\RequirePackage{listings}
\RequirePackage{afterpage}

% 表格相关
\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage{ifthen}
\RequirePackage{xstring}

% 图形相关
\RequirePackage{float}

% 页面布局相关
\RequirePackage{geometry}

% 公式相关
\RequirePackage{amsmath}

% 标题和注解相关
\RequirePackage{caption}

% URL支持和参考文献
\RequirePackage{url}
% 不显示 URL、DOI、姓名不大写
\RequirePackage[style=gb7714-2015,backend=biber,sorting=none,maxnames=3,minnames=3,date=year,isbn=false,url=false,doi=false,gbnamefmt=lowercase]{biblatex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         页面设置                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 页面布局
\geometry{
  top=30mm,
  bottom=25mm,
  left=30mm,
  right=25mm,
  headheight=23mm,
  footskip=7mm
}

\pagestyle{plain}
\setlength{\baselineskip}{20bp}

% 定义空白命令，用于生成空白页
\newcommand\emptypage{
  \null
  \thispagestyle{empty}
  \addtocounter{page}{-1}
  \newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         字体设置                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 抑制重定义报错
\RequirePackage{xpatch}
\ExplSyntaxOn
\xpatchcmd\__xeCJK_check_family:n{\__xeCJK_warning:nxx}{\__xeCJK_info:nxx}{}{}
\ExplSyntaxOff

% 设置字体
\setmainfont{Times New Roman}
\defaultfontfeatures{Path=fonts/}
\setCJKmainfont{SimSun}[
  AutoFakeBold = 3,
  ItalicFont   = KaiTi.ttf
]%
\setCJKsansfont{SimHei}[AutoFakeBold = 3]%
\setCJKmonofont{FangSong}[]%
\setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold = 3]%
\setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold = 3]%
\setCJKfamilyfont{zhkai}{KaiTi}[]%
\setCJKfamilyfont{zhfs}{FangSong}[]%
\newcommand*{\songti}{\CJKfamily{zhsong}}
\newcommand*{\heiti}{\CJKfamily{zhhei}}
\newcommand*{\kaishu}{\CJKfamily{zhkai}}
\newcommand*{\fangsong}{\CJKfamily{zhfs}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         公式设置                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\numberwithin{equation}{section} % 设置公式编号格式，按照章节编号计数
\renewcommand{\theequation}{\thesection-\arabic{equation}} % 定义公式编号前缀，形如2-1
\makeatletter % 使@符号可用
\def\tagform@#1{\maketag@@@{公式(#1)}}
\makeatother % 恢复@符号原有意义

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         表格设置                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\captionsetup{labelsep=quad} % 设置表格编号和标题之间的间距
\DeclareCaptionLabelFormat{tableprefix}{表#2} % 定义表格编号格式 #2对应\thetable
\captionsetup[table]{labelformat=tableprefix} % 应用表格编号格式到所有表格
\renewcommand{\captionfont}{\zihao{5}\heiti}
\renewcommand{\thetable}{\thesection-\arabic{table}} %章节数-图序号

% 定义表格相关命令
\newcolumntype{Z}{>{\centering\let\newline\\\arraybackslash\hspace{0bp}}X}
\newcolumntype{Y}{>{\centering\arraybackslash}p{0.1\linewidth}}

\newcommand{\tblcaption}{}
\newcommand{\tblanno}{}
\newcommand{\tblcontext}{}
\newcommand{\tblref}{}

\newcommand{\cautable}[5]{
  \renewcommand{\tblcaption}{#1}
  \renewcommand{\tblanno}{#3}
  \renewcommand{\tblcontext}{#5}
  \renewcommand{\tblref}{#4}
  % \newcolumntype{Y}{>{\centering\arraybackslash\songti\zihao{5}}X}
  \begin{table}[htbp]
    \centering % 表格整体居中
    \begin{threeparttable}
      \zihao{5}
      \songti
      \captionsetup{type=table}
      \ifthenelse{\equal{\tblcaption}{}}{}{
        \caption{\tblcaption}
      }
      \label{\tblref}
      \begin{tabularx}{\linewidth}{#2}
        \tblcontext
      \end{tabularx}
      \ifthenelse{\equal{\tblanno}{}}{}{
        \begin{tablenotes} % 使用 tablenotes 环境添加表格注释
          \zihao{-5} \songti
        \item 表注：\tblanno
        \end{tablenotes}
      }
    \end{threeparttable}
  \end{table}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         图片设置                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\figaddr}{}
\newcommand{\figcap}{}
\newcommand{\figdes}{}
\newcommand{\figwidth}{}
\newcommand{\figref}{}

\DeclareCaptionLabelFormat{figureprefix}{图#2} % 定义表格编号格式
\captionsetup[figure]{labelformat=figureprefix} % 应用表格编号格式到所有表格
\renewcommand{\thefigure}{\thesection-\arabic{figure}}

\newcommand{\caufig}[5]{
  \renewcommand{\figaddr}{#1}
  \renewcommand{\figcap}{#2}
  \renewcommand{\figdes}{#3}
  \renewcommand{\figwidth}{#4}
  \renewcommand{\figref}{#5}

  \begin{figure}[H]
    \centering
    \includegraphics[width=\figwidth \linewidth]{\figaddr}
    \captionsetup{type=figure}
    \caption{\figcap}
    \label{\figref}
    \ifthenelse{\equal{\figdes}{}}{}{
      % \vspace{0.5em}
      \captionsetup{font=small}
      \caption*{\figdes}
    }
  \end{figure}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         封面设置                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 定义封面参数
\newcommand{\thesistitlezh}{}
\newcommand{\thesistitleen}{}
\newcommand{\thesisauthor}{}
\newcommand{\thesisadvisor}{}
\newcommand{\thesiscoadvisor}{}
\newcommand{\thesisfield}{}
\newcommand{\thesiscollege}{}

\renewcommand{\today}{\number\year 年 \number\month 月}

% 定义 \makecover 命令，用于生成封面
\newcommand{\makecover}{%
  \newpage
  % 抑制 Underfull \hbox 警告
  \hbadness=10000

  \thispagestyle{empty}%
  \begin{center}%
    \vspace*{60bp}
    \href{http://www.cau.edu.cn/}{\includegraphics[scale=0.5]{./pictures/title.jpg}}
    \begin{spacing}{1}
      \setlength{\parskip}{9bp}         % 段前段后一行
      \textbf{\zihao{-2}\selectfont\songti 本科生毕业论文（设计）}
    \end{spacing}
    \vspace*{24bp}
    \begin{spacing}{1}
      \setlength{\parskip}{11bp}         % 段前段后一行
      \zihao{2} \heiti \cauget{title}
    \end{spacing}
    \begin{spacing}{1}
      \zihao{3}\bfseries \cauget{title-en}
    \end{spacing}
    \vspace*{24bp}
    \begin{spacing}{2.0}
      {\zihao{4}\songti
        \setlength{\parindent}{1.47cm}\makebox[9em][s]{学生姓名}：\underline{\makebox[14.6em][c]{\cauget{name}}}\\
        \setlength{\parindent}{1.47cm}\makebox[9em][s]{指导教师}：\underline{\makebox[14.6em][c]{\cauget{advisor} \cauget{advisor-title}}}\\
        \setlength{\parindent}{1.47cm}\makebox[9em][s]{合作指导教师}：\underline{\makebox[14.6em][c]{\cauget{co-advisor} \cauget{co-advisor-title}}}\\
        \setlength{\parindent}{1.47cm}\makebox[9em][s]{专业名称}：\underline{\makebox[14.6em][c]{\cauget{major}}}\\
      \setlength{\parindent}{1.47cm}\makebox[9em][s]{所在学院}：\underline{\makebox[14.6em][c]{\cauget{college}}}\\}
    \end{spacing}
    \begin{spacing}{1.0833333333}
      \fontsize{14bp}{1.0\baselineskip}\selectfont
      % \vspace*{10\baselineskip}
      \vspace*{\fill}
      \today
    \end{spacing}
  \end{center}
  \newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                        原创性声明                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makeoriginality}[1]{
  \thispagestyle{empty}
  \para{
    \begin{center}
      \textbf{\heiti \zihao{3} 原创性声明}
    \end{center}
  }
  \vspace*{\baselineskip}
  \par
  \hspace*{.5em}本人郑重声明： \hspace*{.7em}所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作所取得的成果。尽我所知，除文中已经注明引用的内容外，本论文（设计）不含任何其他个人或集体已经发表或撰写过的作品成果。\hspace*{-.5em}对本文的研究做出重要贡献的个人和集体，均已在文中作了明确说明。
  \vspace*{\baselineskip}
  \vspace*{\baselineskip}
  \vspace*{\baselineskip}
  \vspace*{\baselineskip}
  \par
  \hspace*{.5em}本人签名：\raisebox{-0.25\height}{\includegraphics[height=2em]{#1}} \hfill \number\year 年 \number\month 月 \number\day 日
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                       摘要和关键字                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 中文摘要环境
\renewenvironment{abstract}{
  \newpage
  \setcounter{page}{1}%
  \fancypagestyle{empty}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0bp}
    \fancyfoot[C]{\thepage}
  }
  \para{
    \begin{center}
      \textbf{\heiti \zihao{3} 摘\hspace{1em}要}
    \end{center}
  }
  \par
}{
  \par
  \textbf{\zihao{4}关键词：}{\zihao{-4}\cauget{keywords}}
  \newpage
}

% 英文摘要环境
\newenvironment{abstract*}{
  \newpage
  \fancypagestyle{empty}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0bp}
    \fancyfoot[C]{\thepage}
  }
  \para{
    \begin{center}
      \textbf{\zihao{3}Abstract}
    \end{center}
  }
  \par
}{
  \par
  \textbf{\zihao{4}Key words: }{\zihao{-4}\cauget{keywords-en}}
  \newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         目录格式                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\contentsname}{\centering\hfill\zihao{3}\bfseries 目\hspace{1.5em}录\hfill}

\titlecontents{section}
[1.5em]
{\zihao{4}\songti}
{第\zhnumber{\thecontentslabel}章\hspace{0.5em}} % 显示“第x章”
{}
{\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsection}
[4.5em] %缩进
{\indent\zihao{-4}\songti}
{\thecontentslabel\hspace{0.5em}}
{}
{\titlerule*[0.5pc]{.}\contentspage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                      插图和附表环境                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{listoffigtbl}
{
  \titleformat{\section}
  {\zihao{4} \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
  {}
  {0em}
  {} % 标题内容
  \titlespacing*{\section}{0cm}{0cm}{0cm}
  % \patchcmd{\listoffigures}{\section*}{\section}{}{}
  % \patchcmd{\listoftables}{\section*}{\section}{}{}
  \patchcmd{\listoftables}{\section*{\listtablename}}{}{}{}
  % \renewcommand{\listfigurename}{插图}
  \renewcommand{\listtablename}{附表}
  \let\clearpage\relax
  \let\cleardoublepage\relax
  \let\newpage\relax
}{}

\newcommand{\makelistoffigtbl}{
  \newpage
  \section*{插图和附表清单}
  \begin{listoffigtbl}
    \newcommand{\loflabel}{图}
    \let\originalnumberline\numberline
    \renewcommand{\numberline}[1]{\loflabel~##1\hspace*{1em}}
    \listoffigures
    \nobreak
    \nopagebreak
    \newcommand{\lotlabel}{表}
    \renewcommand{\numberline}[1]{\lotlabel~##1\hspace*{1em}}
    \listoftables
    \let\numberline\originalnumberline
  \end{listoffigtbl}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                       正文格式设置                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 一级标题
\titleformat{\section}
{\newpage\centering\zihao{3}\bfseries \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
{第\zhnumber{\thesection} 章~}
{0em}
{} % 标题内容
\titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}

% 二级标题
\titleformat{\subsection}
{\raggedright\zihao{4}\heiti\selectfont} % 更改字体为粗体和大号
{\thesubsection~}
{0em}
{} % 标题内容
\titlespacing*{\subsection}{0cm}{\baselineskip}{\baselineskip}

% 三级标题
\titleformat{\subsubsection}
{\raggedright\zihao{-4}\heiti\selectfont} % 更改字体为粗体和大号
{\thesubsubsection~}
{0em}
{} % 标题内容
\titlespacing*{\subsubsection}{0cm}{0.7\baselineskip}{0.7\baselineskip}

% 正文
\newcommand{\maintext}{}
\newcommand{\para}[1]{
  \renewcommand{\maintext}{#1}
  \setlength{\baselineskip}{20bp}
  {\zihao{-4} \songti \maintext}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                       参考文献格式                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \addbibresource{bibsource.bib} %注意这里bibfile.bib要替换成你的bib文件名
\renewcommand{\bibfont}{\zihao{-5}\songti}
% \newcommand{\bibname}{参考文献}
\setlength{\bibitemsep}{2bp}
\defbibheading{bibliography}[\bibname]{%
\specialsection{#1}}%

\newcommand{\makebib}{
  \titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}
  % \section{参考文献}
  \printbibliography[heading=bibintoc,title=]%打印引用文献
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         致谢格式                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{thank}{
  \newpage
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[R]{\zihao{-5}\songti 致谢} %\leftmark：表示"一级标题"
  \fancyhead[L]{\zihao{-5}\songti 中国农业大学本科生毕业论文（设计）}
  \fancyfoot[C]{\thepage}
  % \section*{\texorpdfstring{致谢}{致谢}}
  \titleformat{\section}
  {\newpage\centering\zihao{3}\bfseries \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
  {}
  {0em}
  {} % 标题内容
  \titlecontents{section}
  [1.5em]
  {\zihao{4}\songti}
  {}
  {}
  {\titlerule*[0.5pc]{.}\contentspage}
  \titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}
  \renewcommand{\thesection}{}
  \section{致谢}
}{
  \begin{flushright}
    \cauget{name} \\
    \today
  \end{flushright}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         附录格式                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\appxcontext}{}

\newcommand{\makeappx}[1]{
  \newpage
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[R]{\zihao{-5}\songti 附录} %\leftmark：表示"一级标题"
  \fancyhead[L]{\zihao{-5}\songti 中国农业大学本科生毕业论文（设计）}
  \fancyfoot[C]{\thepage}
  % \section*{\texorpdfstring{附录}{附录}}
  \titleformat{\section}
  {\newpage\centering\zihao{3}\bfseries \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
  {}
  {0em}
  {} % 标题内容
  \titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}

  \captionsetup{labelsep=quad} % 设置表格编号和标题之间的间距
  % \DeclareCaptionLabelFormat{figureprefix}{图#2} % 定义表格编号格式
  % \captionsetup[figure]{labelformat=figureprefix} % 应用表格编号格式到所有表格
  % \renewcommand{\captionfont}{\bfseries\zihao{5}\heiti}
  \renewcommand{\thefigure}{S-\arabic{figure}}
  \renewcommand{\thetable}{S-\arabic{table}} %章节数-图序号
  \section{附录}
  \renewcommand{\thesection}{}
  % \addcontentsline{toc}{section}{附录}
  \renewcommand{\appxcontext}{#1}
  \appxcontext
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                       作者简介格式                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\baseprofile}{}
\newcommand{\educationpro}{}
\newcommand{\publicationpro}{}
\newcommand{\projectpro}{}
\newcommand{\awardpro}{}
\newcommand{\otherspro}{}

\newcommand{\makeprofile}[6]{
  \newpage
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[R]{\zihao{-5}\songti 作者简介} %\leftmark：表示"一级标题"
  \fancyhead[L]{\zihao{-5}\songti 中国农业大学本科生毕业论文（设计）}
  \fancyfoot[C]{\thepage}
  % \section*{\texorpdfstring{附录}{附录}}
  \titleformat{\section}
  {\newpage\centering\zihao{3}\bfseries \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
  {}
  {0em}
  {} % 标题内容
  \titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}
  \section{作者简介}
  \renewcommand{\thesection}{}
  % \addcontentsline{toc}{section}{附录}
  \renewcommand{\baseprofile}{#1}
  \renewcommand{\educationpro}{#2}
  \renewcommand{\publicationpro}{#3}
  \renewcommand{\projectpro}{#4}
  \renewcommand{\awardpro}{#5}
  \renewcommand{\otherspro}{#6}

  \begin{spacing}{2.1666666667}
    {\par \heiti \zihao{4}基本介绍（姓名、性别、出生日期、籍贯等）: \par}
    \baseprofile
    {\par \heiti \zihao{4}教育经历: \par}
    \educationpro
    {\par \heiti \zihao{4}本科期间发表的学术论文: \par}
    \publicationpro
    {\par \heiti \zihao{4}本科期间主持/参与的科研项目: \par}
    \projectpro
    {\par \heiti \zihao{4}本科期间获得的奖励和荣誉: \par}
    \awardpro
    {\par \heiti \zihao{4}其他成果: \par}
    \otherspro

  \end{spacing}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         代码环境                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\lstset{
  basicstyle=\small,                                   % 环境中的代码字体变小 [在结尾要加逗号！]
  basicstyle=\tt,                                      % 使用 teletype 字体（一种等宽字体）
  columns=fixed,
  numbers=left,                                        % 在左侧显示行号
  breaklines,                                          % 自动换行
  columns=flexible,
  numberstyle=\tiny\color{gray},                       % 设定行号格式
  frame=none,                                          % 不显示背景边框
  backgroundcolor=\color[RGB]{245,245,244},            % 设定背景颜色
  keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
  numberstyle=\footnotesize\color{darkgray},
  commentstyle=\it\color[RGB]{0,96,96},                % 设置代码注释的格式
  stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
  showstringspaces=false,                              % 不显示字符串中的空格
  language=python,                                     % 设置语言
}
