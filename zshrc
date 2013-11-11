# Base16 shell colors
. "$HOME/.src/base16-shell/base16-default.dark.sh"

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Git completion
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit && compinit

# Aliases
alias android="/Applications/Android Studio.app/sdk/tools/emulator -avd Nexus_4"
alias git="hub"
alias haml="haml -q -f html5 --unix-newlines"
alias iphone="open /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app"
alias jasmine="jasmine-node --coffee"
alias ll="ls -aFhl"
alias reload=". ~/.zshrc"
alias restart="touch tmp/restart.txt"
alias rr="rm -rf"
alias s="subl"
alias scss="scss --unix-newlines"
alias settings="s ~/Projects/dotfiles"
alias unhitch="hitch -u"
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

  if [[ $(command git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]]; then
    local _dirty=" with ${BLUE}Δ$RESET"
  fi

  if [ -n "$_branch_name" ]; then
    echo -e " on [±:$BLUE$_branch_name$RESET$_dirty]"
  fi
}

function hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}

hitch

# Prompt
setopt prompt_subst
function precmd() {
  export PS1=$'$RED%n$RESET at $YELLOW%m$RESET in $GREEN%~$RESET$(git_prompt) on $MAGENTA%D{%a %B %d}$RESET at $CYAN%D{%I:%M %p}$RESET\n⚡ '
}
