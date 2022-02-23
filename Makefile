link-config:=$(abspath $(wildcard config/*))
link-pkgs:=$(abspath $(wildcard pkgs/out/*))
link-dot:=$(abspath $(wildcard dot/*))

.PHONY: pkgs dot fonts config $(link-config) $(link-dot) $(link-pkgs)

all: submodules pkgs plugin-managers fonts install

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

# link all binaries
install: 
	mkdir -p ~/.bin
	mkdir -p ~/.config
	make $(link-config) $(link-dot) $(link-pkgs)

$(link-pkgs):
	ln -svf $@ ~/.bin

$(link-config):
	ln -svf $@ ~/.config/

$(link-dot):
	ln -svf $@ ~/.$(notdir $@)

# plugin managers
plugin-managers: tpm nvim-plug
nvim-plug:
	sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
tpm:
	mkdir -p ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
