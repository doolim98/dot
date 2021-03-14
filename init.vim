call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'

" Classic vim scripts

" Colorschemes
Plug 'fxn/vim-monochrome'
call plug#end()

" [] shortucts!!
nnoremap ]w <C-w>w
nnoremap [w <C-w>W
nnoremap ]t gt
nnoremap [t gT
nnoremap ]q :cnewer<CR>
nnoremap [q :colder<CR>

"-----tags settings
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



"-----simple settings
" let mapleader="\\"
let mapleader=" " 
" set tags=./tags;,tags;
set tags=./tags;/
set scrolloff=7
set cursorline
set number
set mouse=a
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set smartindent
set tabstop=4
" set expandtab
set shiftwidth=4
set fillchars=vert:│
""""""""""""""""""""""'

" popup 
set pumheight=20
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
set shortmess+=c

" set noincsearch
set ignorecase

" key mappings

" functions
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>b :ls<CR>:b
nnoremap <Leader>m :make 
nnoremap <Leader>s :w<CR>
nnoremap gr :grep <cword> *

" nnoremap <silent> <C-q> :q<CR>
" nnoremap <silent> <C-s> :w<CR>

" commentary <C-_> == <C-/>
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary
nmap <Leader>c <Plug>CommentaryLine
vmap <Leader>c <Plug>Commentary

" quickfix
nnoremap <silent> <C-n> :1cn<CR>
nnoremap <silent> <C-p> :1cp<CR>
function! ToggleQuickFix()
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
	else
		cclose
	endif
endfunction

nnoremap <silent> <C-q> :call ToggleQuickFix()<cr>

" formatting
nnoremap <Leader>= :!clang-format -i %<CR>
nnoremap + :echo "hello"<CR>

" else
" nnoremap zz :<CR> 
nnoremap <silent> <C-c> :noh<CR>

" mouse
" status bar
set laststatus=2
" set statusline=%f%=%P
set statusline=%f\ [%l/%L]%=%n
set noshowcmd
set signcolumn=no

" window
set splitright

" LSP settings
" :luafile ~/.config/nvim/lsp-settings.lua

set cscopequickfix=s-,c-,d-,i-,t-,e-,a-


" colorscheme
" colorscheme mono	
colorscheme desert
" colorscheme base16-default-dark
" syntax off


" ------- file specific settings for coding
" - Formatter 
" 	ex) black, clang-format etc...
"
" - Linter -> auto check when saving
" 	ex) pyflakes, cppcheck
"
" - Builder
" 	ex) make
" 	config with makeprg

nnoremap + :call Format()<CR>
nnoremap <Leader>xl :call Linter()<CR>

" -- Formatter
let g:py_fmtr="!black %"
let g:c_fmtr="!clang-format -i %"
let g:vim_fmtr="!echo no vim_fmtr for %"

autocmd FileType python setl equalprg

function! Format()
	" first save the file
	w
	" set formatter based on filetype
	let fmtr="!echo no formatter for %"
	if &filetype == 'c'
		let fmtr=g:c_fmtr
	elseif &filetype =='cpp'
		let fmtr=g:c_fmtr
	elseif &filetype == 'python'
		let fmtr=g:py_fmtr
	endif
	silent execute(fmtr)
	" reload file
	e
endfunction

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

" -- load externel project vimrc --
if filereadable(".vprc")
	echo "load external .vprc"
	so .vprc
endif
