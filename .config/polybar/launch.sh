#!/bin/sh

dir="$HOME/.config/polybar"

launch_bar() {
    # Terminate already running bar instances
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    # Launch that shit
    polybar -q main -c "$dir/config.ini" &
}

launch_bar
