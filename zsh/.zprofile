#!/bin/zsh

export ZDOTDIR="$HOME/.config/zsh"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  read '?Launch [0 - terminal/1* - i3]: ' wm_index
  wm_name=i3
  case $wm_index in
    0 ) wm_name='';;
    1 ) wm_name=i3;;
    2 ) wm_name=bspwm;;
  esac
  if [ -n "$wm_name" ]; then
    startx "$HOME/.xinitrc" $wm_name
  fi
fi

