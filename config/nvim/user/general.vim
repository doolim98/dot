set hidden
set noswapfile
set mouse=a
set incsearch
set ignorecase
set updatetime=1000
set autoread
set shortmess+=c
set splitbelow
set splitright


" text
set formatoptions-=cro
set nofoldenable

" set iskeyword-=_

augroup user_general
	au!
	" return to last edit position
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	" autosave
	" au BufLeave * execute("silent! w")
	" au BufLeave * execute("silent! w")
	" au CursorHold * execute("silent! wa")
augroup end
