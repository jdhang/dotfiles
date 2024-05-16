# add homebrew path
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

set -g theme_nerd_fonts yes

set -x LANG en_US.UTF-8
set -x EDITOR "nvim"

# ALIASES
# general
alias ..='cd ..'
alias c='clear'
alias nv='nvim'
alias cfish='$EDITOR ~/.config/fish/config.fish'
alias sfish='source ~/.config/fish/config.fish'
alias lsal='ls -al'

# git
alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gdmc='git diff --name-only --diff-filter=U --relative'
alias gl='git log'
alias gpuo='git push -u origin'
alias gp='git pull'
alias gpy='git pull && yarn'
alias gP='git push'
alias gs='git status'
alias grs='git restore --staged'
alias gr='git restore'
alias gm='git merge'

# tmux
alias ta='tmux attach -t'
alias tad='tmux attach -d t'
alias tl='tmux list-session'
alias tn='tmux new -s'
alias tk='tmux kill-server'
alias tkt='tmux kill-server -t'
alias ts='tmux-sessionizer\n'

# code shortcuts
alias as='cd ~/src/apps/web-app-account-and-setup'
alias wp='cd ~/src/apps/web-portal'
alias wl='cd ~/src/apps/web-legacy'
alias wm='cd ~/src/apps/web-mosaic'
alias inv='cd ~/src/apps/web-app-inventory'
alias ivc='cd ~/src/apps/web-app-invoices'
alias olo='cd ~/src/apps/web-app-setup-online-ordering'
alias olol='cd ~/src/libs/web-lib-online-ordering'
alias olor='cd ~/src/apps/web-app-online-retail'
alias sa='cd ~/src/apps/web-app-sales-activity'
alias vr='cd ~/src/apps/web-app-virtual-terminal'
alias calc='cd ~/src/libs/calc'
alias cos='cd ~/src/apps/server'
alias pup='cd ~/src/apps/puppet'
alias arch='cd ~/src/apps/architecture'
alias apps='cd ~/src/apps'
alias temps='cd ~/src/templates'

# config shortcuts
alias d='cd $HOME/.dotfiles'

# functions
function clean
  git reset --soft HEAD~$argv[1]
end

function bs
    tn win-term
    wm
    podman machine start
    podman run -it -p 6379:6379 docker.io/library/redis
    \cab
end

# if status is-interactive
# and not set -q TMUX
#     # Commands to run in interactive sessions can go here
#     if tmux has-session -t home
#         exec tmux attach-session -t home
#     else
#         tmux new-session -s home
#     end
# end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/jason.hang/miniconda3/bin/conda
    eval /Users/jason.hang/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/jason.hang/miniconda3/etc/fish/conf.d/conda.fish"
        . "/Users/jason.hang/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/jason.hang/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jason.hang/google-cloud-sdk/path.fish.inc' ]; . '/Users/jason.hang/google-cloud-sdk/path.fish.inc'; end
