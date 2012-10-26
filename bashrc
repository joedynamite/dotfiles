# Base16 shell colors
. "$HOME/Source/base16-shell/base16-default.dark.sh"

# Git completion
. "/usr/local/etc/bash_completion.d/git-completion.bash"

# Aliases
alias git="hub"
alias haml="haml -q -f html5 --unix-newlines"
alias jasmine="jasmine-node --coffee"
alias ll="ls -alF"
alias mvim="vim"
alias rr="rm -rf"
alias s="subl"
alias scss="scss --unix-newlines"
alias unhitch="hitch -u"
alias v="vim"

# Environment variables
CLICOLOR="1"
GREPCOLORS="ExGxFxDxCxDxDxHbAdExEx"
LSCOLORS="ExGxFxDxCxDxDxHbAdExEx"
PATH="$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python:$PATH"
PS1="\e[1;31m\u\e[0;39m at \e[1;33m\h\e[0;39m in \e[1;32m\w\e[0;39m\$(git_prompt) on \e[1;35m\d\e[0;39m at \e[1;36m\@\e[0;39m \n⚡ "
VISUAL="vim"

export CLICOLOR GREPCOLORS LSCOLORS PATH PS1 VISUAL

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Functions
function git_prompt {
  local _branch_name=`git branch --no-color 2> /dev/null | awk '/^\*/ { print $2 }'`
  local _dirty=`[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "\033[0;39m with \033[1;34mΔ"`

  if [ -n "$_branch_name" ]
    then echo -e " on [±:\033[1;34m$_branch_name$_dirty\033[0;39m]"
  fi
}
