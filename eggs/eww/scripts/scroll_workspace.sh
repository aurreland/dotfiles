#!/bin/sh

if [ "$1" == "up" ]; then
    hyprctl dispatch workspace e+1
elif [ "$1" == "down" ]; then
    hyprctl dispatch workspace e-1
fi
