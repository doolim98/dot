outdir := out

targets := tmux fzf fzy nvim emacs xcape


.PHONY: $(targets) clean
all: $(targets)

define run_docker_cmd
	sudo docker-compose run --entrypoint $(1) pkgs \
		&& sudo docker-compose rm -fsv
endef

tmux: $(outdir)/tmux
nvim: $(outdir)/nvim
fzf: $(outdir)/fzf
fzy: $(outdir)/fzy

$(outdir)/tmux:
	cd tmux && sh autogen.sh && ./configure 
	make -C tmux
	cp tmux/tmux $(outdir)

$(outdir)/fzf: 
	fzf/install --bin
	cp fzf/bin/* $(outdir)

$(outdir)/fzy: 
	make -C fzy
	cp fzy/fzy $(outdir)


$(outdir)/nvim:
	wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	chmod +x nvim.appimage
	mv nvim.appimage $(outdir)/nvim
