#!/bin/bash

CUR_CONFIG_DIR=~/.config/polybar/

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
for pid in $(pgrep 'polybar'); do
    wait "$pid"
done

# Launch polybar
while read bar_name; do
    polybar "$bar_name" &
done < $CUR_CONFIG_DIR/bars.local.txt

echo "Polybar launched... Ok"

