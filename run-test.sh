#!/bin/bash
session_uuid="test-lb"
tmux new -d -s "$session_uuid"
tmux splitw -t "$session_uuid:" -dv
tmux send -t"$session_uuid:.0" "./ssh-workload-1a.sh ./test-url.sh 1a" Enter
tmux splitw -t "$session_uuid:" -dh
tmux send -t"$session_uuid:.1" "./ssh-workload-1c.sh ./test-url.sh 1c" Enter
tmux splitw -t "$session_uuid:" -dh
tmux send -t"$session_uuid:.1" "./ssh-workload-1b.sh ./test-url.sh 1b" Enter
tmux attach -t "$session_uuid"

