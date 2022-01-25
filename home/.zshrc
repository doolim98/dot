export dot=$HOME/dot
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/.bin:$PATH

export ZSH=$HOME/.oh-my-zsh
plugins=(
	git 
	# vi-mode
)


# Preferred editor for local and remote sessions
export EDITOR='nvim'
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
fi

# colorscheme
BASE16_SHELL="$dot/pkgs/base16-shell"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_solarized-light
ZSH_THEME="eastwood"

# I am lazy..
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


source $ZSH/oh-my-zsh.sh
