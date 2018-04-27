# Environment Variables
CDPATH="$HOME/fabric:$CDPATH"
CLICOLOR="1"
GREPCOLORS="ExGxFxDxCxDxDxHbAdExEx"
LSCOLORS="ExGxFxDxCxDxDxHbAdExEx"
NVM_DIR="$HOME/.nvm"
PATH="/usr/local/heroku/bin:/usr/local/var/rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
RBENV_ROOT="/usr/local/var/rbenv"

export CDPATH CLICOLOR GREPCOLORS LSCOLORS NVM_DIR PATH RBENV_ROOT

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
source $(brew --prefix nvm)/nvm.sh

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
