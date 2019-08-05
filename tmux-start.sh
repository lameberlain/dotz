SESSION=$USER
tmux -2 new-session -d -s $SESSION

# Editor Window
tmux rename-window 'Editor'
tmux split-window -v
tmux resize-pane -D 20
# Server Window
tmux new-window -t $SESSION:2 -n 'Server'
# Misc Window
tmux new-window -t $SESSION:3 -n 'Misc.'

tmux select-window -t $SESSION:1

tmux -2 attach-session -t $SESSION
