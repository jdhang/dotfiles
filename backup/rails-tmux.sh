#!/bin/zsh

clear

tmux start-server
tmux new-session -d -s work
tmux send-keys -t work:1 "rails s" C-m
tmux rename-window -t work:1 server
tmux new-window -t work:2
tmux send-keys -t work:2 "rails c" C-m
tmux rename-window -t work:2 console
tmux new-window -t work:3
tmux send-keys -t work:3 "vim" C-m
tmux new-window -t work:4
tmux rename-window -t work:4 shell

tmux attach -t work:3
exit
