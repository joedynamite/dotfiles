# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Git completion
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit && compinit

# Aliases
alias android="/Applications/Android\ Studio.app/sdk/tools/emulator -avd Nexus4"
alias battery='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'
alias bom="rm -rf bower_components && bower cache clean && bower install"
alias git="hub"
alias iphone="open /Applications/Xcode.app/Contents/Applications/iOS Simulator.app"
alias ll="ls -aFhl"
alias nom="rm -rf node_modules && npm cache clean && npm install"
alias nombom="nom && bom"
alias rebundle="rm -rf vendor/bundle && bundle install"
alias reload="source ~/.zshrc"
alias restart="touch tmp/restart.txt"
alias rr="rm -rf"
alias s="subl"
alias settings="s ~/.dotfiles"
alias unhitch="hitch -u"
alias v="vim"
alias vhosts="sudo subl /etc/apache2/extra/httpd-vhosts.conf"

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
    local _dirty=" with ${RED}Δ$RESET"
  fi

  if [ -n "$_branch_name" ]; then
    echo -e " on [±:$RED$_branch_name$RESET$_dirty]"
  fi
}

function hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}

hitch

# direnv
eval "$(direnv hook $0)"

# Prompt
setopt prompt_subst
function precmd() {
  export PS1=$'$YELLOW%~$RESET$(git_prompt) at $BLUE%D{%I:%M %p}$RESET\n⚡ '
}
