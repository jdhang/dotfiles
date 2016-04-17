# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="jdhang"
ZSH_THEME="jdhang2"

plugin=(git brew osx vagrant wd gem)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

# Heroku Path
export PATH="/usr/local/heroku/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

export EDITOR='vim'

# Sourcing other files
source $HOME/.dotfiles/zsh/aliases

# export http_proxy=http://usx27304:January2015@www.mc.xerox.com:8001
# export https_proxy=https://usx27304:January2015@www.mc.xerox.com:8001

if [ -t 0 ]; then
  stty start ''
  stty stop ''
  stty -ixon
  stty ixoff
  stty ixany
fi
