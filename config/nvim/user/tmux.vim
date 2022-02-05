let tmux_pipe_file='/tmp/'..'nvim_tmux_pipe_'..'dkssudgktldy'..getpid()
silent! call system('touch '.tmux_pipe_file)

function! TmuxPopUp(cmd,w='50%',h='50%')
	" by default, it should goto current directory
	call system('tmux popup -h '.a:h.' -w '.a:w.' -E "cd '.getcwd().';'.a:cmd.' > '.g:tmux_pipe_file.'"')
	return system('cat '.g:tmux_pipe_file)
endfunction

function! TmuxPopUpFzy(cmd,prompt='>')
	return TmuxPopUp(a:cmd." | fzy -l 50 --prompt='".a:prompt."'",80,25)
	" return TmuxPopUp(a:cmd." | fzf ",70,15)
endfunction

