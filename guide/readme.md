# Nvim Quick Start

## Useful keymaps

### Normal mode

- `=ap` - format paragraph

## Commonly Missed Dependencies

### Clipboard

If clipboard is not working, try installing xclip.

### Formattor

The short cut for applying format is `<leader>fo`. (Leader by default is space key).

This nvim config use external formattor:
- `black` for python. `python -m pip install black`
- `clang-format` for C, C++



## Lua API 

### Misc

- find file type `:lua print(vim.bo.filetype)`
- find current buffer number `:lua print(vim.fn.bufnr())`
- find current buffer name `:lua print(vim.fn.bufname())`

### keymap 

- `vim.keymap.set('n', '<leader>fo', ':Format<CR>', {noremap = true, silent = true})`

### buffer


