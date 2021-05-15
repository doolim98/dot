#!/bin/bash
cd $(dirname "$0")

lsdir(){
	find $1 -maxdepth 1 -mindepth 1
}

# home config files
echo "HOME"
ln -svf $(lsdir $PWD/home/) ~/

# nvim config files
echo "NEOVIM"
mkdir -p ~/.config/nvim
ln -svf $(lsdir $PWD/nvim/) ~/
