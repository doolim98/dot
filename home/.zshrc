export ZSH=$HOME/.oh-my-zsh
export dot=$HOME/dot
export PATH=$dot/bin:$HOME/.local/bin:$HOME/.bin:/usr/local/bin:$PATH
export PATH=$dot/tests:$PATH
export PATH=$dot/bin:$PATH

ZSH_THEME="eastwood"
# Which plugins would you like to load?
plugins=(
	git 
	# vi-mode
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='nvim'
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
fi

# colorscheme
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_solarized-light

# lazy shell
function cdls()
{
	cd $1
	ls
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
alias cl='cdls'

alias src_zshrc='source ~/.zshrc'

# tmux
alias tmux='tmux -2'
alias ts='tmux split-window'
alias tv='tmux split-window -h'

# llvm config
export PATH=$(llvm-config-12 --bindir):$PATH


