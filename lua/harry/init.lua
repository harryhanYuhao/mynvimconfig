require('harry.pluginsetup')
require('harry.plugins.telescope')
require('harry.plugins.treesitter')
require('harry.plugins.nvim-tree')
require('harry.plugins.luasnip')
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
require("harry.plugins.cmp")
require("Comment").setup()
--require('harry.plugins.lsp')
require('harry.globalKeyMap')

if vim.o.filetype == "lua" then
	print("ss")
end
print(vim.o.filetype)

print("I LOVE CHEMISTRY")
print("Gaudeamus igitur, iuvenes dum sumus!")
print("Post iucundam iuventutem, post molestam senectutem, nos habebit humus.")
print("Ubi sunt qui ante nos in mundo fuere?")
print("Vadite ad superos, transite ad inferos, ubi iam fuere?")
print("Vita nostra brevis est, brevi finietur.")
print("Venit mors velociter, rapit nos atrociter, nemini parcetur.")
print("Vivat academia, vivant professores, semper sint in flore!")
print("Vivant omnes virgines. faciles, formosae, vivant et mulieres, tenerae, amabiles!")
print("Vivat et respublica, et qui illam regit. Vivat nostra civitas, Maecenatum caritas, quae nos hic protegit!")
print("Alma Mater floreat, quae nos educavit, caros et commilitones, dissitas in regiones, sparsos congregavit!")
print("Gwen is so beautiful!")
print("Tatiana is so gorgeous!")
print("Huari is so handsome!")
print("I love you, my dear!")
print("I wish you all have courage and strength to face the difficulties in your life!")
print("It was the best of the times, it was the worst of the times.")
print("It was the age of wisdom, it was the age of foolishness.")
print("It was the epoch of belief, it was the epoch of incredulity.")
print("It was the season of Light, it was the season of Darkness.")
print("It was the spring of hope, it was the winter of despair.")
print("We had everything before us, we had nothing before us.")
print("We were all going direct to Heaven, we were all going direct the other way.")
print("In short, the period was so far like the present period, that some of its noisiest authorities insisted on its being received, for good or for evil, in the superlative degree of comparison only.")

vim.wo.number = true;
vim.wo.relativenumber = true;
vim.g.mapleader = ' ' -- set leader key to space

vim.cmd[[let g:copilot_filetypes={
\'cpp': v:false,
\'py': v:true,
\'markdown': v:true,
\'txt': v:true,
\'c': v:false,
\}]]

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- ignore case unless there is a capital letter in the search

--vim code for this is :set ignorecase

vim.opt.iskeyword:append('-') --consider string-string as a word
vim.opt.iskeyword:append('_') --consider string_string as a word
vim.opt.iskeyword:append('.') --consider string/string as a word

vim.o.termguicolors = true -- enable 24-bit RGB colors


vim.o.breakindent = true -- wrap text with indent
vim.o.undofile = true -- enable undo
vim.o.mouse = 'a' -- enable mouse

-- genearl keymaps
vim.keymap.set('n', '<F5>',	':Copilot disable<CR>', {noremap = true, silent = false}) -- disable copilot
vim.keymap.set('n', '\\<F5>',':Copilot enable<CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<leader>e',':NvimTreeToggle <CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<F1>',':w <CR>', {noremap = true, silent = false})
vim.keymap.set('n', '\\<F1>',':wq <CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<F1>','<Esc>:w<CR>a', {noremap = true, silent = false})
vim.keymap.set('n', '<F4>', ':!bash bash.sh<CR>', {noremap = true, silent = false})

-- find/replace keymaps
vim.keymap.set('n', '<leader>no', ':noh<CR>', {noremap = true, silent = false})
-- Editor keymaps
vim.keymap.set('i', '<C-o>', '{<Esc>o}<Esc>ko', {noremap = true, silent = false})
vim.keymap.set('n', '<leader><C-o>', 'a{<Esc>o}<Esc>ko', {noremap = true, silent = false})

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float, { noremap = true, silent = true })

vim.g.copilot_no_tab_map =true
vim.api.nvim_set_keymap("i", "<F2>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

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

--AutoSaveFolds
vim.cmd[[ 
augroup AutoSaveFolds 
  autocmd!
  autocmd BufWritePost * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
]]
--vim.cmd[[set fillchars=fold:\ ]]


--colorscheme
--Available colorschemes: gruvbox, nord, 
vim.cmd [[let g:gruvbox_contrast_dark = 'hard']] -- vim.cmd [[ ]] will run vim code in lua file.
vim.cmd [[colorscheme gruvbox]] -- set colorscheme, gruvbox is from morhetz/gruvbox

-- See :help lualine.txt
-- dependent on lualine plugin
require('lualine').setup {
  options = {
	theme = 'gruvbox',
	icons_enabled = false,
	component_separators = '|',
	section_separators = '',
  },
}

require('indent_blankline').setup {
	char = '┊',
	show_trailing_blankline_indent = false,
}

--require("mason").setup({
--    ui = {
--        icons = {
--            package_installed = "✓",
--            package_pending = "➜",
--            package_uninstalled = "✗"
--        }
--    }
--})

require("nvim-treesitter.install").prefer_git = true -- To circumvent the tree-sitter can not download bug.
-- vim.cmd[[let g:vimtex_view_method='sioyek']]
vim.cmd[[let g:vimtex_view_method='zathura']]
