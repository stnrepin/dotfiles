#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset r rate 150 20

exec i3

