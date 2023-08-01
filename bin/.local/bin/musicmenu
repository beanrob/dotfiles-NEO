#!/bin/sh

# Options for powermenu

playpause="/ play/pause"
what=" ?  what's playing"
prev="   previous track"
next="   next track"

# Get answer from user via rofi
# selected_option=$(echo "$playpause
# $prev
# $next
# $what" | rofi -dmenu\
#                   -i\
#                   -p "music"\
#                   -width "15"\
#                   -lines 3\
#                   -line-margin 3\
#                   -line-padding 10\
#                   -scrollbar-width "0" )

# Get answer from user via rofi
. "${HOME}/.cache/wal/colors.sh"
selected_option=$(echo "$playpause
$what
$prev
$next" | dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15")

# Do something based on selected option
if [ "$selected_option" = "$prev" ]
then
    playerctl previous
elif [ "$selected_option" = "$playpause" ]
then
    playerctl play-pause
elif [ "$selected_option" = "$next" ]
then
    playerctl next
elif [ "$selected_option" = "$what" ]
then
    ~/.scripts/notifications/whats-playing.sh
else
    echo "No match"
fi
