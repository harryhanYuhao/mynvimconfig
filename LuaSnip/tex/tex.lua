return{
	s({trig="mb", name="Mathematical Bold", dsc="math bold"},
		{
			t({"\\mathbb{"}),i(1),t({"}"}), i(0),
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
			t({"\\sum^{"}),i(1),t({"}_{"}),i(2),t({"}"}),i(3),t({" "}), 
		}
	),
	s({trig="inf", name="infinity", dsc="infinity"},
		{
			t({"\\infty"}), 
		}
	),

	-- 	"MathPremeableArticle":{
	-- 	"prefix": "preamblematharticle",
	-- 	"body": [
	-- 		"\\documentclass[12pt, a4paper]{article}",
	-- 		"\\usepackage{blindtext, titlesec, amsthm, thmtools, amsmath, amsfonts, scalerel, amssymb, graphicx, titlesec, xcolor, multicol, hyperref}",
	-- 		"\\usepackage[utf8]{inputenc}",
	-- 		"\\hypersetup{colorlinks,linkcolor={red!40!black},citecolor={blue!50!black},urlcolor={blue!80!black}}",
	-- 		"\\newtheorem{theorem}{Theorema}[subsection]",
	-- 		"\\newtheorem{lemma}[theorem]{Lemma}",
	-- 		"\\newtheorem{corollary}[theorem]{Corollarium}",
	-- 		"\\newtheorem{hypothesis}{Coniectura}",			
	-- 		"\\theoremstyle{definition}",
	-- 		"\\newtheorem{definition}{Definitio}[section]\n",
	-- 		"\\theoremstyle{remark}",
	-- 		"\\newtheorem{remark}{Observatio}[section]",
	-- 		"\\newtheorem{example}{Exampli Gratia}[section]",
	-- 		"\\renewcommand\qedsymbol{Q.E.D.}",
	-- 		"\\title{${1:Title}}",
	-- 		"\\author{${2|Harry Han,Harry Han; S2162783|}}",
	-- 		"\\date{${3:Date}}",
	-- 		"\\begin{document}",
	-- 		"\\maketitle",
	-- 		"%\\tableofcontents",
	-- 		"$0",
	-- 		"\\end{document}"
	-- Convert the above to Lua Snippet format
	
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
