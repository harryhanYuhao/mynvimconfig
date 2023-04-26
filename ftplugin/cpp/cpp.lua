vim.keymap.set('i', '<F3>', '<Esc>:w<CR>:!g++ <C-R>% -std=c++20 -g -pedantic -Wall -Wextra -Wshadow<CR>', {noremap = true}) -- -w to hide warnings
vim.keymap.set('n', '<F3>', ':!./a.out<CR>', {noremap = true})
-- vim.keymap.set('n', '<F4>', ':!./build/project<CR>', {noremap = true})

vim.keymap.set('n', '<leader>fo', ':w<CR>:!clang-format --style=LLVM -i %<CR>', {noremap = true})
