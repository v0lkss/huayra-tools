#!/bin/sh
user=$(grep -E '/bin/[^/]sh' /etc/passwd | grep -v '^root:' | awk -F: '{ print $1}')
echo "ES: Este script esta probado en sistemas basados en debian como kali, parrot, ubuntu."
echo "EN: This script works on debian based systems like kali, parrot, ubuntu, etc."
echo "ES: Instalara qtile (y dependencias)"
echo "EN: This will install qtile (and dependencies)"

echo -en "Your user is: $user??[Y/n] >>"; read -r usever; usever=${usever:-Y}
if [[ ! $usever =~ ^[Nn]$ ]]; then
    echo -n "Username >> "; read user
fi
echo -n "Do you want install spotify?[Y/n] >> "; read -r spotiver; spotiver=${spotiver:-Y}
echo -n "Do you want install kitty terminal?[Y/n]"; read -r kitver; kitver=${kitver:-Y}
if [[ ! $kitver =~ ^[Nn]$ ]]; then
    echo -n "Do you want use syltr1x kitty config (see in https://github.com/syltr1x/mythings)?[Y/n] >> "; read -r kicover
fi
echo -n "Do you want install powerlevel10k and ohmyzhs?[Y/n] >> "; read -r zshp10kver; zshp10kver=${zshp10kver:-Y}
echo -n "Do you want install spicetefiy?[Y/n] >> "; read -r spicever; spicever=${spicever:-Y}
if [[ ! $spicever =~ ^[Nn]$ ]]; then
    echo -n "Do you want use Nord scheme for Sleek Theme (https://github.com/spicetify/spicetify-themes)? [Y/n] >> "; read -r spitheme; spitheme=${spitheme:-Y}
fi
echo -n "Do you want use syltr1x qtile config (see in https://github.com/syltr1x/mythings)?[Y/n] >> "; read -r qtiver; qtiver=${qtiver:-Y}

# Install dependencies
sudo apt update && sudo apt upgrade
if [[ ! $kitver =~ ^[Nn]$ ]]; then
    sudo apt install kitty
fi
sudo apt install neovim bat lsd apache2 libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev lixcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev feh zsh
chsh -u $user -s $(which zsh)
chsh -s $(which zsh)

# Install hack nerd fonts
sudo curl https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip -o /usr/share/fonts/truetype
sudo unzip /usr/share/fonts/truetype/Hack.zip && sudo rm /usr/sjare/fonts/truetype/Hack.zip

if [[ ! $spotiver =~ ^[Nn]$ ]]; then
    curl -sS https://download.spotify.com/debian/pubkey_622F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg\
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update && sudo apt upgrade
    sudo apt-get install spotify-client
fi

if [[ ! $spicever =~ ^[Nn]$ ]]; then
    sudo chmod a+wr /usr/share/spotify/Apps/*
    sudo chmdo a+wr /usr/share/spotify/Apps/
    curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/installer.sh | sh
    if [[ ! $spitheme =~ ^[Nn]$ ]]; then
        spicetify config custom_apps lyrics-plus
        spicetify config extensions fullAppDisplay.js
        spicetify config extensions loopyLoop.js
        git clone https://
fi

if [[ ! $zshp10kver =~ ^[Nn]$ ]]; then
    sh -c "${curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$user/powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> /home/$user/.zshrc
    sudo zsh
    sudo rm /home/$user/.zshrc
    sudo mv /root/.zshrc /home/$user/.zshrc
    sudo mv /root/.p10k.zsh /home/$user/.p10k.zsh
    sudo ln -s /home/$user/.zshrc /root/.zshrc
    sudo ln -s /home/$user/.p10k.zsh /root/.p10k.zsh
fi

if [[ ! $qtiver =~ ^[Nn]$ ]]; then
    curl https://raw.githubusercontent.com/syltr1x/mythins/main/.config/qtile/config.py -o /home/$user/.config/qtile/config.py
fi

if [[ ! $kicover =~ ^[Nn]$ ]]; then
    curl https://raw.githubusercontent.com/syltr1x/mythings/main/.config/kitty/kitty.conf -o /home/$user/.config/kitty/kitty.conf
fi
