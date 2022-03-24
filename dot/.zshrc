# plugin manager 'antigen'
mkdir -p $HOME/.local
export ANTIGEN_ZSH=$HOME/.local/antigen.zsh
export ANTIGEN_BUNDLES=$HOME/.antigen/bundles
if [[ ! -a $ANTIGEN_ZSH ]];then 
	echo "install antigen ..."
	curl -L git.io/antigen > $ANTIGEN_ZSH
fi
source $ANTIGEN_ZSH
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle aperezdc/zsh-fzy
antigen theme eastwood
antigen apply

# ENV
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.opam/default/bin:$PATH
export EDITOR='nvim'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts"
source $BASE16_SHELL/base16-solarized-light.sh

function add_path_env()
{
	touch ~/.zshenv
	new_path=$(realpath $1)
	export PATH=$new_path:$PATH
	echo "export PATH=$new_path:\$PATH" >> ~/.zshenv
}

function reload_zshrc()
{
}


# my alias
alias e='$EDITOR'
alias pu.='pushd .'
alias pu='pushd'
alias po='popd'
alias l='ls'
alias ll='ls -al'
alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias bbbb='cd ../../../..'
alias tr='tree --filelimit=20 --dirsfirst -L 3'

# tmux
alias tmux='tmux -2'
alias ts='tmux split-window'
alias tv='tmux split-window -h'

# key bindings
bindkey '^Qd' fzy-cd-widget
bindkey '^Qf'  fzy-file-widget
bindkey '^Qh'  fzy-history-widget
# bindkey '^P'  fzy-proc-widget

