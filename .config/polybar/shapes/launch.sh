#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/shapes"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
# polybar -q main -c "$DIR"/config.ini &
# Launch the bar
polybar -q top -c "$DIR"/config.ini &
polybar -q bottom -c "$DIR"/config.ini &
polybar -q tophdmi -c "$DIR"/config.ini &
polybar -q bottomhdmi -c "$DIR"/config.ini &

