" apperance
colorscheme default " first just call default colorscheme it fixes highlight issues
colorscheme dim

set t_Co=256
set t_Co=16
" set termguicolors
" set term=xterm-256color
set laststatus=1
" set statusline=%f%=%P
" set statusline=%f\ [%l/%L]%=%n
set noshowcmd
set signcolumn=no
set fillchars=vert:\ 
set pumheight=20
set cmdheight=1
set nocursorline
set nocursorcolumn
" set cursorline
set wildmenu
" highlight Pmenu ctermfg=245 ctermbg=255
" highlight PmenuSel cterm=underline ctermfg=7 ctermbg=18
" highlight PmenuSbar ctermfg=245 ctermbg=255
" highlight PmenuThumb ctermfg=16 ctermbg=16

hi MatchParen cterm=underline ctermbg=none


" Lsp
hi LspReferenceRead cterm=bold ctermbg=18
hi LspReferenceText cterm=bold ctermbg=18
hi LspReferenceWrite cterm=bold ctermbg=18
hi SignColumn ctermbg=1
hi LspDiagnosticsDefaultError cterm=bold ctermfg=1 
hi LspDiagnosticsDefaultWarning cterm=bold ctermfg=3 
hi LspDiagnosticsDefaultHint cterm=bold ctermfg=2 


"
hi LspDiagnosticsUnderlineError cterm=bold,italic ctermfg=White ctermbg=Red
hi LspDiagnosticsUnderlineWarning cterm=underline ctermfg=none ctermbg=none
hi LspDiagnosticsUnderlineInformation ctermfg=2
hi LspDiagnosticsUnderlineHint ctermfg=2


let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext

" hi PmenuSel gui=reverse 
" hi PmenuSel gui=underline guifg=none guibg=none
" hi MatchParen gui=underline guibg=none 

" hi LspDiagnosticsUnderlineError guifg=White guibg=Red
hi LspDiagnosticsUnderlineError guisp=Red guibg=none guifg=none

hi link LspReferenceRead Visual
hi link LspReferenceText Visual
hi link LspReferenceWrite Visual
" hi LspReferenceRead guibg=18
" hi LspReferenceText guibg=18
" hi LspReferenceWrite guibg=18

" Install Base16 color theme

" if filereadable(expand("~/.vimrc_background"))
"   " let base16colorspace=256
"   source ~/.vimrc_background
" endif

