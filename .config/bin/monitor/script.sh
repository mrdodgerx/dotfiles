#!/bin/bash

# set up the two monitors for bspwm
# NOTE This is a simplistic approach because I already know the settings I
# want to apply.

#bspc monitor eDP-1  -d 1 2 3 4 5 6 7 8 9 0
my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1 connected')
if [[ $my_laptop_external_monitor = *1920x1080* ]]; then
    # echo 'HERE'
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --rotate normal --right-of eDP-1
    bspc monitor eDP-1  -d 1 2 3 4 5
    bspc monitor HDMI-1  -d 6 7 8 9 0
    # echo 'LOLxxx'

elif [[ $my_laptop_external_monitor = *1366x768* ]]; then
    # echo "LOL"
    # xrandr --output HDMI1 --primary --mode 1366x768 --rotate normal --output eDP1 --off
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1 --mode 1366x768 --rotate normal --right-of eDP-1
        bspc monitor eDP-1  -d 1 2 3 4 5
        bspc monitor HDMI-1  -d 6 7 8 9 0
#elif [[ $my_laptop_external_monitor = *
else
	bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8 9 0
fi
