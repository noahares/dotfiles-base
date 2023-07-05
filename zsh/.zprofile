#source ~/.zshenv
if [[ "$(tty)" == '/dev/tty1' ]]; then
    # exec startx "$XDG_CONFIG_HOME/X11/xinitrc" -- -keeptty &> ~/.xorg.log
    exec Hyprland
fi
