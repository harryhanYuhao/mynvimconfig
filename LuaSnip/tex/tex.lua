local hhyh = require("harry.plugins.hhyh_luasnipInclude")

hhyh.my_LuaSnipBuffer = {{"a", "b"}, "temp Table2"}
function hhyh.toTextNode(list) 
	local textNode = {}
	for i, v in pairs(list) do
		textNode[i] = t(v)
	end
	return textNode
end

function hhyh.scandir()
	local i, t, popen = 0, {}, io.popen
	local pfile = popen('find')
	for filename in pfile:lines() do
		i = i + 1
		t[i] = filename
	end
	pfile:close()
	return t
end

function hhyh.findPictureFiles()
	local all_files = hhyh.scandir() 
	local picture_files = {}
	for k, v in pairs(all_files) do
		if string.match(v, "%.png$") 
			or string.match(v, "%.jpg$")
			or string.match(v, "%.jpeg") then
			table.insert(picture_files, v)
		end
	end
	return picture_files
end 

function searchForPictureRecursively()
	main_found = false
	picture_files ={}
	prev = "./"
	n_iter = 2
	t =  {}

	local function findPictureFiles(all_files)
		local picture_files = {}
		for k, v in pairs(all_files) do
			if string.match(v, "%.png$") 
				or string.match(v, "%.jpg$")
				or string.match(v, "%.jpeg") then
				table.insert(picture_files, v)
			end
		end
		return picture_files
	end 

	local function creatlistofFile()
		pfile = io.popen("find ".._G.prev)
		_G.t = {}
		i = 0

		for line in pfile:lines() do
			i = i + 1
			t[i] = line
		end
		-- print(table.concat(t, " "))
		if string.find(table.concat(t, " "), "main") then
			main_found = true	
			picture_files = findPictureFiles(t)
		else 
			if n_iter > 0 then
				prev = prev .. "../"
				n_iter = n_iter - 1  -- lua has no increment operator
				creatlistofFile()
			end
		end
	end

	creatlistofFile()
	if main_found then
		return picture_files
	else
		return {}
	end 
end


return{
	s({trig="mb", name="Mathematical Bold", dsc="math bold"},
		{
			t({"\\mathbb{"}),i(1),t({"}"}), i(0),
		}
	),
	s({trig="b", name="bb", dsc="bold", priority=1},
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
			t({"\\newcommand{\\bb}[1]{\\mathbb{#1}}",""}),
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

	s({trig="eq", dscr="A LaTeX equation environment"},
		fmt( -- The snippet code actually looks like the equation environment it produces.
			-- [[ ]] are lua string delimiters
			[[ 
			\begin{equation}
				<>
			\end{equation}
			]],
			-- The insert node is placed in the <> angle brackets
			{ i(1) },
			-- This is where I specify that angle brackets are used as node positions.
			{ delimiters = "<>" }
		)
	),
	-- To escape delimiter, repeat it twice
	s(
		{
			trig="envr",
			name="Environment",
			dscr="Auto snippet Expanding Latex Environment, Fitting Begin and End",
			regTrig=true,
		},
		fmt(
			[[
			\begin{<iNode1>}
			<>
			\end{<>}
			]], 
			{
				iNode1 = i(1, "example"), i(0),rep(1),
			},
			{
				delimiters = "<>"
			}
		),
		{
			-- 	callbacks=
			-- 		{
			-- 			[-1] = {  -- [-1] callback for the snippet's own event
			-- 				[events.enter] = function(node, _event_args) 
			-- 					vim.api.nvim_input("aaa")
			-- 					print("2!") end
			-- 			}
			-- 		}
			-- condition = conds_expand.line_begin,
		}
	),
	s({
		trig = "([A-z0-9]+)/([A-z0-9]+)", 
		dscr = [[Expand a/b to \frac{a}{b}]],
		regTrig = true
		},
		f(function(args, snip) return
			"\\frac{" .. snip.captures[1] .. "}" .. "{" .. snip.captures[2] .. "}" end, {})
	),
	s(
	{
		trig = "[{(](.+)[)}]/[{(](.+)[)}]", 
		dscr = [[Expand ((a+b)*c)/(b+d) to \\frac{(a+b)*c}{b+d}]],
		regTrig = true,
	},
		f(function(args, snip) return
			"\\frac{" .. snip.captures[1] .. "}" .. "{" .. snip.captures[2] .. "}" end, {})	
	),

	s(
		{
			trig = "trg" ,
		},
		f(function()
			-- local my_CWD = vim.fn.getcwd()
			local all_files = hhyh.scandir() 
			local picture_files = {}
			for k, v in pairs(all_files) do
				if string.match(v, "%.png$") 
					or string.match(v, "%.jpg$")
					or string.match(v, "%.jpeg") then
					table.insert(picture_files, v)
				end
			end
			return picture_files
			-- return vim.fn.getcwd()
			end, {})
	),
				-- \includegraphics[width=0.8\textwidth]{<>}
	s(
		{
			trig = "findPic" ,
			dscr = "find picture files in current directory, can be cycled through",
		},
		fmt(
			[[
			\begin{figure}[htbp]
				\centering
				\caption{<>}
				\label{fig:<>}
				\includegraphics[width=0.8\textwidth]{<>}
			\end{figure}
			]], 
			{
				 i(1, "Caption"), rep(1), 
		c(2, hhyh.toTextNode(hhyh.findPictureFiles()))
			},
			{
				delimiters = "<>"
			}
	)
	),
	s(
		{
			trig = "reFindPic" ,
			dscr = "recursively find picture files in parent directory unitl finding main, can be cycled through",
		},
		{
			f(function()
				-- hhyh.my_LuaSnipBuffer[1]=hhyh.findPictureFiles()
				-- WARNING: BUG HERE
				hhyh.my_LuaSnipBuffer[1]=searchForPictureRecursively()
				return ""
			end),
			i(1, "Enter Text"),
			t"buu",
			d(2, 
				function() 
					return sn(nil, {
						c(1, hhyh.toTextNode(hhyh.my_LuaSnipBuffer[1]))
					})
				end, {1})
		}
	),
}
