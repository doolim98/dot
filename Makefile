.PHONY: pkgs dot fonts config $(link-config) $(link-dot) $(link-pkgs)

all: submodules pkgs plugin-managers fonts install

APT_ESSENTIALS=build-essential python3 git automake docker \
				vim net-tools curl wget fd-find

APT_FONTS=fonts-firacode fonts-cantarell fonts-terminus
APT_DESKTOP=libevdev-dev xcape gnome-tweaks
APT_LAPTOP=synaptic

# USE APT!
apt-essentials:
	sudo apt install -y $(APT_ESSENTIALS)

apt-deb-src:
	sudo sed -ir 's/#\s*deb-src/deb-src/g' /etc/apt/sources.list
	sudo apt update -y

apt-fonts:
	sudo apt install -y $(APT_FONTS)

apt-desktop: apt-essentials apt-fonts
	sudo add-apt-repository universe -y
	sudo apt update -y
	sudo apt install -y $(APT_DESKTOP)

apt-laptop: apt-desktop
	sudo apt install -y $(APT_LAPTOP)

submodules:
	git submodule init
	git submodule update --remote

pkgs:
	make -C pkgs 

fonts:
	mkdir -p ~/.local/share/fonts
	cp -r fonts ~/.local/share/fonts
	fc-cache -f -v

zotero:
	wget -qO- https://apt.retorque.re/file/zotero-apt/install.sh | sudo bash
	sudo apt update
	sudo apt install zotero

# link all
install: 
	mkdir -p ~/.bin
	mkdir -p ~/.config
	for f in $(shell ls -d scripts/*); 		do ln -svf $(abspath $$f) ~/.bin; done
	for f in $(shell ls -d pkgs/out/*); 	do ln -svf $(abspath $$f) ~/.bin; done
	for f in $(shell ls -d config/*); 		do ln -svf $(abspath $$f) ~/.config; done
	for f in $(shell ls -d dot/.*); 		do ln -svf $(abspath $$f) ~/; done

# plugin managers
plugin-managers: tpm nvim-plug
nvim-plug:
	sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

tpm: ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm:
	mkdir -p ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
