#!/bin/bash
ln -svf $(pwd)/home/.[!.]?* ~/
#ln -sf $(pwd)/home/.screenrc ~
#ln -sf $(pwd)/home/.bashrc ~
#ln -sf $(pwd)/home/.vimrc ~

# nvim settings
# mkdir -p ~/.config/nvim
ln -sf $(pwd)/nvim ~/.config
# ln -sf $(pwd)/init.vim ~/.config/nvim
# ln -sf $(pwd)/lsp-settings.vim ~/.config/nvim
# ln -sf $(pwd)/coc-settings.json ~/.config/nvim
