" keymappings
set pastetoggle=<F11>
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>
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

" [] shortucts!!
nnoremap ]w <C-w>w
nnoremap [w <C-w>W
nnoremap ]t gt
nnoremap [t gT
nnoremap ]q :cnewer<CR>
nnoremap [q :colder<CR>

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1
let g:completion_trigger_keyword_length = 3
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
