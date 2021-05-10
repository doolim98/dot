#!/bin/bash
ln -sf $(pwd)/.tmux.conf ~
ln -sf $(pwd)/.screenrc ~
ln -sf $(pwd)/.bashrc ~
ln -sf $(pwd)/.vimrc ~

# nvim settings
ln -sf $(pwd)/init.vim ~/.config/nvim
ln -sf $(pwd)/lsp-settings.vim ~/.config/nvim
# ln -sf $(pwd)/coc-settings.json ~/.config/nvim
