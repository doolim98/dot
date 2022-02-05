" nerdtree settings
let NERDTreeChDirMode=3

" custom file realted scripts
function! NNNManageFiles(path=getcwd())
	let files=TmuxPopUp('nnn -p -')
	echom files->split("\0")
	return 
endfunction

function! FzyFindBuffer()
	let buffer_list = getbufinfo({'buflisted':1})->map({k,v->v.name->fnamemodify(':.')})->join("\n")
	let buffer_redir_file = g:tmux_pipe_file.'buffer'
	call execute("redir! > ".buffer_redir_file)
		silent echo buffer_list
	redir END
	let result = TmuxPopUpFzy('cat '.buffer_redir_file, ':b ')
	if result is 0
		return
	else 
		let bufinfo = getbufinfo(trim(result))
		if !empty(bufinfo)
			let bufinfo = bufinfo[0]
			call execute('b'.bufinfo.bufnr)
		endif
	endif
endfunction

function! FzyFdFind(path)
	let rpath = a:path->fnamemodify(':p:.')
	let hpath = a:path->fnamemodify(':p:~')
	let find_cmd = 'fdfind . '.rpath
	let result = TmuxPopUpFzy(find_cmd, ':e '.hpath)
	if result is 0 || empty(result)
		return v:null
	else
		return result
	endif
endfunction

function! FzyFindFile(path=getcwd())
	let fname=FzyFdFind(a:path)
	if fname isnot v:null
		call execute('e '.fname)
	endif
endfunction

function! FzyFileCmd(path=getcwd())
	let rpath = a:path->fnamemodify(':p:.')
	let hpath = a:path->fnamemodify(':p:~')
	let find_cmd = 'fdfind . '.rpath
	let result = TmuxPopUpFzy(find_cmd, ':e '.hpath)
	" if filereadable(result) || isdirectory(result)
	if result is 0 || empty(result)
		return
	else
		let cmd=input(result.':')
		call execute(cmd.' '.result)
	endif
endfunction
