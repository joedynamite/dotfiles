# Environment Variables
CDPATH="$HOME/Projects:$HOME/Conde Nast:$CDPATH"
CLICOLOR="1"
FPP_EDITOR="subl"
GREPCOLORS="ExGxFxDxCxDxDxHbAdExEx"
LSCOLORS="ExGxFxDxCxDxDxHbAdExEx"
NVM_DIR="/usr/local/var/nvm"
PATH="/usr/local/heroku/bin:/usr/local/var/rbenv/shims:/usr/local/bin:/usr/local/sbin:$PATH"
RBENV_ROOT="/usr/local/var/rbenv"

export CDPATH CLICOLOR FPP_EDITOR GREPCOLORS LSCOLORS NVM_DIR PATH RBENV_ROOT

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
source $(brew --prefix nvm)/nvm.sh
