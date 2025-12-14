# A Nvm Config

## Quickstart

### Linux or MacOS 

Copy all files into `~/.config/nvim` directory. Create one if you do not have it. Run `nvim` in CLI, ignore warnings. In nvim, type command `:PackerInstall` and follow the on screen instructions. Quit nvim with `:q!`. Relaunch nvim and everything shall be set up.

Packer may not be installed automatically; in such case it needs to be installed manually. See [parkcer.nvim](https://github.com/wbthomason/packer.nvim). As of 17 Feb 2023, you can use the command 

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
 ``` 

You may also use this snippet to install packer automatically. 

To install this configuration, run the following commands in your terminal:

```sh 
git clone --depth 1 https://github.com/harryhanYuhao/mynvimconfig.git
cd mynvimconfig
sh install.sh
```

Remember to type `:PackerInstall` in nvim command mode. 

### Theme

Theme is set in `lua/harry/init.lua` in the line 

```
vim.cmd [[colorscheme tokyonight-day]] 
vim.cmd [[set background=light]] 
```

I recommend `gruvbox` for dark theme and `tokionight-day` for light theme.

### Clipboard Support

Most Operation System have build in clipboard support.

For some that have not (arch linux), you may need to install clipboard manager like `xclip` or `xsel`.

### Folding 

I recommend using `nvim-ufo` plugin with treesitter backend for folding.

### Github Copilot

Node.js and a github subscription.

## Uninstallation

Remove nvim with the system package manager. Optionally, remove the nvim runtime path, which usually contains:
```shell
~/.config/nvim 
~/.local/share/nvim
/usr/share/nvim/runtime
```
