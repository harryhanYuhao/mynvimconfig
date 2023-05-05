vim.keymap.set('i', '<F3>', '<Esc>:w<CR>:!lua <C-R>% <CR>', {noremap = true}) -- -w to hide warnings
vim.keymap.set('n', '<F3>', '<Esc>:w<CR>:!lua <C-R>% <CR>', {noremap = true}) -- -w to hide warnings
vim.keymap.set('n', '<leader>fo', ':w<CR>:!lua-format -i --indent-width=2 --tab-width=2 --align-args --align-parameter --align-table-field --break-after-table-lb --chop-down-table --column-limit=80 <C-R>% <CR>', {noremap = true}) -- -w to hide warnings

