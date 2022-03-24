" settings
set tabline=%!MyTabLine()
"

" set NERDTreeWinPos
let NERDTreeMinimalUI=1

" quickfix

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
		call execute("copen")
    else
		call execute("cclose")
    endif
endfunction

function! RefreshNerdTreePos()
endfunction

function! Layout_bd()
	let prev_bufnr=bufnr()
	call execute("bp")
	call execute("bd".prev_bufnr)
endfunction

function! GetBufferStack(wnr=0)
	let buffer_stack='buffer_stack'
	let rcu = a:wnr->getwinvar(buffer_rcu)
	if rcu == type([])
		return rcu
	else
		call a:wnr->setwinvar(buffer_rcu,[])
	endif
endfunction

function! BufferStackPush(bnr)
endfunction

function! BufferStackPop()
endfunction

function! MyNerdTreeFocus()
endfunction

function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
	" select the highlighting
	if i + 1 == tabpagenr()
	  let s .= '%#TabLineSel#'
	else
	  let s .= '%#TabLine#'
	endif

	" set the tab page number (for mouse clicks)
	let s .= '%' . (i + 1) . 'T'

	" the label is made by MyTabLabel()
	let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
	let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  " let winnr = tabpagewinnr(a:n)
  " let tabnr = tabpagenr(a:n)
  " return a:n.':'.bufname(buflist[winnr - 1])
  " return a:n.':'.winnr->getcwd()->fnamemodify(":t")
  return a:n.':'.getcwd(-1,a:n)->fnamemodify(":t")
endfunction

