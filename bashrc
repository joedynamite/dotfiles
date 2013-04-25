# Base16 shell colors
. "$HOME/src/base16-shell/base16-default.dark.sh"

# Git completion
. "/usr/local/etc/bash_completion.d/git-completion.bash"

# Aliases
alias git="hub"
alias haml="haml -q -f html5 --unix-newlines"
alias iphone="open /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app"
alias jasmine="jasmine-node --coffee"
alias ll="ls -alF"
alias rr="rm -rf"
alias s="subl"
alias scss="scss --unix-newlines"
alias unhitch="hitch -u"
alias v="vim"

# Colors
AQUA="\033[1;36m"
BLUE="\033[1;34m"
GREEN="\033[1;32m"
PURPLE="\033[1;35m"
RED="\033[1;31m"
WHITE="\033[0;39m"
YELLOW="\033[1;33m"

# Environment variables
CLICOLOR="1"
GREPCOLORS="ExGxFxDxCxDxDxHbAdExEx"
LSCOLORS="ExGxFxDxCxDxDxHbAdExEx"
PATH="/usr/local/heroku/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python:$PATH"
PS1="$RED\u$WHITE at $YELLOW\h$WHITE in $GREEN\w$WHITE\$(git_prompt) on $PURPLE\d$WHITE at $AQUA\@$WHITE \n⚡ "
VISUAL="vim"

export CLICOLOR GREPCOLORS LSCOLORS PATH PS1 VISUAL

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Functions
function git_prompt {
  local _branch_name=`git branch --no-color 2> /dev/null | awk '/^\*/ { print $2 }'`
  local _dirty=`[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "$WHITE with ${BLUE}Δ"`

  if [ -n "$_branch_name" ]
    then echo -e " on [±:$BLUE$_branch_name$_dirty$WHITE]"
  fi
}

function hitch {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}

hitch
