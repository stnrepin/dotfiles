#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Include host-specific .xinitrc if presented
test -f ~/.xinitrc.local && source ~/.xinitrc.local

# Keyboard settings
xset r rate 150 20
xset r 66
setxkbmap -layout us,ru \
    -option shift:both_capslock \
    -option grp:shift_caps_switch

wm_name=${1:-i3}
echo "Launching $wm_name..."
exec $wm_name

