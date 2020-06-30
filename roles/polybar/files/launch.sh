#!/bin/bash

# Terminate already running polybar instance
killall -q polybar
# Wait until the process have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
# Launch polybar, using default config located in ~/.config/polybar/config
polybar arch-linux &
echo "Polybar launched..."
