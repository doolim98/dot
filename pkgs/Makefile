outdir := out

targets := tmux fzf fzy nvim 

.PHONY: $(targets) clean
all: $(targets)

tmux: tmux/configure
	make -C tmux
	ln -svf $(abspath tmux/tmux) $(outdir)

fzf: 
	fzf/install --bin
	ln -svf $(abspath fzf/bin/*) $(outdir)

fzy: 
	make -C fzy
	ln -svf $(abspath fzy/fzy) $(outdir)

nvim: $(outdir)/nvim

tmux/configure: 
	cd tmux && sh autogen.sh && ./configure 

$(outdir)/nvim:
	wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	chmod +x nvim.appimage
	mv nvim.appimage $(outdir)/nvim

clean:
	rm $(outdir)/*
