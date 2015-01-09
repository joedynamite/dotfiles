# Environment Variables
CLICOLOR="1"
GREPCOLORS="ExGxFxDxCxDxDxHbAdExEx"
LSCOLORS="ExGxFxDxCxDxDxHbAdExEx"
NVM_DIR="/usr/local/var/nvm"
PATH="/usr/local/bin/npm:/usr/local/heroku/bin:/usr/local/var/rbenv/shims:/usr/local/bin:/usr/local/sbin:$PATH"
RBENV_ROOT="/usr/local/var/rbenv"
VISUAL="vim"

export CLICOLOR GREPCOLORS LSCOLORS NVM_DIR PATH RBENV_ROOT VISUAL

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
source $(brew --prefix nvm)/nvm.sh
