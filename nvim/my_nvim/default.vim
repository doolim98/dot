" simple settings
let mapleader=" " 
syntax on
syntax sync fromstart
set tags=./tags;/
" set scrolloff=7
set mouse=
filetype plugin on

" for CursorHold autocmd
set updatetime=100	" NOTE : it can cause highlight glitchs

set nowrap
set smartindent
set tabstop=4
set shiftwidth=4
set hidden
set nobackup
set nowritebackup
set noswapfile
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType c set shiftwidth=2


set shortmess+=c
set nocsverb
set incsearch
set ignorecase
set number

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99

set foldtext=MyFoldText()

let g:AutoPairsCenterLine=0
