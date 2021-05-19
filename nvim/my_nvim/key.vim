" unmapped keys
nnoremap <C-w><C-c> <Nop>
" keymappings
" For consistency C-c == Esc
inoremap <C-c> <Esc>
set pastetoggle=<F11>
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>m :make 
nnoremap <Leader>s :w<CR>
" nnoremap <Leader>o :Files<CR>
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary

" window
nnoremap <Leader>1 1<C-w><C-w>
nnoremap <Leader>2 2<C-w><C-w>
nnoremap <Leader>3 3<C-w><C-w>
nnoremap <Leader>4 4<C-w><C-w>
nnoremap <Leader>5 5<C-w><C-w>
nnoremap <Leader>6 6<C-w><C-w>
nnoremap <Leader>7 7<C-w><C-w>
nnoremap <Leader>8 8<C-w><C-w>
nnoremap <Leader>9 9<C-w><C-w>
nnoremap <Leader>wq <C-w>q
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>wp <C-w>p
nnoremap <Leader><Leader> <C-w>p

" buffer
nnoremap <Leader>b :ls<CR>:b
nnoremap <Backspace> :bp<CR>

" terminal
tmap <C-c> <C-\><C-n>

" FIND
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>fl <cmd>Telescope git_files<cr>

nnoremap <leader>ff :Findr<CR>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb :FindrBuffers<CR>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>fl <cmd>Telescope git_files<cr>

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

" folding
" nnoremap <Tab> za " DO NOT USE TAB!!

" Completion
set completeopt=menuone,noinsert
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_sorting = "length"
let g:completion_matching_smart_case = 1
let g:completion_trigger_keyword_length = 2
let g:completion_enable_auto_signature = 0

" use TAB as confirm key
let g:completion_confirm_key = ""
imap <expr> <Tab>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<Tab>" :  "\<Tab>"
" set omnifunc=syntaxcomplete#Complete
" let g:completion_enable_auto_popup = 0
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)
