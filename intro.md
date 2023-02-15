## Keymaps
the local mapleader key is set to be space key.

## Plugins

### Telescope

`:Telescope help_tags` will list all help tags for vim commands, which are extremely useful.

### LSP (Language Server Protocol)

LSP is used for refactoring, autocomplete, jumping to and from definitions, etc. 

To disable auto completion, commment out `require('harry.plugins.lsp')` in the file `.config/nvim/lua/harry/init.lua`.

### Mason (LSP server control)

Mason is a plugin used to install/uninstall lsp servers. Unfortunately, it does not seem to support cpp.


### Treesitter

Treesitter is an extremely powerful program that can parse the input languages. Its practically functionailities include: 1) create syntax tree; 2) highlighting; 3) formatting and organizing code; 4) much more!

