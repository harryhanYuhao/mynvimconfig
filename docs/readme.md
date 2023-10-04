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

## Quick Guide to Some Plugins

### Telescope

`:Telescope help_tags` will list all help tags for vim commands, which are extremely useful.

### LSP (Language Server Protocol)

LSP is used for refactoring, autocomplete, jumping to and from definitions, etc. 

To disable auto completion, commment out `require('harry.plugins.lsp')` in the file `.config/nvim/lua/harry/init.lua`.

### Mason (LSP server control)

Mason is a plugin used to install/uninstall lsp servers. Unfortunately, it does not seem to support cpp.

### Treesitter

Treesitter parse the code and creates arguably better syntax highlighting. This program was written for the discontinued text editor atom by GitHub. As of Oct, 2023, the development of treesitter seems to be paused and it lacks good documentations.


