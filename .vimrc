" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
call plug#end()


" [] shortucts!!
nnoremap ]w <C-w>w
nnoremap [w <C-w>W
nnoremap ]t gt
nnoremap [t gT
nnoremap ]q :cnewer<CR>
nnoremap [q :colder<CR>


function! LoadProjVimrc()
	let file=findfile(".proj_vimrc", ".;")
	let path=matchstr(file, ".*/")
	if !empty(file) && filereadable(file)
		exe 'so' file
		exe 'cd' path
	endif
endfunction


function! LoadGtagsConfig()
	let csf=findfile("GTAGS", ".;")
	let csp=matchstr(csf, ".*/")
	if !empty(csf) && filereadable(csf)
		set csprg=gtags-cscope
		echo csf
		echo csp
		exe "cs add" csf csp
		nnoremap gd :cs find g <cword><CR>
		nnoremap gs :cs find s <cword><CR>
	endif
endfunction


function! LoadLspConfig()
endfunction


function! ToggleQuickFix()
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
	else
		cclose
	endif
endfunction

" apperance
colorscheme desert
set laststatus=2
" set statusline=%f%=%P
set statusline=%f\ [%l/%L]%=%n
set noshowcmd
set signcolumn=no
set fillchars=vert:│
set pumheight=20
set cmdheight=2
set cursorline
set number


" simple settings
let mapleader=" " 
set tags=./tags;/
set scrolloff=7
set mouse=a
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set smartindent
set tabstop=4
set shiftwidth=4
set hidden
set nobackup
set nowritebackup
set updatetime=100
" set shortmess+=c
" set noincsearch
set ignorecase

" functions
nnoremap <Leader>r :so ~/.vimrc<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>b :ls<CR>:b
nnoremap <Leader>m :make 
nnoremap <Leader>s :w<CR>
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary


augroup autoformat_settings
	autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	autocmd FileType rust AutoFormatBuffer rustfmt
	autocmd FileType vue AutoFormatBuffer prettier
augroup END


" quickfix
nnoremap <silent> <C-n> :1cn<CR>
nnoremap <silent> <C-p> :1cp<CR>
nnoremap <silent> <C-q> :call ToggleQuickFix()<cr>

" search
nnoremap <silent> <C-c> :noh<CR>

set cscopequickfix=s-,c-,d-,i-,t-,e-,a-


" -- Linter
let g:py_linter="!pyflakes %"
let g:c_linter="!cppcheck %"

function! Linter()
	let linter=""
	if &filetype == 'c'
		let linter=g:c_linter
	elseif &filetype =='cpp'
		let linter=g:c_linter
	elseif &filetype == 'python'
		let linter=g:py_linter
	endif
	cgetexpr! execute(linter)
endfunction

call LoadProjVimrc()

