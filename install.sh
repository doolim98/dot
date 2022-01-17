#!/bin/bash
cd $(dirname "$0")

lsdir(){
	find $1 -maxdepth 1 -mindepth 1 
}

# install neovim 
mkdir -p ~/.bin
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x nvim.appimage
mv nvim.appimage ~/.bin/nvim

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# link dot files
ln -svf $(lsdir $PWD/home/) ~/

# link .config files
mkdir -p ~/.config
ln -svf $(lsdir $PWD/config/) ~/.config
