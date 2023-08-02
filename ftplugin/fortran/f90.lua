vim.keymap.set('i', '<F3>', '<Esc>:w<CR>:!gfortran <C-R>% -pedantic -Wall -Wextra <CR>', {noremap = true}) -- -w to hide warnings
vim.keymap.set('n', '<F3>', ':!./a.out<CR>', {noremap = true})
