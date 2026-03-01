\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scut}[2025/11/24 SCUT Thesis Template]

% 基于 ctexbook 开发 (自带中文支持)
% a4paper: A4纸 zihao=-4: 正文默认小四号字体
\LoadClass[UTF8, a4paper,openany,zihao=-4]{ctexbook}

% 依赖声明
\RequirePackage{geometry}
\RequirePackage{amsmath, amssymb} % 数学公式
\RequirePackage{algorithm}        % 算法环境
\RequirePackage{algorithmic}      % 算法伪代码
\RequirePackage{xcolor}           % 颜色支持
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入：}}
\renewcommand{\algorithmicensure}{\textbf{输出：}}
\RequirePackage{graphicx}         % 图片支持
\RequirePackage{caption}          % 图表标题格式
\RequirePackage{placeins}          % 提供 \FloatBarrier 命令
\RequirePackage{booktabs}         % 三线表
\RequirePackage{multirow}         % 跨行表格
\RequirePackage{tabularx}        % 自适应宽度表格 (用于封面标题)
\RequirePackage{ragged2e}        % 提供 \justifying 命令用于分散对齐
\RequirePackage{fontspec}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages} 
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[
  backend=biber,
  style=gb7714-2015,
  gbalign=gb7714-2015,
  gbpub=false,
  gbnamefmt = lowercase
]{biblatex} %
\RequirePackage[titles]{tocloft}

% 页面边距
\geometry{top=25mm, bottom=25mm, left=25mm, right=25mm, headheight=1.5cm,footskip=1cm}

% 字体设置
\setmainfont{Times New Roman}
\setCJKmainfont{SimSun}[AutoFakeBold=5]
\setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=5]


% \setCJKfamilyfont{zhhei}{SimHei}
% \setCJKsansfont{SimHei}       % 黑体文件
% \doublespacing
% \linespread{1.5}
% \onehalfspacing
\setstretch{1.63} 
\setlength{\parskip}{0pt} % 段落间额外间距设为0

% 放宽浮动体放置参数，避免图表被推迟到章末
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.70}
\renewcommand{\textfraction}{0.15}
\renewcommand{\floatpagefraction}{0.60}
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{5}

% 缩小浮动体与正文之间的间距
\setlength{\textfloatsep}{10pt plus 2pt minus 2pt}
\setlength{\floatsep}{8pt plus 2pt minus 2pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}

% 图表标题格式："图 x-y 内容"（无冒号，编号用短横线，五号字，紧凑间距）
\captionsetup{labelsep=space, font=small, aboveskip=4pt, belowskip=2pt}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

% 公式编号格式：(x-y)
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\renewcommand{\thealgorithm}{\thechapter-\arabic{algorithm}}

% 公式上下间距（通过 \everydisplay 确保不被字号切换覆盖）
\everydisplay\expandafter{%
  \the\everydisplay
  \abovedisplayskip=10pt
  \belowdisplayskip=10pt
}

% 标题样式设置
\ctexset{
  chapter = {
      format = \centering\zihao{-2}\heiti, % 二号黑体，居中
      beforeskip = 0.5\baselineskip, % 段前间距 (微调，规范说0.5行)
      afterskip = \baselineskip,   % 段后间距
      fixskip = true,
  },
  section = {
      format = \raggedright\zihao{-3}\heiti, % 小三号黑体，居左
      beforeskip = \baselineskip,
      afterskip = 0.5\baselineskip,
      fixskip = true,
  },
  subsection = {
      format = \raggedright\zihao{4}\heiti, % 四号黑体，居左
      beforeskip = \baselineskip,
      afterskip = 0.5\baselineskip,
      fixskip = true,
  },
  contentsname = {目\hspace{1em}录},
  listfigurename = {插图目录},
  listtablename = {表格目录},
}

