# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Git completion
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit && compinit

# Aliases
alias a="atom"
alias git="hub"
alias ll="ls -aFhl"
alias nom="rm -rf node_modules && npm cache clean && npm install"
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

# Prompt
setopt prompt_subst
function precmd() {
  export PS1=$'$YELLOW%~$RESET$(git_prompt) at $BLUE%D{%I:%M %p}$RESET\n$ '
}

# Add all identities stored in your keychain.
ssh-add -A 2>/dev/null

# bindkey -v
# export KEYTIMEOUT=1
#
# function zle-line-init zle-keymap-select () {
#     if [ "$TERM" = "xterm-256color" ]; then
#         if [ $KEYMAP = vicmd ]; then
#             # the command mode for vi
#             echo -ne "\e[2 q"
#         else
#             # the insert mode for vi
#             echo -ne "\e[4 q"
#         fi
#     fi
# }
#
# zle -N zle-keymap-select
# zle -N zle-line-init
