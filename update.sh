#!/bin/env bash
tofile="."
files=("rofi" "nvim" "picom" "i3" "polybar" "kitty" "wal" "alacritty" "i3status")
extras=("wallpapers" ".conkyrc" "theme.sh" ".emacs.d/init.el" ".autostart.sh" "backup.sh" ".zshrc")
#Moving files{{{
#if pacman exists make a package list and add it to the array
if command -v pacman &> /dev/null
then
    echo "Creating Arch package list"
    comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq) > ~/packagelist
    extras+=("packagelist")
fi
for i in ${files[*]};
do
    echo "$(tput setaf 36)Copying $i to $tofile"
    echo "$(tput setaf 31)  "
    cp -r ~/.config/$i $tofile/.config
done
for a in ${extras[*]};
do
    echo "$(tput setaf 36)Copying $a to $tofile"
    echo "$(tput setaf 31)  "
    cp -r ~/$a $tofile
done
#}}}
