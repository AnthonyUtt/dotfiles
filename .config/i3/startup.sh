#!/bin/bash

feh --bg-scale $HOME/.bg.jpg
ip link set enp7s0 up
systemctl restart dhcpcd

eww daemon

