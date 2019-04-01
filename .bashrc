#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment variables
export EDITOR='nvim'
export VISUAL="$EDITOR"

# Command aliases
#
alias ls='ls --color=auto --group-directories-first'
alias lsa='ls -apv'
alias md='mkdir -p'
alias xclip='xclip -r -selection clipboard'
alias vim='nvim'

# Aliases for sudo
#
alias netctl='sudo netctl'
alias wifi-menu='sudo wifi-menu'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'

# Small scripts
#
alias con-check='ping -c 3 google.com'
alias google-time="curl -I --silent 'https://google.com/' | grep -i '^date:'"

PS1='[\u@\h \W]\$ '

