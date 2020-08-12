export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="stnrepin"

source $ZSH/oh-my-zsh.sh

# Syntax highlighting
zsh_highlighting_dir_1=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zsh_highlighting_dir_2=/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [ -f "$zsh_highlighting_dir_1" ]; then
    source "$zsh_highlighting_dir_1"
else
    source "$zsh_highlighting_dir_2"
fi

# Path
path+=("$HOME/.cargo/bin/")

##
## VARIABLES
##

export EDITOR='nvim'

##
## Key bindings
##
bindkey "^K" history-beginning-search-backward
bindkey "^J" history-beginning-search-forward

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
alias py='python'
alias za='zathura'

# Functions
#
function rr() {
    if [ -n "$1" ]; then
        ranger --cmd="enter_bookmark $1" --cmd="cd ${2:-.}"
    else
        ranger
    fi
}

function mcd() { mkdir -p "$1" && cd "$1" }

# Overrides
#
alias vim='nvim'
alias v='nvim'
alias ls='ls --color=auto --group-directories-first'
alias mkdir='mkdir -p'
alias xclip='xclip -r -selection clipboard'
alias cal='cal -m -3'

# Git
#
alias g='git'
alias gcl='git clone'
alias gf='git fetch'
alias ga='git add'
alias gaa='git add --all'
alias gs='git status -sb'
alias gd='git diff'
alias gc='git commit -v'
alias gp='git push'
alias gr='git restore'
alias grs='git restore --staged'
alias gl='git log'
alias gch='git checkout'
alias gb='git branch'

