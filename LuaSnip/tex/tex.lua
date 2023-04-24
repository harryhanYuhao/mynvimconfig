return{
	s({trig="mb", name="Mathematical Bold", dsc="math bold"},
		{
			t({"\\mathbb{"}),i(1),t({"}"}), i(0),
		}
	),
	s({trig="b", name="bb", dsc="bold"},
		{
			t({"\\bb{"}),i(1),t({"}"}), i(0),
		}
	),
	s({trig="mc", name="Mathematical Caligraphy ", dsc="math caligraphy"},
		{
			t({"\\mathcal{"}),i(1),t({"}"}), i(0),
		}
	),
	-- rightarrow
	s({trig="ra", name="Arrow", dsc="arrow"},
		{
			t({"\\rightarrow "}), 
		}
	),
	s({trig="od", name="odot", dsc="odot"},
		{
			t({"\\odot "}), 
		}
	),
	s({trig="os", name="oslash", dsc="oslash"},
		{
			t({"\\oslash "}), 
		}
	),
	s({trig="cds", name="cdots", dsc="cdots"},
		{
			t({"\\cdots"}), 
		}
	),
	s({trig="cd", name="cdot", dsc="cdot"},
		{
			t({"\\cdot"}), 
		}
	),
	s({trig="ff", name="fraction", dsc="fraction"},
		{
			t({"\\frac{"}),i(1),t({"}{"}),i(2),t({"}"}), i(0),
		}
	),
	s({trig="fff", name="fractionMath", dsc="fraction"},
		{
			t({"$\\frac{"}),i(1),t({"}{"}),i(2),t({"}$"}), i(0),
		}
	),
	s({trig="fa", name="forall", dsc="forall"},
		{
			t({"\\forall "}), 
		}
	),
	s({trig="dis", name="displaystyle", dsc="displaystyle"},
		{
			t({"\\displaystyle "}), 
		}
	),
	s({trig="exi", name="exists", dsc="exists"},
		{
			t({"\\exists "}), 
		}
	),
	s({trig="sum", name="sum", dsc="sum"},
		{
			t({"\\sum^{"}),i(1),t({"}_{"}),i(2),t({"}"}),i(0),t({" "}), 
		}
	),
	s({trig="inf", name="infinity", dsc="infinity"},
		{
			t({"\\infty"}), 
		}
	),
	s({trig="im", name="implies", dsc="implies"},
		{
			t({"\\implies"}), 
		}
	),
	s({trig="cels", name="celsius", dsc="celsius"},
		{
			t({"^{\\circ}C"}),
		}
	),
	s({trig="sse", name="subseteq", dsc="subseteq"},
		{
			t({"\\subseteq"}),
		}
	),

	-- Set Notations
	-- I have setted \newcommand{\bb}[1]{\mathbb{#1}} 
	s({trig="R", name="Real Number", dsc="Real Number"},
		{
			t({"\\bb{R}"}),
		}
	),

	s({trig="Q", name="Rational Number", dsc="Rational Number"},
		{
			t({"\\bb{Q}"}),
		}
	),

	s({trig="C", name="Complex Number", dsc="Complex Number"},
		{
			t({"\\bb{C}"}),
		}
	),

	s({trig="N", name="Nature Number", dsc="Nature Number"},
		{
			t({"\\bb{N}"}),
		}
	),
	

	s({trig="preambleMathArticle", name="MathPremeableArticle", dsc="MathPremeableArticle"},
		{
			t({"\\documentclass[12pt, a4paper]{article}",""}),
			t({"\\usepackage{blindtext, titlesec, amsthm, thmtools, amsmath, amsfonts, scalerel, amssymb, graphicx, titlesec, xcolor, multicol, hyperref}",""}),
			t({"\\usepackage[utf8]{inputenc}",""}),
			t({"\\hypersetup{colorlinks,linkcolor={red!40!black},citecolor={blue!50!black},urlcolor={blue!80!black}}",""}),
			t({"\\newtheorem{theorem}{Theorema}[subsection]",""}),
			t({"\\newtheorem{lemma}[theorem]{Lemma}",""}),
			t({"\\newtheorem{corollary}[theorem]{Corollarium}",""}),
			t({"\\newtheorem{hypothesis}{Coniectura}",""}),
			t({"\\theoremstyle{definition}",""}),
			t({"\\newtheorem{definition}{Definitio}[section]",""}),
			t({"\\theoremstyle{remark}",""}),
			t({"\\newtheorem{remark}{Observatio}[section]",""}),
			t({"\\newtheorem{example}{Exampli Gratia}[section]",""}),
			t({"\\newcommand{\bb}[1]{\mathbb{#1}}",""}),
			t({"\\renewcommand\\qedsymbol{Q.E.D.}",""}),
			t({"\\title{"}),i(1),t({"}",""}),
			t({"\\author{"}),i(2),t({"}",""}),
			t({"\\date{"}),i(3),t({"}",""}),
			t({"\\begin{document}",""}),
			t({"\\maketitle",""}),
			t({"%\\tableofcontents",""}),
			i(0),
			t({"","\\end{document}",""}),
		}
	),
}
