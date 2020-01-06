#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Include host-specific .xinitrc if presented
test -f ~/.xinitrc.local && source ~/.xinitrc.local

# Keyboard settings
xset r rate 150 20
xmodmap ~/.Xmodmap

exec i3

