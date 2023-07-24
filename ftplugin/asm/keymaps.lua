-- For mips assembly language
-- vim.keymap.set('i', '<F3>', '<Esc>:w<CR>:!mars <C-R>% <CR>', {noremap = true}) -- -w to hide warnings
-- vim.keymap.set('n', '<F3>', '<Esc>:w<CR>:!mars <C-R>% <CR>', {noremap = true}) -- -w to hide warnings



------------ For x86
vim.keymap.set('n', '<F3>', '<Esc>:!./a.out<CR>', {noremap = true}) -- -w to hide warnings
vim.keymap.set('i', '<F3>', '<Esc>:w<CR>:!nasm -o object -felf64 <C-R>% <CR><Esc>: ld object -o a.out<CR>', {noremap = true}) -- -w to hide warnings

