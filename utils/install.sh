#!/bin/sh

# copy files and dirs
script_dir=$(dirname "$(readlink -f "$0")")

for file in $(cat $script_dir/files.txt)
do
    mkdir ~/$(dirname $file) 2> /dev/null ; cp -rl $script_dir/../$(basename $file) ~/$file
done

# install yay
sudo pacman -S --needed --noconfirm git base-devel &&
git clone https://aur.archlinux.org/yay.git &&
cd yay &&
MAKEFLAGS="-j$(expr $(nproc) \+ 1)" makepkg -si &&
cd .. &&
rm -rf --interactive=never yay

# install packages
yay -Syyu --noconfirm
yay -S --noconfirm --needed - < $script_dir/../pkglist
