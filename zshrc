# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Git completion
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit && compinit

# Aliases
alias a="atom"
alias git="hub"
alias ll="ls -aFhl"
alias rr="rm -rf"
alias v="vim"

# Colors
autoload -U colors && colors
CYAN="%{$fg[cyan]%}"
BLUE="%{$fg[blue]%}"
GREEN="%{$fg[green]%}"
MAGENTA="%{$fg[magenta]%}"
RED="%{$fg[red]%}"
YELLOW="%{$fg[yellow]%}"
RESET="%{$reset_color%}"

# Functions
function git_prompt() {
  local _branch_name=`command git branch --no-color 2> /dev/null | awk '/^\*/ { print $2 }'`

  if [[ $(command git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]]; then
    local _dirty=" with ${RED}Δ$RESET"
  fi

  if [ -n "$_branch_name" ]; then
    echo -e " on [±:$RED$_branch_name$RESET$_dirty]"
  fi
}

# direnv
eval "$(direnv hook $0)"

# Prompt
setopt prompt_subst
function precmd() {
  export PS1=$'$YELLOW%~$RESET$(git_prompt) at $BLUE%D{%I:%M %p}$RESET\n$ '
}

# SSH Keys
ssh-add -A 2> /dev/null
