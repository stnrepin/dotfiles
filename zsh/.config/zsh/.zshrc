export ZSH="/home/acesk/.oh-my-zsh"
ZSH_THEME="acesk"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

##
## VARIABLES
##

export EDITOR='nvim'

##
## ALIASES
##

# Sudos
#
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias netctl='sudo netctl'
alias wifi-menu='sudo wifi-menu'

# New commands
#
alias lsa='ls -apv'
alias cd..='cd ..'
alias r='ranger'
alias usb-m='udisksctl mount -b'
alias usb-u='udisksctl unmount -b'

# Overrides
#
alias vim='nvim'
alias v='nvim'
alias ls='ls --color=auto --group-directories-first'
alias mkdir='mkdir -p'
alias xclip='xclip -r -selection clipboard'
alias cal='cal -m -3'
