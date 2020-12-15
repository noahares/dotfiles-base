#!/bin/sh
# this will setup the symlinks for the dotfiles-base in ~/.config

[ ! -d ~/.config ] && mkdir ~/.config
rm -r ~/.config/zathura
rm -r ~/.config/dunst
rm -r ~/.config/sxhkd
rm -r ~/.config/polybar
rm -r ~/.config/nvim
rm -r ~/.config/bspwm
rm -r ~/.config/zsh
[ ! -d ~/.config/qutebrower ] && mkdir ~/.config/qutebrowser
[ ! -d ~/.config/vifm ] && mkdir ~/.config/vifm
[ ! -d ~/.config/X11 ] && mkdir ~/.config/X11

ln -s ~/dotfiles-base/zathura ~/.config/zathura
ln -s ~/dotfiles-base/dunst ~/.config/dunst
ln -s ~/dotfiles-base/sxhkd ~/.config/sxhkd
ln -s ~/dotfiles-base/polybar ~/.config/polybar
ln -s ~/dotfiles-base/nvim ~/.config/nvim
ln -s ~/dotfiles-base/bspwm ~/.config/bspwm
ln -s ~/dotfiles-base/vifm/colors ~/.config/vifm/colors
ln -s ~/dotfiles-base/vifm/scripts ~/.config/vifm/scripts
ln -s ~/dotfiles-base/vifm/vifmrc ~/.config/vifm/vifmrc
ln -s ~/dotfiles-base/qutebrowser/config.py ~/.config/qutebrowser/config.py
ln -s ~/dotfiles-base/zsh/.zshenv ~/.zshenv
ln -s ~/dotfiles-base/zsh ~/.config/zsh
ln -s ~/dotfiles-base/user-dirs.dirs ~/.config/user-dirs.dirs
ln -s ~/dotfiles-base/xinitrc ~/.config/X11/xinitrc
