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

# pyenv
eval "$(pyenv init -)"

# Default editor
export EDITOR='nvim'

# Import aliases
source ~/.dotfiles/bash/aliases

# Prompt config
export PS1="\e[1m\[\e[36m\]\w \`git_prompt\`\`node_prompt\`\n\e[1m\$\[\e[m\] "
