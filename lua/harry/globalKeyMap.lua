-- This file contains the global key maps for nvim text editors.

vim.keymap.set('n', '<C-a>', 'G$vgg0', {noremap = true})

vim.keymap.set('n', '<F5>',	':Copilot disable<CR>', {noremap = true, silent = false}) -- disable copilot
vim.keymap.set('n', '\\<F5>',':Copilot enable<CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<leader>e',':NvimTreeToggle <CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<F1>',':w <CR>', {noremap = true, silent = false})
vim.keymap.set('n', '\\<F1>',':wq <CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<F1>','<Esc>:w<CR>a', {noremap = true, silent = false})
vim.keymap.set('n', '<F4>', ':!bash bash.sh<CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<leader>s', ')i<CR><Esc>', {noremap = true, silent=false})


-- find/replace keymaps
vim.keymap.set('n', '<leader>no', ':noh<CR>', {noremap = true, silent = false})
-- Editor keymaps
vim.keymap.set('i', '<C-o>', '{<Esc>o}<Esc>ko', {noremap = true, silent = false})
vim.keymap.set('n', '<leader><C-o>', 'a{<Esc>o}<Esc>ko', {noremap = true, silent = false})

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float, { noremap = true, silent = true })
