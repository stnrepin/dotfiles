# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=''
source $ZSH/oh-my-zsh.sh

# Theme
source /home/$USER/.config/zsh/stnrepin.zsh

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
bindkey '^K' up-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^J' down-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

##
## ALIASES
##

# Sudos
#
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'
alias netctl='sudo netctl'
alias wifi-menu='sudo wifi-menu'

# New commands
#
alias lsa='ls -apv'
alias ll='ls -1lhapv';
alias cd..='cd ..'

alias r='ranger'
alias usb-m='udisksctl mount -b'
alias usb-u='udisksctl unmount -b'
alias py='python'
alias za='zathura'
alias trclip='transmission-cli "$(xclip -o)"'
alias open='xdg-open'

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
alias gpl='git pull'
alias gr='git restore'
alias grs='git restore --staged'
alias gl='git log'
alias gch='git checkout'
alias gb='git branch'

# Build with CMake
#
alias b='cmake --build . -- -j8'

ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        tmux rename-window "$(echo $* | cut -d . -f 1)"
        command ssh "$@"
        tmux set-window-option automatic-rename on 'on' 1>/dev/null
    else
        command ssh "$@"
    fi
}
