-- Maybe these duplicate code shall be contained in the main init
vim.keymap.set('i', '<F3>', '<Esc>:w<CR>:!python3 <C-R>%<CR>', {noremap = true}) -- -w to hide warnings
vim.keymap.set('n', '<F3>', '<Esc>:w<CR>:!python3 <C-R>%<CR>', {noremap = true}) -- -w to hide warnings
