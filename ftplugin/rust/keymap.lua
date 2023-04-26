vim.keymap.set('i', '<F3>',  "<Esc>:w<CR>:!rustc <C-R>% -o a.out <CR>", {noremap = true})
vim.keymap.set('n', '<F3>', ':!./a.out<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fo',  "<Esc>:w<CR>:!rustfmt <C-R>%  <CR>", {noremap = true})
