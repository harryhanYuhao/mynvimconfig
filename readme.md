## Quickstart

### Linux or MacOS 
Copy all files into `~/.config/nvim` directory. Create one if you do not have it. Run `nvim` in CLI, ignore warnings. In nvim, type command `:PackerInstall` and follow the on screen instructions. Quit nvim with `:q!`. Relaunch nvim and everything shall be set up.

Packer may not be installed automatically; in such case it needs to be installed manually. See [parkcer.nvim](https://github.com/wbthomason/packer.nvim). As of 17 Feb 2023, you can use the command 
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
 ``` 
to install neovim.

## Dependencies 

Recommand nvim version 0.8

### Github Copilot

Node.js and a github subscription.

## Install nvim
See the [nvim repo](https://github.com/neovim/neovim)

Here are some quick guide for installing nvim.

### MacOS

#### Brew

`brew install nvim` 

### Linux

#### Debian-based

Most modern nvim features require version >0.8. The apt version is usually outdated.

I recommand to build from source. On a modern cpu the build time shall be less than 5 minutes. 

It seems that on Debian-based distribution the dependencies `libtool` and `gettext` were not installed by default. Install them with `sudo apt install <PackageName>`

##### Ubuntu

Although snap version of nvim is available and is reasonably up-to-date, I have had some difficulties with it and therefore I recommand to build from source.

#### Fedora 

`sudo dnf install neovim`

#### Arch

`sudo pacman -S neovim`

## Trouble Shooting

It seems nvim lua tree-sitter auto downloading parsers is not working properly. Use `:TSInstall <language-name>` to install parsers.
