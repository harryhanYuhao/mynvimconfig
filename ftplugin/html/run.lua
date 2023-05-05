local prettier = ':!npx prettier --write %<CR>'
vim.keymap.set('n', '<F3>', ':! firefox %<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fo', prettier, { noremap = true })
