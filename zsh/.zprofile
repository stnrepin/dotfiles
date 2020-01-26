#!/bin/zsh

export ZDOTDIR="$HOME/.config/zsh"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

