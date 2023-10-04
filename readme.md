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

## Dependencies 

Nvim version 0.8

### Clipboard Support

Most Operation System have build in clipboard support.

For some that have not (arch linux), you may need to install clipboard manager like `xclip` or `xsel`.

### Github Copilot

Node.js and a github subscription.

## Install nvim

See the [nvim repo](https://github.com/neovim/neovim)

Here are some quick guide for installing nvim.

### MacOS

#### Brew

`brew install nvim` 

### Linux

Use the package manager of your distribution.

## Trouble Shooting

It seems nvim lua tree-sitter auto downloading parsers is not working properly. Use `:TSInstall <language-name>` to install parsers.

## Uninstallation

The nvim runtime path usually contains:
```shell
~/.config/nvim 
~/.local/share/nvim
/usr/share/nvim/runtime
```
