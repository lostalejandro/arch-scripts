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

sudo pacman -S --noconfirm xorg sddm plasma kde-applications firefox simplescreenrecorder obs-studio vlc papirus-icon-theme kdenlive materia-kde

sudo flatpak install -y spotify

sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot
