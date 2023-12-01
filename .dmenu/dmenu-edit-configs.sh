#!/bin/bash
#  ____ _____
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/
# |____/ |_|
#
# Dmenu script for editing some of my more frequently edited config files.


declare options=("alacritty
zshrc
bspwm
dunst
picom
polybar
st
surf
sxhkd
termite
vifm
vim
xresources
quit")

choice=$(echo -e "${options[@]}" | dmenu -i -p 'Edit config file: ')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	alacritty)
		choice="$HOME/.config/alacritty/alacritty.yml"
	;;
	bspwm)
		choice="$HOME/.config/bspwm/bspwmrc"
	;;
	dunst)
		choice="$HOME/.config/dunst/dunstrc"
	;;
	picom)
		choice="$HOME/.config/picom/picom.conf"
	;;
	polybar)
		choice="$HOME/.config/polybar/config"
	;;
	st)
		choice="$HOME/st-distrotube/config.h"
	;;
	surf)
		choice="$HOME/surf-distrotube/config.h"
	;;
	sxhkd)
		choice="$HOME/.config/sxhkd/sxhkdrc"
	;;
	termite)
		choice="$HOME/.config/termite/config"
	;;
	vifm)
		choice="$HOME/.config/vifm/vifmrc"
	;;
	vim)
		choice="$HOME/.vimrc"
	;;
	xresources)
		choice="$HOME/.Xresources"
	;;
	zshrc)
		choice="$HOME/.zshrc"
	;;
	*)
		exit 1
	;;
esac
#urxvt -e vim "$choice"
alacritty -e vim "$choice"
# emacsclient -c -a emacs "$choice"
