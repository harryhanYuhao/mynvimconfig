local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

ls.config.set_config {
	history = true,
	updateevents = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged,InsertLeave", -- or maybe "InsertLeave"
	region_check_events = "CursorMoved", -- or maybe "InsertLeave"
	enable_autosnippets = true,
}

-- vim.cmd[[
-- " Expand snippets in insert mode with Tab
--
-- " Jump forward in through tabstops in insert and visual mode with Control-f
-- imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
-- smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
--
-- " Cycle forward through choice nodes with Control-f (for example)
-- imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
-- smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
-- ]]

-- If jumpable, expand, else, tab
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
	end
end, { silent = true, noremap = true })


vim.keymap.set({ "i", "s" }, "<C-f>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
	end
end, { silent = true, noremap = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", true)
	end
end, { silent = true, noremap = true })

vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-l>", true, false, true), "n", true)
	end
end, { silent = true, noremap = true })
