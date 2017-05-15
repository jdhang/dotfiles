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

# Default editor
export EDITOR='nvim'

# Import aliases
source ~/.dotfiles/bash/aliases

# Prompt config
# export GIT_PS1_SHOWDIRTYSTATE=1
# export GIT_PS1_SHOWUNTRACKEDFILES=1
# export PS1="\e[1m\[\e[36m\]\w on \[\e[m\]$(__git_ps1 "[%s]") \e[1mvia \[\e[32m\]$(node -v)\[\e[m\]\n\e[1m\$\[\e[m\] "
# export PS1="\e[1m\[\e[36m\]\w \`spaceship_git\`via \[\e[32m\]$(node -v)\[\e[m\]\n\e[1m\$\[\e[m\] "
export PS1="\e[1m\[\e[36m\]\w \`git_prompt\`\`node_prompt\`\n\e[1m\$\[\e[m\] "
# export PS1="\e[1m\[\e[36m\]\w\[\e[m\] on \`parse_git_branch\` via \[\e[32m\]$(node -v)\[\e[m\]\n\e[1m\$\[\e[m\] "
