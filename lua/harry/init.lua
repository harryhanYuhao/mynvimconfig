require('harry.pluginsetup')
require('harry.plugins.telescope')
require('harry.plugins.luasnip')
require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath "config" .. "/LuaSnip/" })
require("harry.plugins.cmp")
require("harry.plugins.todo")
require('harry.plugins.lsp')

-- print("I LOVE CHEMISTRY")
-- print("Gaudeamus igitur, iuvenes dum sumus!")
-- print("Post iucundam iuventutem, post molestam senectutem, nos habebit humus.")
-- print("Ubi sunt qui ante nos in mundo fuere?")
-- print("Vadite ad superos, transite ad inferos, ubi iam fuere?")
-- print("Vita nostra brevis est, brevi finietur.")
-- print("Venit mors velociter, rapit nos atrociter, nemini parcetur.")
-- print("Vivat academia, vivant professores, semper sint in flore!")
-- print("Vivant omnes virgines. faciles, formosae, vivant et mulieres, tenerae, amabiles!")
-- print("Vivat et respublica, et qui illam regit. Vivat nostra civitas, Maecenatum caritas, quae nos hic protegit!")
-- print("Alma Mater florent, quae nos educavit, caros et commilitones, dissitas in regiones, sparsos congregavit!")

vim.wo.number = true;
vim.wo.relativenumber = true;

-- vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- ignore case unless there is a capital letter in the search

--vim code for this is :set ignorecase
vim.opt.iskeyword:append('-') --consider string-string as a word
vim.opt.iskeyword:append('_') --consider string_string as a word
-- vim.opt.iskeyword:append('.') --consider string/string as a word

vim.o.termguicolors = true -- enable 24-bit RGB colors

vim.o.breakindent = true -- wrap text with indent
vim.o.undofile = true    -- enable undo
vim.o.mouse = 'a'        -- enable mouse

-- Keymaps
vim.g.mapleader = ' '      -- set leader key to space
vim.g.maplocalleader = ' ' -- set local leader key to space

require('harry.globalKeyMap')

--AutoSaveFolds
vim.cmd [[
augroup AutoSaveFolds
  autocmd!
  autocmd BufWritePost * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
]]
-- vim.cmd[[set fillchars=fold:\ ]]

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

vim.cmd [[
set path+=.
set path+=..
set path+=/usr/include/
]]
--colorscheme
-- The color scheme are depending on plugins
--Available colorschemes: gruvbox, nord, tokyonight
-- I like
-- vim.cmd [[let g:gruvbox_contrast_dark = 'hard']] -- vim.cmd [[ ]] will run vim code in lua file.
-- vim.cmd [[highlight! Normal guibg=NONE ctermbg=NONE]] -- set background to none
-- vim.cmd [[colorscheme gruvbox]]
-- Recall to change lualine theme in harry.pluginsetup.lua
-- vim.cmd [[colorscheme tokyonight-day]]
-- vim.cmd [[set background=light]]
vim.cmd [[colorscheme gruvbox]]
vim.cmd [[set background=dark]]

vim.cmd [[hi! link SignColumn LineNr]]

-- Has to be here because of the autoloading of texlive
-- Config on textlive can not be place in the ftplugin/tex.lua folder because it will be loaded after the texlive plugin.
vim.cmd [[let g:vimtex_view_method='zathura']]
