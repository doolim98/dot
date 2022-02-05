" general settings
set smartindent
set tabstop=4
set shiftwidth=4
set noshowcmd 
set noshowmode
set number
set fillchars=vert:\│

" completion
set completeopt=menuone,noinsert
set pumheight=10

let use_ansi_color=0

if use_ansi_color
	set notermguicolors
	colorscheme dim
	set background=dark
	hi! link VertSplit Normal
else
	set termguicolors
	set background=light
	" set cursorline
	colorscheme solarized-flat
endif

" custom highlights
" hi Cursor


" remove ~ at end of buffer
highlight! EndOfBuffer ctermbg=0 ctermfg=0 guibg=bg guifg=bg

" fix markdown error
syn match markdownError "\w\@<=\w\@="
