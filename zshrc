# Base16 Shell
BASE16_SCHEME="eighties"
BASE16_VARIANT="dark"
BASE16_SHELL="$HOME/.src/base16-builder/output/shell/base16-$BASE16_SCHEME.$BASE16_VARIANT.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Git completion
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit && compinit

# Git Flow completion
source /usr/local/share/zsh/site-functions/git-flow-completion.zsh

# Aliases
alias a="atom"
alias android="/Applications/Android\ Studio.app/sdk/tools/emulator -avd Nexus4"
alias battery='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'
alias git="hub"
alias iphone="open /Applications/Xcode.app/Contents/Applications/iOSt\ Simulator.app"
alias ll="ls -aFhl"
alias rebower="rm -rf bower_components && bower install"
alias rebundle="rm -rf vendor/bundle && bundle install"
alias reload=". ~/.zshrc"
alias renpm="rm -rf node_modules && npm install"
alias restart="touch tmp/restart.txt"
alias rr="rm -rf"
alias s="subl"
alias settings="s ~/Projects/dotfiles"
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
