# Start X at login
#
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end

# Config Spacefish
#
set SPACEFISH_EXEC_TIME_SHOW false
set SPACEFISH_GIT_STATUS_SHOW false
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_RUST_SHOW false

# Set PATH variable
#
set PATH $HOME/.cargo/bin $PATH

# Set default editor
#
set EDITOR nvim
set VISUAL nvim

