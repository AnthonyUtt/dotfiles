#!/bin/bash

feh --bg-scale $HOME/.bg.jpeg
ip link set enp7s0 up
systemctl restart dhcpcd

