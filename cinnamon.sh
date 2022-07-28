#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c 'United States',Brazil -a 12 -n 10 -p https,http --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload
sudo virsh net-autostart default

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm

yay -S --noconfirm xviewer
yay -S --noconfirm xplayer
yay -S --noconfirm pix

sudo pacman -S --noconfirm xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings cinnamon firefox simplescreenrecorder arc-gtk-theme arc-icon-theme obs-studio vlc xed xreader metacity gnome-shell

sudo flatpak install -y spotify
sudo flatpak install -y kdenlive

sudo systemctl enable lightdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
