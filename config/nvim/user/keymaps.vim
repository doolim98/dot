let mapleader = " "
let maplocalleader = " "

" simple shortcuts
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>s :w<CR>
nnoremap <C-s> :w<CR>

" quickfix
" nnoremap <Leader>q :call ToggleQuickFix()<CR>
nnoremap <Leader>qq :copen<CR>
nnoremap <Leader>qo :colder<CR>
nnoremap <Leader>qn :cnewer<CR>
nnoremap <C-b> :colder<CR>
nnoremap <C-f> :cnewer<CR>
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" grep
" nnoremap <Leader>g :vimgrep //gj **/*<left><left><left><left><left><left><left><left>
nnoremap <Leader>g :Ack <cword>
" nnoremap <Leader>g :Ack 

" ack


nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt

" goto previous window
nnoremap <C-w><C-w> <C-w>p 

" special commands often for vim debugging
nnoremap <Leader><Leader>l :luafile %<CR>
nnoremap <Leader><Leader>v :source %<CR>
nnoremap <Leader><Leader>r :so $MYVIMRC<CR>
nnoremap <Leader><Leader>m :messages<CR>

" toggle settings
nnoremap <Leader>tt :TSToggleAll highlight<CR>

" buffer mappings
nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>
" nnoremap q :call Layout_bd()<CR>

" prefix shortcuts
nnoremap <Leader>m :make 

" fzy
" nnoremap <Leader>o :lua fzy_open_file()<CR>
" nnoremap <Leader>b :lua fzy_open_buffer()<CR>
nnoremap <Leader>o :call FzyFindFile()<CR>
nnoremap <Leader>b :call FzyFindBuffer()<CR>
nnoremap <Leader>f :call NNNManageFiles()<CR>
nnoremap <Leader>c :call FzyFileCmd()<CR>

" Code Navigation
" Gtags
nnoremap <C-g> :Gtags 
" ALE
nnoremap ge :ALENextWrap<CR>
nnoremap gE :ALEPreviousWrap<CR>
nnoremap gt :ALEGoToTypeDefinition<CR>
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap gk :ALEHover<CR>

" set paste
" nnoremap <C-v> <C-o>:set paste!<CR>
nnoremap <Leader>pp :set paste!<CR>

" use tab for completion
" fix <CR> handler https://xdg.me/combining-vim-closer-with-pumvisible/
function! HandleCRKey() abort
	  return pumvisible() ? "\<C-E>\n" : "\n"
endfunction
inoremap <expr> <TAB> pumvisible() ? "\<C-Y>" : "\<TAB>"
inoremap <expr> <C-n> AutoOmniRemapCtrlN()
inoremap <silent> <CR> <C-R>=HandleCRKey()<CR>

" cancel search
nnoremap <silent> <Esc> :silent! /\sasdfvhjnklb<CR><Esc>
" NERD TREE
noremap <silent> <leader>nt :NERDTreeToggle<cr>
noremap <silent> <leader>nt :NERDTreeFocus<cr>
noremap <silent> <leader>nf :NERDTreeFind<cr>
" remove <C-j> <C-k> mapping
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'

nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary

" 
nnoremap <C-.> :echom "hello"<CR>
