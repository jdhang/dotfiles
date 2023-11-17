#!/usr/bin/env fish
set session (find ~src/libs ~/src/apps ~/.config ~/code -mindepth 1 -maxdepth 1 -type d | fzf)

if not test -z "$session"
  exit 0
end

set session_name (basename "$session"|tr . _)
set tmux_running (pgrep tmux)

if test -z "$TMUX" and test -z "$tmux_running"
  tmux new-session -s "$session_name" -c "$session"
  exit 0
else

if not tmux has-session -t "$session_name" 2>/dev/null 
  tmux new-session -s "$session_name" -d -c "$session" 
end

tmux switch-client  -t "$session_name"