% 页眉页脚设置
\fancypagestyle{scutstyle}{
    \fancyhf{} % 清空默认设置
    \renewcommand{\headrulewidth}{1.5pt} % 页眉线宽 1.5 磅 (约 1.5pt)
    \fancyhead[CE]{\zihao{5}\songti 华南理工大学硕士学位论文} % 偶数页(Even)页眉中心(Center)
    \fancyhead[CO]{\zihao{5}\songti \leftmark} % \leftmark 自动获取当前章标题
    \fancyfoot[C]{\zihao{5}\thepage} % 页脚中心(Center): 页码
}
% 设置章标题在页眉中的显示格式（去掉“Chapter 1”这种英文写法，只保留“第一章 绪论”）
\renewcommand{\chaptermark}[1]{\markboth{\CTEXthechapter\quad #1}{}}

% 论文信息变量定义 (全局变量，统一使用 scut@ 前缀)
% 中文信息
\def\scut@ctitlelinea{}          % 中文标题第一行
\def\scut@ctitlelineb{}          % 中文标题第二行
\def\scut@cauthor{}              % 中文作者姓名
\def\scut@cmajor{}               % 中文专业名称
\def\scut@csupervisor{}          % 中文指导教师
\def\scut@college{}              % 学院名称
\def\scut@submitdate{}           % 论文提交日期
\def\scut@thesisname{}           % 论文类型名称
% 英文信息
\def\scut@etitle{}               % 英文标题
\def\scut@eauthor{}              % 英文作者姓名
\def\scut@esupervisor{}          % 英文指导教师
\def\scut@edegree{Master}        % 英文学位类型
% 扉页/提名页信息
\def\scut@classcode{}            % 分类号
\def\scut@schoolcode{10561}      % 学校代码 (默认华工代码)
\def\scut@studentid{}            % 学号
\def\scut@applydegree{}          % 申请学位级别
\def\scut@researchfield{}        % 研究方向
\def\scut@defensedate{}          % 论文答辩日期
\def\scut@grantunit{华南理工大学} % 学位授予单位
\def\scut@grantdate{}            % 学位授予日期
\def\scut@chair{}                % 答辩委员会主席
\def\scut@members{}              % 答辩委员会委员
% 对外接口命令定义
% 中文信息设置命令
\newcommand{\titlelinea}[1]{\def\scut@ctitlelinea{#1}}
\newcommand{\titlelineb}[1]{\def\scut@ctitlelineb{#1}}
\renewcommand{\author}[1]{\def\scut@cauthor{#1}}
\newcommand{\major}[1]{\def\scut@cmajor{#1}}
\newcommand{\supervisor}[1]{\def\scut@csupervisor{#1}}
\newcommand{\college}[1]{\def\scut@college{#1}}
\newcommand{\submitdate}[1]{\def\scut@submitdate{#1}}
\newcommand{\thesisname}[1]{\def\scut@thesisname{#1}}
% 英文信息设置命令
\newcommand{\etitle}[1]{\def\scut@etitle{#1}}
\newcommand{\eauthor}[1]{\def\scut@eauthor{#1}}
\newcommand{\esupervisor}[1]{\def\scut@esupervisor{#1}}
\newcommand{\edegree}[1]{\def\scut@edegree{#1}}
% 扉页/提名页信息设置命令
\newcommand{\classcode}[1]{\def\scut@classcode{#1}}
\newcommand{\schoolcode}[1]{\def\scut@schoolcode{#1}}
\newcommand{\studentid}[1]{\def\scut@studentid{#1}}
\newcommand{\applydegree}[1]{\def\scut@applydegree{#1}}
\newcommand{\researchfield}[1]{\def\scut@researchfield{#1}}
\newcommand{\defensedate}[1]{\def\scut@defensedate{#1}}
\newcommand{\grantunit}[1]{\def\scut@grantunit{#1}}
\newcommand{\grantdate}[1]{\def\scut@grantdate{#1}}
\newcommand{\chair}[1]{\def\scut@chair{#1}}
\newcommand{\members}[1]{\def\scut@members{#1}}

% 封面
\input{main/_front/scut_cover}
\input{main/_front/eng_cover}
\input{main/_front/scut_titlepage}

% 原创性声明
\newcommand{\makedeclaration}{
    \clearpage
    \includepdf[pages=-, pagecommand={\thispagestyle{empty}}]{main/_front/原创性声明.pdf}
}

% 目录
\setlength{\cftbeforechapskip}{0pt}  % 章前间距
\setlength{\cftbeforesecskip}{0pt}   % 节前间距
\renewcommand{\cftchapfont}{\heiti\zihao{-4}}
\renewcommand{\cftchappagefont}{\heiti\zihao{-4}}
\renewcommand{\cftsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsecpagefont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecpagefont}{\songti\zihao{-4}}
\renewcommand{\cftchapleader}{\normalfont\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftdotsep}{1.5}            % 点的密集程度
\renewcommand{\cftchapdotsep}{\cftdotsep} % 章的点间距与其他级别一致
\newcommand{\maketableofcontents}{
    \clearpage
    \tableofcontents
    \addcontentsline{toc}{chapter}{插图目录} 
    \listoffigures
    \addcontentsline{toc}{chapter}{表格目录} 
    \listoftables
}

% 参考文献
\renewcommand*{\bibfont}{\zihao{5}\songti\setstretch{1.5}}
\setlength{\bibitemsep}{3pt} % 条目间垂直间距，单位pt/mm/em
\addbibresource{main/_back/ref.bib}
