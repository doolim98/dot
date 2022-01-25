vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd([[
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif

endfunction

nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>

nnoremap <Leader>r :so $MYVIMRC<CR>
nnoremap <Leader>pi :PackerInstall<CR>
nnoremap <Leader>b :ls<CR>:b
nnoremap <Leader>m :make 
nnoremap <Leader>s :w<CR>

nnoremap <Leader>wv <C-w>v<CR>
nnoremap <Leader>ws <C-w>s<CR>
nnoremap <Leader>wq <C-w>q<CR><C-w>p<CR>
nnoremap <Leader>w= <C-w>=<CR>
nnoremap <Leader>wp <C-w>p<CR>

" cancel search
nnoremap <silent> <Esc> :silent! /dkssudkgtpdy<CR><Esc>

" nerd tree
noremap <silent> <leader>nt :NERDTreeToggle<cr>
noremap <silent> <leader>nf :NERDTreeFind<cr>
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'

nnoremap <Leader>t :let &background = ( &background == "dark"? "light" : "dark" )<cr>

nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary
]])
