# Environment Variables
CLICOLOR="1"
GREPCOLORS="ExGxFxDxCxDxDxHbAdExEx"
LSCOLORS="ExGxFxDxCxDxDxHbAdExEx"
PATH="/usr/local/heroku/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python:$PATH"
VISUAL="vim"

export CLICOLOR GREPCOLORS LSCOLORS PATH VISUAL

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
