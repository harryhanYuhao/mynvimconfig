# A (Hopefully) Useful Nvim Configuration

This is my personal nvim configuration, which, although working, is still in experimental stage and lacking some key features such as LSP. The script, as of now, also requires much refactorying to improve its readability.

## Quickstart

### Linux or MacOS 
Copy all files into `~/.config/nvim` directory. Create one if you do not have it. Run `nvim` in CLI, ignore warnings. In nvim, type command `:PackerInstall` and follow the on screen instructions. Quit nvim with `:q!`. Relaunch nvim and everything shall be set up.

Packer may not be installed automatically; in such case it needs to be installed manually. See [parkcer.nvim](https://github.com/wbthomason/packer.nvim). As of 17 Feb 2023, you can use the command 

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
 ``` 
to install Packer.

## Dependencies 

Required nvim version >= 0.8

### Packer

Packer is a package manager for nvim. As of Feb 2023, Packer seems to have some compatibility issues on windows.

## Install nvim

See the [nvim repo](https://github.com/neovim/neovim)

Here are some quick guide for installing nvim.

### MacOS

#### Brew

`brew install nvim` 

### Linux

I recommand to build from source. On a modern cpu the build time shall be less than 5 minutes. 
It seems that on Debian-based distribution the dependencies `libtool` and `gettext` were not installed by default. Install them with `sudo apt install <PackageName>`

## Additional Configuration

### Github Copilot

To Install Github Copilot, follow the instructions on [Github Copilot](https://github.com/github/copilot.vim).

Note Copilot requires Node.js (>=16.0) and a github subscription.

## Trouble Shooting

### Tree-sitter
It seems nvim lua tree-sitter auto downloading parsers is not working properly. Use `:TSInstall <language-name>` to install parsers.
