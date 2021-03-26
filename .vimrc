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

" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
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

function! LoadLinterConfig()
	function! RunLinter()
	endfunction
	let g:linter=""
	let g:linter_cmds={
				\"python":"!pyflakes %",
				\"c":"!cppcheck %"
				\}
	nnoremap <leader>xl :call RunLinter()<CR>

	" augroup linter
	" 	au!
	" 	autocmd Filetype python let g:linter=g:py_linter
	" 	autocmd Filetype c let g:linter=g:c_linter
	" augroup END

endfunction

function! ToggleQuickFix()
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
	else
		cclose
	endif
endfunction

function! GetOutputFromShell(cmd)
	execute("silent !".a:cmd." > /tmp/.vim.tmp")
	let ret = system("cat /tmp/.vim.tmp")
	redraw!
	return ret
endfunction

function! OpenFileFromShell(cmd)
	let out = GetOutputFromShell(a:cmd)
	if !empty(out)
		exec "e" out
	endif
endfunction


" apperance
colorscheme default
" set t_Co=256
set term=xterm-256color
set laststatus=2
" set statusline=%f%=%P
" set statusline=%f\ [%l/%L]%=%n
set noshowcmd
set signcolumn=no
set fillchars=vert:\ 
set pumheight=20
set cmdheight=2
set nocursorline
set number
set wildmenu
highlight Pmenu ctermfg=245 ctermbg=255
highlight PmenuSel ctermfg=16 ctermbg=255
highlight PmenuSbar ctermfg=245 ctermbg=255
highlight PmenuThumb ctermfg=16 ctermbg=16

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

" keymappings
set pastetoggle=<F11>
nnoremap <Leader>r :so ~/.vimrc<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>b :ls<CR>:b
nnoremap <Leader>m :make 
nnoremap <Leader>s :w<CR>
nnoremap <Leader>f :Ack <cword><CR>
" nnoremap <Leader>o :Files<CR>
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary
nnoremap <Leader>o :call OpenFileFromShell("fzf")<CR>

" quickfix
nnoremap <silent> <C-n> :0cn<CR>
nnoremap <silent> <C-p> :1cp<CR>
nnoremap <silent> <Leader>q :call ToggleQuickFix()<cr>


" search
nnoremap <silent> <C-c> :noh<CR>

set cscopequickfix=s-,g-,c-,d-,i-,t-,e-,a-


call LoadLinterConfig()

" Proj level management
call CdToGit()
call LoadProjVimrc()
call LoadGtagsConfig()
