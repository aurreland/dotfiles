#!/bin/bash
tmux attach -t $(tmux ls | grep -v attached | head -1 | cut -f1 -d:) || tmux
