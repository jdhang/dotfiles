source ~/.dotfiles/bash/.git-prompt.sh

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
bind TAB:menu-complete

# user configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# postgres path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# heroku path
export PATH="/usr/local/heroku/bin:$PATH"

# node path
export PATH="$HOME/.node/bin:$PATH"

# pyenv init
eval "$(pyenv init -)"

# default editor
export EDITOR='nvim'

# import aliases
source ~/.dotfiles/bash/aliases

# prompt config
export PS1="\[$BOLD\]\[$BLUE\][\[$RESET\]\[$GREEN\]\[\u\]\[$BOLD\]\[$BLUE\]]\[$RESETBOLD\] \[$CYAN\]\[\w\] \`git_prompt\`\`node_prompt\`\[\n\]\[$BOLD\]\[\$\]\[$RESET\] "

