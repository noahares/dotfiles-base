#!bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setxkbmap -layout us -variant altgr-intl
sxhkd &
easystroke --config-dir $XDG_CONFIG_HOME/easystroke/ enable &
unclutter &
picom -f --experimental-backends &
dunst &
mpd &

xrdb -load $XDG_CONFIG_HOME/X11/xresources
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK GNOME_KEYRING_CONTROL GNOME_KEYRING_PID
export SUDO_ASKPASS=$HOME/repos/scripts/dpass.sh
exec bspwm
