.PHONY: pkgs dot fonts config $(link-config) $(link-dot) $(link-pkgs)

all: submodules pkgs plugin-managers fonts install

# USE APT!
apt-essentials:
	sudo apt install -y build-essential python3 git automake docker
	sudo apt install -y vim emacs
	sudo apt install -y net-tools
	sudo apt install -y curl wget 

apt-fonts:
	sudo apt install fonts-firacode
	sudo apt install fonts-cantarell

apt-desktop: apt-essentials
	sudo add-apt-repository universe
	sudo apt install -y libevdev-dev xcape gnome-tweaks

apt-laptop: apt-desktop
	sudo apt install -y synaptic


submodules:
	git submodule init
	git submodule update --remote

pkgs:
	make -C pkgs 

fonts:
	mkdir -p ~/.local/share/fonts
	cp -r fonts ~/.local/share/fonts
	fc-cache -f -v

xkb-config: EVDEV=/usr/share/X11/xkb/keycodes/evdev
xkb-config:
	# for ubuntu
	# swap ESC <-> TLDE
	if [ ! -e $(EVDEV).old ]; then sudo cp $(EVDEV) $(EVDEV).old; fi
	sudo sed -E -i 's/(<ESC>.*=.*)\s[0-9]+/\1 49/g' $(EVDEV)
	sudo sed -E -i 's/(<TLDE>.*=.*)\s[0-9]+/\1 9/g' $(EVDEV)
	setxkbmap -layout us

zotero:
	wget -qO- https://apt.retorque.re/file/zotero-apt/install.sh | sudo bash
	sudo apt update
	sudo apt install zotero

google-drive:
	sudo apt install opam
	opam init
	opam update
	opam install depext -y
	opam depext google-drive-ocamlfuse -y
	opam install google-drive-ocamlfuse -y
	mkdir -p ~/google-drive
	google-drive-ocamlfuse ~/google-drive

# link all
install: 
	mkdir -p ~/.bin
	mkdir -p ~/.config
	# for f in $(shell ls -dA ./pkgs/out);	do ln -svf $$f ~/.bin; 		done
	# for f in $(shell ls -dA ./config); 		do ln -svf $$f ~/.config; 	done
	# for f in $(shell ls -dA ./dot); 		do ln -svf $$f ~/; 			done
	for f in $(shell ls -d pkgs/out/*); 	do ln -svf $(abspath $$f) ~/.bin; done
	for f in $(shell ls -d config/*); 	do ln -svf $(abspath $$f) ~/.config; done
	for f in $(shell ls -d dot/.*); 		do ln -svf $(abspath $$f) ~/; done

# plugin managers
plugin-managers: tpm nvim-plug
nvim-plug:
	sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
tpm:
	mkdir -p ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
