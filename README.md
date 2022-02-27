# IDEAS
- Directory Shortcuts
	- Copy current selections 
# TODO
- nerd tree toggle
- oh-my-zsh to zplug
- tmux custom layout (i.e split top pan (current one top pane))
- wirte fzy commands
	- fzy path writer

# Design
## Motivation
- navigating > editing(normal mode) >> typing(insert mode)
	- vim 
		- achieved editing >> typing(normal mode is default)
		- not good code,buffer,window navigating it self(goto previous buffers, next windows, tabs ... )
	- I realized that I navigates code more than editing.
## Components
- navigating (normal mode)
	- do we need tabs?
		- one editor did not do one thing
	- highlight words(symbol) (* in vim)
		- 
	- windows
		- select (1 2 3 4)( keyboard number)
			- open in new window (1 2 3 4)
		- move (1 2 3 4)
			- goto window 1 2 3 4
	- buffers
		- goto prev/next buffer
			- HL
	- code
		- jump list
		- goto def
		- find ref
	- cursors
		- hjkl
		- f@ : goto char
		- wb : move word
		- du : page up down
		- Enter : center
- editing (visual mode)
	- select
		- vvvvvvvvvv (expand selections)
		- S-v (select line)
	- delete
		- backspace : delete(one character in normal mode)
		- i : delete and goto insert

# Learning new script languages.
- Integrated Man(Help) page.
- Debugging Tool.
