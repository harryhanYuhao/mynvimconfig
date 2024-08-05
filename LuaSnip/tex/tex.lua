-- Buffer for communcation between user-defined functions and luasnip
local hhyh = {}
hhyh.my_LuaSnipBuffer = {}

function hhyh.toTextNode(table)
	-- Input a table of string, return a table of textNode
	local textNode = {}
	for i, v in pairs(table) do textNode[i] = t(v) end
	return textNode
end

function hhyh.refactoredSearch(findMain, findPictureDir, pictureDirectoryName)
	-- If find main flag is true, find all the picture fill that share the parent directory of the main file. If the main file can not be found in current directory, it will find it recursely in the parent directory (maximum recursion = 4). If multiple main file exist, it will find the main file closest to current directory
	-- If find picture directory flag is true, find all the picture file that are in the directory pictureDirectoryName. If pictureDirectoryName is not found in the current directory, the function will try to find it in parent directory. Maximum traceback = 4. if no pictureDirectoryName is found, it will ignore this flag.
	-- Default value for findMain = false, findPictureDir = false, pictureDirectoryName = "include"
	-- if findMain and findPictureDir are both false, it will find all the picture file in the current directory
	-- true for main take precedence over true for picture directory
	local main_found = false
	local searchDirectory = ""
	local pictureDirectoryName = pictureDirectoryName or "include"
	local pictureDirectoryFound = false
	local findMain = findMain or false
	local findPictureDir = findPictureDir or false
	local searchDirectory

	local function existFile(filename)
		local filename = filename or "include"
		local iter = 4
		local prev = "./"

		::nextRecursive::
		include = io.popen("find " .. prev .. " ")

		for line in include:lines() do
			line = line .. "/"
			if string.find(line, "/" .. filename) then return true, line end
		end
		include:close()

		if iter > 0 then
			iter = iter - 1
			prev = prev .. "../"
			goto nextRecursive
		else
			return false, filename .. " Not found"
		end
	end

	local function s_findAllPictureFiles(directory)
		local res = {}
		local function s_isItPicture(filename)
			v = filename
			if string.match(v, "%.png$") or string.match(v, "%.jpg$") or
				string.match(v, "%.jpeg$") or string.match(v, "%.pdf$") then
				return true
			end
			return false
		end

		local pfile = io.popen("find " .. directory)
		for line in pfile:lines() do
			if s_isItPicture(line) then table.insert(res, line) end
		end
		if #res > 0 then
			return res
		else
			return { "No Picture Found" }
		end
	end
	searchDirectory = "./"

	if findMain then
		main_found, bufdir = existFile("main")
		if main_found then _, _, bufdir = string.find(bufdir, "(.*)main.*$") end
		searchDirectory = bufdir
	elseif findPictureDir then
		pictureDirectoryFound, bufdir = existFile(pictureDirectoryName)
		if pictureDirectoryFound then
			searchDirectory = bufdir
		end
	else
		searchDirectory = "./"
	end

	return s_findAllPictureFiles(searchDirectory)
end

