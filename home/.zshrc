export ANTIGEN_ZSH=$HOME/.local/antigen.zsh
export ANTIGEN_BUNDLES=$HOME/.antigen/bundles
[[ ! -e $ANTIGEN_ZSH ]] && curl -L git.io/antigen > $ANTIGEN_ZSH
source $ANTIGEN_ZSH

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme eastwood
antigen apply

# ENV
set -a
TEX_LIVE_PATH=/usr/local/texlive/2022/bin/universal-darwin

PATH=$HOME/.local/bin:/usr/local/bin:$PATH
PATH=/opt/homebrew/bin:$PATH
PATH=$TEX_LIVE_PATH:$PATH
EDITOR='vim'
VISUAL=$EDITOR

# Locale Setting
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8
