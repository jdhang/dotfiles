# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship-2"
# ZSH_THEME="jdhang2"

plugin=(git brew osx vagrant wd gem npm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

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

# docker
# eval "$(docker-machine env)"

# default editor
export EDITOR='nvim'

# Sourcing other files
source $HOME/.dotfiles/zsh/aliases
# source ~/.oh-my-zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -t 0 ]; then
  stty start ''
  stty stop ''
  stty -ixon
  stty ixoff
  stty ixany
fi

# added by travis gem
[ -f /Users/jdhang/.travis/travis.sh ] && source /Users/jdhang/.travis/travis.sh

# learndot setups
export NODE_ENV="development"
# function chpwd {
#   check_node_version
# }
# export GEMFURY_URL=https://npm-proxy.fury.io/{You\'ll be given this code when you set up}/me/

# Ensure Node Version is Stable
function check_node_version {
  local node_v=`node -v`
  local node_latest=`n --stable`
  local curr_folder=`pwd`
  if [[ ${curr_folder} =~ 'newlearn' || ${curr_folder} =~ 'learndot'  ]]; then
    if [[ ${node_v} == 'v6.1.0' ]]; then return
    else
      echo "Switching to Node 6.1.0"
      n 6.1.0
    fi
  else
    if [[ v${node_latest} == ${node_v} ]]; then return
    else
      echo "Switching to Node stable"
      n stable
    fi
  fi
}
# Run function at start
# check_node_version
