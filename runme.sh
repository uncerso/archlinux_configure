#!/bin/sh

sudo pacman -Syu
sudo pacman -S --needed bash-completion zsh-completions acpi acpi_call acpid ntfs-3g intel-ucode amd-ucode gdb git htop net-tools upower lshw g++ wget curl firefox kitty sshfs xf86-video-intel xf86-video-nouveau bc

#sudo pacman -S --needed transmission-gtk vlc clang shellcheck code

set -e

# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv lambda-mod.zsh-theme .oh-my-zsh/themes/
source "$HOME"/.zshrc

set -e

# install yay
cur_pwd="$(pwd)"
cd /tmp
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
extract yay.tar.gz
cd yay
makepkg -sci
cd ..
rm -rf yay yay.tar.gz
cd "$cur_pwd"

set -e

yay -S awesome-git rofi picom-git inter-font
yay -S nemo alsa-utils pulseaudio pulseaudio-alsa mpd mpc maim feh xclip xprop imagemagick blueman redshift xfce4-power-manager upower noto-fonts-emoji FantasqueSansMono Nerd Font nerd-fonts-fantasque-sans-mono xdg-user-dirs ffmpeg iproute2 iw

git clone --depth 1 https://github.com/manilarome/the-glorious-dotfiles/
cp -r the-glorious-dotfiles/config/awesome/floppy "$HOME"/.config/awesome
