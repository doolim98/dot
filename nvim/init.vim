" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echom "vim-plug installed restart"
  finish
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'farmergreg/vim-lastplace'
Plug 'mileszs/ack.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'

Plug 'tpope/vim-sensible'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  



call plug#end()

" source config files
source ~/.config/nvim/my_nvim/default.vim
source ~/.config/nvim/my_nvim/key.vim
source ~/.config/nvim/my_nvim/functions.vim
luafile ~/.config/nvim/my_nvim/lsp.lua
luafile ~/.config/nvim/my_nvim/ts.lua

" apperance setting
source ~/.config/nvim/my_nvim/apperance.vim

" call LoadLinterConfig()

" Proj level management
call LoadProjVimrc()
" call LoadGtagsConfig()
