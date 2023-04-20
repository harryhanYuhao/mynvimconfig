-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require("luasnip").snippet(
    { trig = "hi" },
    { t("Hello, World!") }
  ),

  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.

	s(
		{ trig = "gitignore" },
		{ 
		t({
				"*.latexmk",
				"*.aux",
				"*.log",
				"*.gz",
				"*.toc",
				"*.bbl",
				"*.bcf",
				"*.xml",
				"*.blg",
				"*.fls",
				"*.out",
				"*.o",
				"*.txt",
			}),
		}
	),
}
