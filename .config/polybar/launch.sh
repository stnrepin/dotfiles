#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
for pid in $(pgrep 'polybar'); do
    wait "$pid"
done

# Launch polybar
polybar default-bar &

echo "Polybar launched... Ok"

