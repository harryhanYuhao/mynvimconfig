vim.cmd[[let g:vimtex_view_method = 'zathura']]
vim.cmd[[syntax enable]]
vim.cmd[[filetype plugin indent on]]
vim.cmd[[syntax on]]
vim.cmd[[set hidden]]
vim.cmd[[let g:tex_flavor = 'latex']]
vim.cmd[[let g:vimtex_complete_enabled = 1]]
vim.cmd[[let g:vimtex_quickfix_ignore_filters = [
	\'Underfull',
	\'Overfull',
	\'LaTeX Font Warning',
	\]
]]
--vim.cmd[[let g:vimtex_quickfix_open_on_warning = 0]]
vim.cmd[[let g:vimtex_complete_close_braces = 1]]

vim.keymap.set('n', '<F4>', ':VimtexTocToggle<CR>', {noremap = true})
vim.keymap.set('i', '<F4>', ':VimtexTocToggle<CR>', {noremap = true})
