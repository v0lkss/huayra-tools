#!/bin/sh
cd /opt
sudo pacman -S git
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $user:$user yay-git
cd yay-git
su $user -c makepkg -si
yay -Suy
git clone https://github.com/soldoestech/hyprland.git
sudo chown -R $user:$user hyprland
cd hyprland
sudo chmod +x set-hypr
./set-hypr
