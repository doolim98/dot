function! MyFoldText()
	let l:lpadding = &fdc
	redir => l:signs
	execute 'silent sign place buffer='.bufnr('%')
	redir End
	let l:lpadding += l:signs =~ 'id=' ? 2 : 0

	if exists("+relativenumber")
		if (&number)
			let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
		elseif (&relativenumber)
			let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
		endif
	else
		if (&number)
			let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
		endif
	endif

	" expand tabs
	let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
	let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

	let l:info = ' (' . (v:foldend - v:foldstart) . ')'
	let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
	let l:width = winwidth(0) - l:lpadding - l:infolen

	let l:separator = ' ... '
	let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
	let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
	let l:text = l:start . ' … ' . l:end

	return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
endfunction

function! LoadProjVimrc()
	let file=findfile(".vimproj", ".;")
	let path=matchstr(file, ".*/")
	if !empty(file) && filereadable(file)
		exe 'so' file
	endif
	if !empty(path)
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
		:copen
	else
		:cclose
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
