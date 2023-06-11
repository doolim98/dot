" Useful documentations for vim script
" https://devhints.io/vimscript-functions 
"
let g:my_config_dir = fnamemodify($MYVIMRC,':h')

let g:u={
			\'regex': {'join':{l-> '\('..l->join('\|')..'\)'}},
			\'getcn':{->getpos('.')[2]}, 'getln':{->getpos('.')[1]}, 'getbn':{->getpos('.')[0]}
			\}

function! LoadScripts()
	let user_config_dir = g:my_config_dir.'/user'
	let user_vim_scripts = split(globpath(user_config_dir,'*.vim'))
	let user_lua_scripts = split(globpath(user_config_dir,'*.lua'))

	for vim_script in user_vim_scripts
		execute 'source '.vim_script
	endfor

	for lua_script in user_lua_scripts
		execute 'luafile '.lua_script
	endfor
endfunction