return {
	s({ trig = "mb", name = "Mathematical Bold", dsc = "math bold" },
		{
			t({ "\\mathbb{" }), i(1), t({ "}" }), i(0),
		}
	),
	s({ trig = "b", name = "bb", dsc = "bold", priority = 1 },
		{
			t({ "\\bb{" }), i(1), t({ "}" }), i(0),
		}
	),
	s({ trig = "mc", name = "Mathematical Caligraphy ", dsc = "math caligraphy" },
		{
			t({ "\\mathcal{" }), i(1), t({ "}" }), i(0),
		}
	),
	s({ trig = "pa", name = "partial", dsc = "partial sign" },
		{
			t({ "\\partial " }),
		}
	),
	-- rightarrow
	s({ trig = "ra", name = "Arrow", dsc = "arrow" },
		{
			t({ "\\rightarrow " }),
		}
	),
	s({ trig = "od", name = "odot", dsc = "odot" },
		{
			t({ "\\odot " }),
		}
	),
	s({ trig = "os", name = "oslash", dsc = "oslash" },
		{
			t({ "\\oslash " }),
		}
	),
	s({ trig = "cds", name = "cdots", dsc = "cdots" },
		{
			t({ "\\cdots" }),
		}
	),
	s({ trig = "cd", name = "cdot", dsc = "cdot" },
		{
			t({ "\\cdot" }),
		}
	),
	s({ trig = "ff", name = "fraction", dsc = "fraction" },
		{
			t({ "\\frac{" }), i(1), t({ "}{" }), i(2), t({ "}" }), i(0),
		}
	),
	s({ trig = "fff", name = "fractionMath", dsc = "fraction" },
		{
			t({ "$\\frac{" }), i(1), t({ "}{" }), i(2), t({ "}$" }), i(0),
		}
	),
	s({ trig = "fa", name = "forall", dsc = "forall" },
		{
			t({ "\\forall " }),
		}
	),
	s({ trig = "dis", name = "displaystyle", dsc = "displaystyle" },
		{
			t({ "\\displaystyle " }),
		}
	),
	s({ trig = "exi", name = "exists", dsc = "exists" },
		{
			t({ "\\exists " }),
		}
	),
	s({ trig = "sum", name = "sum", dsc = "sum" },
		{
			t({ "\\sum^{" }), i(1), t({ "}_{" }), i(2), t({ "}" }), i(0), t({ " " }),
		}
	),
	s({ trig = "inf", name = "infinity", dsc = "infinity" },
		{
			t({ "\\infty" }),
		}
	),
	s({ trig = "im", name = "implies", dsc = "implies" },
		{
			t({ "\\implies" }),
		}
	),
	s({ trig = "cels", name = "celsius", dsc = "celsius" },
		{
			t({ "^{\\circ}C" }),
		}
	),
	s({ trig = "sse", name = "subseteq", dsc = "subseteq" },
		{
			t({ "\\subseteq" }),
		}
	),

	-- Set Notations
	-- I have setted \newcommand{\bb}[1]{\mathbb{#1}}
	s({ trig = "R", name = "Real Number", dsc = "Real Number" },
		{
			t({ "\\bb{R}" }),
		}
	),

	s({ trig = "Q", name = "Rational Number", dsc = "Rational Number" },
		{
			t({ "\\bb{Q}" }),
		}
	),

	s({ trig = "C", name = "Complex Number", dsc = "Complex Number" },
		{
			t({ "\\bb{C}" }),
		}
	),

	s({ trig = "N", name = "Nature Number", dsc = "Nature Number" },
		{
			t({ "\\bb{N}" }),
		}
	),

	s({ trig = "preambleMathArticle", name = "MathPremeableArticle", dsc = "MathPremeableArticle" },
		{
			t({ "\\documentclass[12pt, a4paper]{article}", "" }),
			t({
				"\\usepackage{blindtext, titlesec, amsthm, thmtools, amsmath, amsfonts, scalerel, amssymb, graphicx, titlesec, xcolor, multicol, hyperref}",
				"" }),
			t({ "\\usepackage[utf8]{inputenc}", "" }),
			t({ "\\hypersetup{colorlinks,linkcolor={red!40!black},citecolor={blue!50!black},urlcolor={blue!80!black}}",
				"" }),
			t({ "\\newtheorem{theorem}{Theorema}[subsection]", "" }),
			t({ "\\newtheorem{lemma}[theorem]{Lemma}", "" }),
			t({ "\\newtheorem{corollary}[theorem]{Corollarium}", "" }),
			t({ "\\newtheorem{hypothesis}{Coniectura}", "" }),
			t({ "\\theoremstyle{definition}", "" }),
			t({ "\\newtheorem{definition}{Definitio}[section]", "" }),
			t({ "\\theoremstyle{remark}", "" }),
			t({ "\\newtheorem{remark}{Observatio}[section]", "" }),
			t({ "\\newtheorem{example}{Exampli Gratia}[section]", "" }),
			t({ "\\newcommand{\\bb}[1]{\\mathbb{#1}}", "" }),
			t({ "\\renewcommand\\qedsymbol{Q.E.D.}", "" }),
			t({ "\\title{" }), i(1), t({ "}", "" }),
			t({ "\\author{" }), i(2), t({ "}", "" }),
			t({ "\\date{" }), i(3), t({ "}", "" }),
			t({ "\\begin{document}", "" }),
			t({ "\\maketitle", "" }),
			t({ "%\\tableofcontents", "" }),
			i(0),
			t({ "", "\\end{document}", "" }),
		}
	),

	s({ trig = "proof", dscr = "A LaTeX proof environment" },
		fmt( -- The snippet code actually looks like the equation environment it produces.
		-- [[ ]] are lua string delimiters
			[[
			\begin{proof}
				<>
			\end{proof}
			]],
			-- The insert node is placed in the <> angle brackets
			{ i(1) },
			-- This is where to specify that angle brackets are used as node positions.
			-- To escape delimiter, repeat it twice
			{ delimiters = "<>" }
		)
	),
	s({ trig = "eq", dscr = "A LaTeX equation environment" },
		fmt( -- The snippet code actually looks like the equation environment it produces.
		-- [[ ]] are lua string delimiters
			[[
			\begin{equation}
				<>
			\end{equation}
			]],
			-- The insert node is placed in the <> angle brackets
			{ i(1) },
			-- This is where to specify that angle brackets are used as node positions.
			-- To escape delimiter, repeat it twice
			{ delimiters = "<>" }
		)
	),
	s(
		{
			trig = "envr",
			name = "Environment",
			dscr = "Auto snippet Expanding Latex Environment, Fitting Begin and End",
			regTrig = true,
		},
		fmt(
			[[
			\begin{<iNode1>}
			<>
			\end{<>}
			]],
			{
				iNode1 = i(1, "example"), i(0), rep(1),
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
		f(function(args, snip)
			return
				"\\frac{" .. snip.captures[1] .. "}" .. "{" .. snip.captures[2] .. "}"
		end, {})
	),
	s(
		{
			trig = "[{(](.+)[)}]/[{(](.+)[)}]",
			dscr = [[Expand ((a+b)*c)/(b+d) to \\frac{(a+b)*c}{b+d}]],
			regTrig = true,
		},
		f(function(args, snip)
			return
				"\\frac{" .. snip.captures[1] .. "}" .. "{" .. snip.captures[2] .. "}"
		end, {})
	),
	s(
		{
			trig = "(s+)ec",
			dscr = "(sub)section",
			regTrig = true,
			docstring = [[Expand sec to \section{}, ssec to \subsection{}, sssec to \subsubsection{}, etc.]]
		},
		{
			f(function(args, snip)
				local cap = snip.captures[1]
				local prefix = ""
				for i = 1, #cap - 1 do prefix = prefix .. "sub" end
				return "\\" .. prefix .. "section" .. "{"
			end, {}),
			i(1, "section title"), t({ "}", "" }) }
	),
	-- This code words with a small bug: If the buffer is opened befored the creation of the picture files, the picture files would not be detected
	-- s(
	-- 	{
	-- 		trig = "Picture_Insert_Current" ,
	-- 		dscr = "find picture and insert files in current directory, can be cycled through",
	-- 	},
	-- 	fmt(
	-- 		[[
	-- 		\begin{figure}[htbp]
	-- 			\centering
	-- 			\caption{<>}
	-- 			\label{fig:<>}
	-- 			\includegraphics[width=0.8\textwidth]{<>}
	-- 		\end{figure}
	-- 		]],
	-- 		{
	-- 			i(1, "Caption"), rep(1),
	-- 			c(2, hhyh.toTextNode(hhyh.refactoredSearch()))
	-- 		},
	-- 		{
	-- 			delimiters = "<>"
	-- 		}
	-- 	)
	-- ),

	s(
		{
			trig = "Picture_Insert_include",
			dscr = "find all picture files contained in current directory"
		},
		fmt(
			[[
			\begin{figure}[htbp]
				\centering<>
				\label{fig:<>}
				\includegraphics[width=0.8\textwidth]{<>}
				\caption{<>}
			\end{figure}
			]],
			{
				f(function() -- a dummy function just to modify a sharing buffer
					hhyh.my_LuaSnipBuffer[1] = hhyh.refactoredSearch(false, true)
					return ""
				end),
				i(1, "Caption"), rep(1),
				d(2, -- dynamic node required here for checking updated local variable
					function()
						return sn(nil, {
							c(1, hhyh.toTextNode(hhyh.my_LuaSnipBuffer[1]))
						})
					end, { 1 })
			},
			{ delimiters = "<>" }
		) -- for fmt()
	), -- for s()
	s(
		{
			trig = "Picture_Insert",
			dscr = "find all picture files contained in current directory"
		},
		fmt(
			[[
			\begin{figure}[htbp]
				\centering<>
				\label{fig:<>}
				\includegraphics[width=0.8\textwidth]{<>}
				\caption{<>}
			\end{figure}
			]],
			{
				f(function()
					hhyh.my_LuaSnipBuffer[1] = hhyh.refactoredSearch()
					return ""
				end),
				i(1, "Caption"), rep(1),
				d(2, -- dynamic node required here for checking updated local variable
					function()
						return sn(nil, {
							c(1, hhyh.toTextNode(hhyh.my_LuaSnipBuffer[1]))
						})
					end, { 1 })
			},
			{ delimiters = "<>" }
		) -- for fmt()
	), -- for s()
}
