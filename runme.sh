#!/bin/sh

cur_pwd="$(pwd)"

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc

sudo pacman -Syu
sudo pacman -S --needed bash-completion zsh-completions acpi acpi_call acpid ntfs-3g intel-ucode amd-ucode gdb git htop net-tools upower lshw g++ wget curl firefox kitty sshfs xf86-video-intel xf86-video-nouveau bc

#sudo pacman -S --needed transmission-gtk vlc clang shellcheck code

set -e

# installing oh-my-zsh
cd "$HOME"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv lambda-mod.zsh-theme .oh-my-zsh/themes/
source "$HOME"/.zshrc
cd cur_pwd

set -e

# install yay
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

cd "$HOME"
git clone --depth 1 https://github.com/manilarome/the-glorious-dotfiles/
cp -r the-glorious-dotfiles/config/awesome/floppy "$HOME"/.config/awesome
