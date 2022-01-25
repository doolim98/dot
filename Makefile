define lsdir
	$(shell find $(1) -maxdepth 1 -mindepth 1)
endef

.PHONY: nvim zsh link fonts pkgs/*

all: dirs nvim zsh link fonts pkgs/*

dirs:
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

pkgs/tmux:
	cd pkgs/tmux && sh autogen.sh && ./configure && make 
	ln -s pkgs/tmux/tmux bin/

pkgs/fzf:
	pkgs/fzf/install --bin
	ln -s pkgs/fzf/bin/* bin/

tpm:
	mkdir -p ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

fonts:
	mkdir -p ~/.local/share/fonts
	cp -r fonts ~/.local/share/fonts

link:
	mkdir -p ~/.config
	ln -svf $(call lsdir,$(PWD)/home/) ~/
	ln -svf $(call lsdir,$(PWD)/config/) ~/.config
