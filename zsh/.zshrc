# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"

# spaceship theme overrides
SPACESHIP_PROMPT_SYMBOL="$"
SPACESHIP_DOCKER_SHOW=false

plugins=(git osx gem node npm ruby bower kubectl pip postgres redis-cli tmux vagrant wd yarn zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# user configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# heroku
export PATH="/usr/local/heroku/bin:$PATH"

# node
export PATH="$HOME/.node/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# docker
# eval "$(docker-machine env)"

# default editor
export EDITOR='nvim'

# Sourcing other files
source $HOME/.dotfiles/zsh/aliases

if [ -t 0 ]; then
  stty start ''
  stty stop ''
  stty -ixon
  stty ixoff
  stty ixany
fi
