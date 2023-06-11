" https://www.reddit.com/r/vim/comments/jhqzsv/signature_help_via_ale/
" let g:ale_completion_enabled=1
let g:ale_lint_on_text_changed=0
let g:ale_completion_delay=1
let g:ale_lint_delay=1
" let g:ale_floating_preview=1
let g:ale_hover_to_preview=1
let g:ale_floating_window_border = []

let g:ale_set_signs=1
" let g:ale_sign_column_always=1     
let g:ale_sign_error=''
let g:ale_sign_highlight_linenrs=1
" let g:ale_virtualtext_cursor=1

let g:ale_sign_error=''
let g:ale_sign_warning=''

let g:ale_fixers={
			\    'c' : ['clang-format'],
			\    'cpp': ['clnag-format']
			\}

" linters
let s:clangd_common_options='--pretty --completion-style=detailed'
let g:ale_c_clangd_options=s:clangd_common_options
let g:ale_cpp_clangd_options=s:clangd_common_options

let g:ale_linters={
			\    'c' : ['clangd'],
			\    'cpp': ['clangd']
			\}

""" SCRIPTS 

""" load settings
augroup ale_comp
	au! 
	let linter_pattern=g:ale_linters->keys()->map({k,v->'*.'.v})->join(',')
	execute "au BufRead "..linter_pattern.." call AutoOmniInit()"
augroup end

""" autoomni
function! AutoOmniInit()
	set omnifunc=ale#completion#OmniFunc
	let b:auto_omni={}
	let b:auto_omni.open_regex='[a-zA-Z_#.-][a-zA-Z0-9_#>.]\{1,}$'
	augroup auto_omni
		au! * <buffer>
		au InsertCharPre <buffer> call AutoOmni()
		au CompleteChanged <buffer> call AutoOmniFilter()
	augroup end
endfunction

function! AutoOmni()
	if !pumvisible()
		let input=getline('.')[:g:u.getcn()-2].v:char
		if !empty(matchstr(input,b:auto_omni.open_regex))
			call AutoOmniOpen()
		endif
	endif
endfunction

function! AutoOmniFilter()
	" do not allow empty complete
	let input=getline('.')[:g:u.getcn()-2].'a'
	if empty(matchstr(input,b:auto_omni.open_regex))
		call AutoOmniClose()
	endif
endfunction

function! AutoOmniRemapCtrlN()
	" open only when AutoOmniOpen is activated
	if has_key(b:,'auto_omni') && !pumvisible()
		return "\<C-x>\<C-o>"
	else
		return "\<C-n>"
	endif
endfunction

function! AutoOmniOpen()
	silent! call feedkeys("\<C-x>\<C-o>", "n")
endfunction

function! AutoOmniClose()
	" close the popup menu
	silent! call feedkeys("\<C-e>", "n")
endfunction

