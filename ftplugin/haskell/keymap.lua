vim.opt.expandtab = true
vim.keymap.set('i', '<F3>', '<Esc>:w<CR>:!ghc -o a.out <C-R>% <CR>', {noremap = true}) -- -w to hide warnings
vim.keymap.set('n', '<F3>', ':!./a.out<CR>', {noremap = true})
