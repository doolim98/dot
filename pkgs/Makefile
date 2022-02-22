outdir := out

targets := tmux fzf fzy nvim emacs xcape

EMACS_VERSION:=tags/emacs-27.2

.PHONY: $(targets) clean
all: $(targets)

define run_docker_cmd
	sudo docker-compose run --entrypoint $(1) pkgs \
		&& sudo docker-compose rm -fsv
endef

# set git repo branchs
init:
	cd emacs && git checkout $(EMACS_VERSION) && git clean -xdf

emacs:
	cd emacs && ./autogen.sh autoconf && ./configure --with-x-toolkit=lucid
	$(call run_docker_cmd,make -C emacs -j$(shell nproc))

emacs-install:
	cd emacs && make install
	cp emacs/src/emacs $(outdir)

tmux: 
	cd tmux && sh autogen.sh && ./configure 
	make -C tmux
	cp tmux/tmux $(outdir)

fzf: 
	fzf/install --bin
	cp fzf/bin/* $(outdir)

fzy: 
	make -C fzy
	cp fzy/fzy $(outdir)

xcape:
	sudo apt-get install -y git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
	cd xcape && make && sudo make install

nvim: $(outdir)/nvim

$(outdir)/nvim:
	wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	chmod +x nvim.appimage
	mv nvim.appimage $(outdir)/nvim

clean:
	rm $(outdir)/*
