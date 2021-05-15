" simple settings
let mapleader=" " 
syntax on
syntax sync fromstart
set tags=./tags;/
" set scrolloff=7
set mouse=
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set smartindent
set tabstop=4
set shiftwidth=4
set hidden
set nobackup
set nowritebackup
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set shortmess=a
set nocsverb
set incsearch
set ignorecase
set number
