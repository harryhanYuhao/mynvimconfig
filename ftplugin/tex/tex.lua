vim.keymap.set('i', '$', '$$<Esc>i', {noremap = true, silent = true})
vim.opt.iskeyword:append('\\') --consider string-string as a word
vim.opt.iskeyword:append('$') --consider string-string as a word
