call plug#begin()
" Plug 'nvim-lua/popup.nvim' 
" Plug 'nvim-lua/plenary.nvim' 
Plug 'ryvnf/readline.vim' " use <C-b> <C-f> ... bindings in vim
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ishan9299/nvim-solarized-lua'
" maybe you can use /RRethy/nvim-base16
Plug 'chriskempson/base16-vim'
Plug 'jeffkreeftmeijer/vim-dim'

" markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" find
Plug 'junegunn/fzf'

" devtools
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/gtags.vim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-endwise'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/gtags.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'romgrk/nvim-treesitter-context'
" Plug 'JoosepAlviste/nvim-ts-context-commentstring'
call plug#end()


" load util.vim and reload my scripts
execute 'source '.fnamemodify($MYVIMRC,':h').'/utils.vim'
call LoadScripts()
