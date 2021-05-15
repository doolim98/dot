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
		copen
	else
		cclose
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
