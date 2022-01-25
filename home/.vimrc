" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'farmergreg/vim-lastplace'
Plug 'mileszs/ack.vim'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

function! CdToGit()
	let dir = finddir(".git", ".;")
	if !empty(dir)
		exec "cd" dir."/.."
	endif
endfunction


function! LoadGtagsConfig()
	let csf=findfile("GTAGS", ".;")
	let csp=matchstr(csf, ".*/")
	if !empty(csf) && filereadable(csf)
		set csprg=gtags-cscope
		exe "cs add" csf csp
		nnoremap gd :cs find g <cword><CR>
		nnoremap gs :cs find s <cword><CR>
		nnoremap gs :cs find s <cword><CR>
	endif
endfunction

function! ToggleQuickFix()
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
	else
		cclose
		wincmd p
	endif
endfunction


" default
set noswapfile
colorscheme default
set laststatus=2
set noshowcmd
set signcolumn=no
set fillchars=vert:\ 
set pumheight=20
set cmdheight=2
set nocursorline
set number
set wildmenu

" simple settings
let mapleader=" " 
syntax on
syntax sync fromstart
filetype plugin on
set tags=./tags;/
set mouse=
set smartindent
set tabstop=4
set shiftwidth=4
set hidden
set nobackup
set nowritebackup
set shortmess=a
set nocsverb
set incsearch
set ignorecase

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" keymappings
nnoremap <Leader>r :so ~/.vimrc<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>b :ls<CR>:b
nnoremap <Leader>m :make 
nnoremap <Leader>s :w<CR>
" nnoremap <Leader>f :Ack <cword><CR>
" nnoremap <Leader>

" window
nnoremap <Leader>wv <C-w>v<CR>
nnoremap <Leader>ws <C-w>s<CR>
nnoremap <Leader>wq <C-w>q<CR><C-w>p<CR>
nnoremap <Leader>w= <C-w>=<CR>
nnoremap <Leader>wp <C-w>p<CR>

" Esc
nnoremap <Esc> <C-c>
cnoremap <Esc> <C-c>
vnoremap <Esc> <C-c>

nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary

" nnoremap <Leader>o :call OpenFileFromShell("fzf")<CR>
noremap <silent> <leader>nt :NERDTreeToggle<cr>
noremap <silent> <leader>nf :NERDTreeFind<cr>

" quickfix
nnoremap <silent> <C-n> :0cn<CR>
nnoremap <silent> <C-p> :1cp<CR>
nnoremap <silent> <leader>q :call ToggleQuickFix()<cr>


" search
nnoremap <silent> <C-c> :noh<CR>

set cscopequickfix=s-,g-,c-,d-,i-,t-,e-,a-
