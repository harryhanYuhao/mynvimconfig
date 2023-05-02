-- This file contains the global key maps for nvim text editors.

vim.keymap.set('n', '<C-a>', 'G$vgg0', {noremap = true})  -- select all

vim.keymap.set('n', '<F1>',':w <CR>', {noremap = true, silent = false})
vim.keymap.set('n', '\\<F1><F1>',':wq <CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<F1>','<Esc>:w<CR>a', {noremap = true, silent = false})
vim.keymap.set('n', '<leader>s', ')i<CR><Esc>', {noremap = true, silent=false})

-- find/replace keymaps
vim.keymap.set('n', '<leader>no', ':noh<CR>', {noremap = true, silent = false})
-- Editor keymaps
vim.keymap.set('i', '<C-o>', '{<Esc>o}<Esc>ko', {noremap = true, silent = false})
vim.keymap.set('n', '<leader><C-o>', 'a{<Esc>o}<Esc>ko', {noremap = true, silent = false})

-- visual mode select/paste keymaps
vim.keymap.set('v', '<leader>y', '"+y', {noremap = true, silent = false})
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true, silent = false})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true, silent = false})

-- Normal Mode Miscellanious
vim.keymap.set('n', 'J', 'mzJ`z', {noremap = true, silent = false})
vim.keymap.set('n', '<C-d>', '<C-d>zz', {noremap = true, silent = false})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {noremap = true, silent = false})
vim.keymap.set('n', 'n', 'nzz', {noremap = true, silent = false})
vim.keymap.set('n', 'N', 'Nzz', {noremap = true, silent = false})

-- To void Register 
vim.keymap.set('x', '<leader>p', '"_dP', {noremap = true, silent = false})
vim.keymap.set('v', '<leader>d', '"_d', {noremap = true, silent = false})
vim.keymap.set('n', '<leader>d', '"_d', {noremap = true, silent = false})

--------------------------
-- Copilot
--------------------------
local filetype = vim.bo.filetype
local copilot_enable = ":let g:copilot_filetypes = {'" .. filetype .. "': v:true}<CR>:Copilot enable<CR>:Copilot status<CR>"
vim.keymap.set('n', '<F5>',	':Copilot disable<CR>:Copilot status<CR>', {noremap = true, silent = false}) -- disable copilot
vim.keymap.set('n', '\\<F5>', copilot_enable, {noremap = true, silent = false})

vim.g.copilot_no_tab_map =true
vim.api.nvim_set_keymap("i", "<F2>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

--------------------------
--Telescope keymaps
--------------------------
local builtin = require('telescope.builtin')
pcall(require('telescope').load_extension, 'fzf')
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {desc = '[?] Find old files'})
vim.keymap.set('n', '<leader><space>', builtin.buffers, {desc = '[?] Find Existing buffers'})
vim.keymap.set('n',  '<leader>/', function()
	builtin.current_buffer_fuzzy_find (
	require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
		})
end, {desc = '[/] Fuzzily search in current buffer'})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = '[F]ind [F]iles'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = '[F]ind [G]rep'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = '[F]ind [B]uffers'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = '[F]ind [H]elp'})
vim.keymap.set('n', '<leader>fi', builtin.git_files, {desc = '[F]ind G[I]t files'})


--------------------------
-- Undo-tree 
--------------------------
vim.keymap.set('n', '<leader>ud', vim.cmd.UndotreeToggle, {noremap = true, silent = false})

--------------------------
-- NvimTree 
--------------------------
vim.keymap.set('n', '<leader>e',':NvimTreeToggle <CR>', {noremap = true, silent = false})

--------------------------
-- vim fugitive
--------------------------
vim.keymap.set('n', '<leader>gs', ":Git<CR>", {noremap = true, silent = false})

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float, { noremap = true, silent = true })
