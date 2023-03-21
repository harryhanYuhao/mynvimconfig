local temp = "i#include <iostream><CR><CR>int main(){<CR>return 0;<CR>}<Esc>kO"

vim.keymap.set('n', '<leader>ii', temp, {noremap = true, silent = true})
vim.keymap.set('i', '<F3>', '<Esc>:w<CR>:!gcc <C-R>% -lm<CR>', {noremap = true}) -- -w to hide warnings
vim.keymap.set('n', '<F3>', ':!./a.out<CR>', {noremap = true})
