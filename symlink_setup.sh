#!/bin/sh
# this will setup the symlinks for the dotfiles-base in ~/.config

[ ! -d ~/.config ] && mkdir ~/.config
rm -r ~/.config/zathura
rm -r ~/.config/dunst
rm -r ~/.config/sxhkd
rm -r ~/.config/polybar
rm -r ~/.config/nvim
rm -r ~/.config/bspwm
rm -r ~/.config/vifm
rm -r ~/.config/zsh

ln -s ~/dotfiles-base/zathura ~/.config/zathura
ln -s ~/dotfiles-base/dunst ~/.config/dunst
ln -s ~/dotfiles-base/sxhkd ~/.config/sxhkd
ln -s ~/dotfiles-base/polybar ~/.config/polybar
ln -s ~/dotfiles-base/nvim ~/.config/nvim
ln -s ~/dotfiles-base/bspwm ~/.config/bspwm
ln -s ~/dotfiles-base/vifm ~/.config/vifm
ln -s ~/dotfiles-base/qutebrowser/config.py ~/.config/qutebrowser/config.py
ln -s ~/dotfiles-base/zsh/.zshenv ~/.zshenv
ln -s ~/dotfiles-base/zsh ~/.config/zsh
