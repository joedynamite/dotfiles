# Environment Variables
CLICOLOR="1"
GREPCOLORS="ExGxFxDxCxDxDxHbAdExEx"
LSCOLORS="ExGxFxDxCxDxDxHbAdExEx"
PATH="/usr/local/heroku/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:$PATH"
RBENV_ROOT="/usr/local/var/rbenv"
VISUAL="vim"

export CLICOLOR GREPCOLORS LSCOLORS PATH RBENV_ROOT VISUAL

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
