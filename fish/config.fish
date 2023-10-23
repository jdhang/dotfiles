set -g theme_nerd_fonts yesA

set -x EDITOR "nvim"

alias nv='nvim'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/jdhang/miniconda3/bin/conda
    eval /Users/jdhang/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

starship init fish | source
