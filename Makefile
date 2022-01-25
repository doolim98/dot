define lsdir
	$(shell find $(1) -maxdepth 1 -mindepth 1)
endef

.PHONY: nvim zsh link fonts pkgs/*

all: dirs nvim zsh link fonts pkgs/*

submodule:
	git submodule init
	git submodule update --remote
	# git submodule foreach git checkout master

pkgs:
	make -C pkgs 

nvim:
	wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	chmod +x nvim.appimage
	mv nvim.appimage ~/.bin/nvim

ohmyzsh:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

tpm:
	mkdir -p ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

fonts:
	mkdir -p ~/.local/share/fonts
	cp -r fonts ~/.local/share/fonts

install:
	mkdir -p ~/.bin
	mkdir -p ~/.config
	ln -svf $(PWD)/pkgs/fzf/bin/* ~/.bin/
	ln -svf $(PWD)/pkgs/tmux/tmux ~/.bin/
	ln -svf $(call lsdir,$(PWD)/home/) ~/
	ln -svf $(call lsdir,$(PWD)/config/) ~/.config
