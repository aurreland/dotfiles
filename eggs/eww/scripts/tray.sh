#!/bin/sh

if ps -A | grep -q -e "nm-applet" -e "caffeine" -e "blueman" || ps -A; then
    echo "true"
else
    echo "false"
fi
