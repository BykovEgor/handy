#!/bin/bash

if [ -z $1 ]
then
    echo -n "Enter session name: "
    read name
else
    echo "Using session name $1"
fi

tmux new-session -d -s $1
tmux rename-window -t 0 'main'
tmux send-keys -t 'main' "ls -lah" C-m
tmux split-window -t 'main' -v
tmux send-keys "htop" C-m
tmux split-window -h
tmux send-keys "watch -n 1 -d nvidia-smi" C-m
tmux resize-pane -R 23
tmux selectp -t 0
tmux attach-session -t $1