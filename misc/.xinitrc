#!/bin/sh

#If either of these xprofile files exist, run them
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

#Gnome Keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# exec dwm > ~/.config/dwm/dwm.log
exec i3
# exec jwm
