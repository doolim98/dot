# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

####### MY SETTINGS #######

# env settings
export PATH=/home/hjoll6/bin:$PATH
export PATH=/home/hjoll6/.emacs.d/bin:$PATH
export GIT_SSL_NO_VERIFY=1

# export TERM=xterm-256color

# ALIAS
alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias pu.='pushd .'
alias pu='pushd'
alias po='popd'
alias vim='vim'
alias open='xdg-open'
alias e='nvim'
alias p3='python3'
#alias vim='nvim'
alias tmux='tmux -2'
alias ts='tmux split-window'
alias tv='tmux split-window -h'
alias conda-shell="eval $($HOME'/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# alias conda-shell='eval `/home/hjoll6/anaconda3/bin/conda shell.bash hook`'
export PS1='\[\033[07m\]\u@\h\[\033[00m\] \[\033[07m\] \w\[\033[00m\] '
# export PS1='\u@\h \[\033[07m\]\w\[\033[00m\] '

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

trap pre_command DEBUG




# my functions

function export_path()
{
	export PATH=$PWD:$PATH
	# echo "export PATH=$PWD:\$PATH" >> ~/.bashrc 
}

function add_path()
{
	export PATH=$PWD:$PATH
	echo "export PATH=$PWD:\$PATH" >> ~/.bashrc 
}


function pre_command()
{
	echo -ne '\033[00m'
}

function my_color_test()
{
	for i in {0..255} ; do
		printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
		if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
			printf "\n";
		fi
	done
}

function tctest()
{
	# Based on: https://gist.github.com/XVilka/8346728

	awk -v term_cols="${width:-$(tput cols || echo 80)}" 'BEGIN{
	s="/\\";
	for (colnum = 0; colnum<term_cols; colnum++) {
		r = 255-(colnum*255/term_cols);
		g = (colnum*510/term_cols);
		b = (colnum*255/term_cols);
		if (g>255) g = 510-g;
			printf "\033[48;2;%d;%d;%dm", r,g,b;
			printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
			printf "%s\033[0m", substr(s,colnum%2+1,1);
		}
		printf "\n";
	}'
}

function my_font_test()
{
	echo -e "\e[1mbold\e[0m"
	echo -e "\e[3mitalic\e[0m"
	echo -e "\e[3m\e[1mbold italic\e[0m"
	echo -e "\e[4munderline\e[0m"
	echo -e "\e[9mstrikethrough\e[0m"
	echo -e "\e[31mHello World\e[0m"
	echo -e "\x1B[31mHello World\e[0m"
}

function my_reload()
{
	source ~/.bashrc
}

function jupyter_server()
{
	jupyter notebook --no-browser --port=8888
}

# END USER CONFIG 
export PATH=/home/hjoll6/pap/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/bin:$PATH
export PATH=/home/hjoll6/pap/qemu-5.2.0/build:$PATH
export PATH=/home/hjoll6/bin:$PATH


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
