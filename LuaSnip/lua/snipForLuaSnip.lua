return{
	s({
		trig = "snip",
		dscr = "A lua snippet for luaSnip",
		},
		fmt(  -- [[]] in lua are string delimiters
			[[
					s(
					{
						trig = "<>",
						dscr = "<>",
					},
					{
					<>
					}
					),
			]], { i(1, 'trigge'), i(2, "An Example Snippet (Press Tab)"), i(0, "t({\"sample\"})")} , { delimiters = "<>"}
		),
		{
			callbacks =
				{
					[-1] = {
						[events.enter] = function(node, _event_args)
							-- feed escape key
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", true) 
							vim.api.nvim_feedkeys("=apzzi", "n", false)
						end
					}
			}
		}
	),
}
