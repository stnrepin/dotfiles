#!/bin/bash

CUR_CONFIG_DIR=~/.config/polybar/

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
for pid in $(pgrep 'polybar'); do
    wait "$pid"
done

# Launch polybar
xargs -n 1 -I{} -d '\n' polybar {} < $CUR_CONFIG_DIR/bars.local.txt &

echo "Polybar launched... Ok"

