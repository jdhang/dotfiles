source ~/.dotfiles/bash/.git-prompt.sh

# Bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
bind TAB:menu-complete

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Heroku Path
export PATH="/usr/local/heroku/bin:$PATH"

# node
export PATH="$HOME/.node/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

export EDITOR='nvim'

source ~/.dotfiles/bash/aliases
