if status is-interactive
    set -g fish_greeting

    set -gx EDITOR nvim

    fish_add_path --append '~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/'

    alias poweroff='systemctl poweroff'
    alias reboot='systemctl reboot'
    alias lsa='ls -apv'
    alias ll='ls -1lhapv'
    alias r='vifm .'
    alias usb-m='udisksctl mount -b'
    alias usb-u='udisksctl unmount -b'
    alias py='python'
    alias za='zathura'
    alias open='xdg-open'
    alias b='cmake --build . -- -j8'
    alias v='nvim'

    alias ls='ls --color=auto --group-directories-first'
    alias mkdir='mkdir -p'
    alias xclip='xclip -r -selection clipboard'
    alias cal='cal -y'

    alias ga='git add'
    alias gcl='git clone'
    alias gp='git push'
    alias gpl='git pull'
    alias gc='git commit'
    alias gl='git log'
    alias gb='git branch --show-current'
    alias gs='git status -sb'
    alias gd='git diff'
    alias makej='make -j$(expr $(nproc) + 1)'
end
