#!/bin/bash

dir=$HOME/.config/polybar

open_menu() {
    # Run polybar to open tablet
    polybar -q menu -c "$dir/tablet.ini" &
}

close_menu() {
    # We assume the menu is the most recently created instance
    # of polybar so we grab the newest PID and kill it
    pid=$(pgrep -u $UID -n -x polybar)
    kill $pid
}

toggle_menu() {
    # if there is more than one instance of polybar, we assume
    # the menu is open and we kill it, otherwise we open the menu
    num=$(pgrep -u $UID -c -x polybar)

    if [ $num -gt 1 ]
    then
        close_menu
    else
        open_menu
    fi
}

toggle_menu
