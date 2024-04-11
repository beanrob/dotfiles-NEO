#!/bin/sh

#If either of these xprofile files exist, run them
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

#Gnome Keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

#SSH agent
eval $(ssh-agent -s)

exec i3

# WINDOW MANAGER GRAVEYARD -------------
# MAY THEY REST in PEACE ---------------

# sxhkd -c $HOME/.config/berry/sxhkdrc &
# exec berry

# exec dwm > ~/.config/dwm/dwm.log

# exec jwm

# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session
