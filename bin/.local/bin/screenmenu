#!/bin/sh

# Options for powermenu

both="both"
laptop="laptop"
monitor="monitor"

if [ "$#" = "0" ]; then
	# Get answer from user via dmenu
	. "${HOME}/.cache/wal/colors.sh"
	selected_option=$(echo "$both
$laptop
$monitor" | dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"
	)
else
	selected_option=$1
fi

# Do something based on selected option
if [ "$selected_option" = "$both" ]; then
	if [ "$2" = "--left" ]; then
		xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --mode 2560x1080 --pos 1920x0 --rotate normal --output HDMI-1 --off
	else
		xrandr --output eDP-1 --primary --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-1 --mode 2560x1080 --pos 0x0 --rotate normal --output HDMI-1 --off
	fi
	setxkbmap -layout us -option caps:escape
elif [ "$selected_option" = "$monitor" ]; then
	xrandr --output eDP-1 --primary --off --output DP-1 --mode 2560x1080 --pos 0x0 --rotate normal --output HDMI-1 --off
	setxbmap -layout us -option caps:escape
elif [ "$selected_option" = "$laptop" ]; then
	xrandr --output eDP-1 --primary --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-1 --off --output HDMI-1 --off
	setxkbmap -layout gb -option caps:escape
fi

~/.fehbg
