" apperance
colorscheme default " first just call default colorscheme it fixes highlight issues

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" set t_Co=256
" set term=xterm-256color
set laststatus=2
" set statusline=%f%=%P
" set statusline=%f\ [%l/%L]%=%n
set noshowcmd
set signcolumn=no
set fillchars=vert:\ 
set pumheight=20
set cmdheight=2
set nocursorline
" set cursorline
set wildmenu
" highlight Pmenu ctermfg=245 ctermbg=255
highlight PmenuSel cterm=underline ctermfg=7 ctermbg=18
" highlight PmenuSbar ctermfg=245 ctermbg=255
" highlight PmenuThumb ctermfg=16 ctermbg=16

" ()[] matching
hi MatchParen cterm=underline ctermbg=0

" Lsp
hi LspReferenceRead cterm=bold ctermbg=18
hi LspReferenceText cterm=bold ctermbg=18
hi LspReferenceWrite cterm=bold ctermbg=18
