APT_PKGS+=build-essential python3 git automake docker \
		  net-tools curl wget
APT_PKGS+=neovim fonts-firacode xcape gnome-tweaks
APT_PKGS+=libevdev-dev

install-apt:
	sudo apt install -y $(APT_PKGS)

install-dot: 
	mkdir -p ~/.bin
	mkdir -p ~/.config
	for f in $(shell ls -d config/*); 	do ln -svf $(abspath $$f) ~/.config; done
