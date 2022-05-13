#!/bin/bash

feh --bg-scale --no-xinerama $HOME/Downloads/bg.png
ip link set enp6s0 up
systemctl restart dhcpcd

