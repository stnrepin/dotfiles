#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Use multi monitor setup
xrandr --output DVI-0 --auto --right-of HDMI-0

# Keyboard settings
xset r rate 150 20

exec i3

