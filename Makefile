define lsdir
	$(shell find $(1) -maxdepth 1 -mindepth 1)
endef

.PHONY: nvim zsh link fonts

all: bin nvim zsh link fonts pkgs/*

bin:
	mkdir -p ~/.bin

submodule:
	git submodule init
	git submodule update
	# git submodule foreach git checkout master

nvim:
	wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	chmod +x nvim.appimage
	mv nvim.appimage ~/.bin/nvim

zsh:
	# ohmyzsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

tmux:
	cd pkgs/tmux &&\
	sh autogen.sh &&\
	./configure && make

fzf:
	pkgs/fzf/install --bin
	cp pkgs/fzf/bin/* bin/

fonts:
	mkdir -p ~/.local/share/fonts
	cp -r fonts ~/.local/share/fonts

link:
	mkdir -p ~/.config
	ln -svf $(call lsdir,$(PWD)/home/) ~/
	ln -svf $(call lsdir,$(PWD)/config/) ~/.config
