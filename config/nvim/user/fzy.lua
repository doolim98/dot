local function fzy_pipe_file()
	local magic='skdmlvnwl'
	return '/tmp/.'..magic..vim.fn.getpid()
end

function fzy_tmux_popup(cmd)
	local pipe = fzy_pipe_file()
	local tmux_cmd = string.format('rm -f %s;tmux popup -E "%s > %s";cat %s', pipe,cmd,pipe,pipe)
	return vim.fn.system(tmux_cmd)
end

function fzy_tmux_popup_select(candidates)
	-- TODO fix it
	return fzy_tmux_popup('echo \"'..table.concat(candidates,'\n')..'\"')
end

function fzy_find_file(path)
	local nline=20
	local cmd='find '..path..' -type d,f'..' | fzy -l '..nline
	return fzy_tmux_popup(cmd)
end

function fzy_open_file()
	local file = fzy_find_file(vim.fn.getcwd())
	-- TODO : hanlde if file is empty
	vim.cmd("e "..file)
	return
end

function fzy_open_buffer()
	local bufferinfo = vim.api.nvim_list_bufs()
	local buffer_names = {}
	for i in ipairs(bufferinfo) do
		buffer_names[i]=vim.api.nvim_buf_get_name(i)
	end
	return fzy_tmux_popup_select(buffer_names)
end

