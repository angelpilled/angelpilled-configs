#!/bin/sh
# This script will install all the available software that I use.

WORKDIR=$(pwd)

## Functions
pacmanRetVal() {
    sudo pacman -Qi $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        sudo pacman -S --noconfirm $1
    fi
}

promptUser() {
    local prompt=$1
    local valid_options=($2)
    local retval
    local userinput

    while true; do
        read -p "$prompt" userinput
	userinput=${userinput,,}
        for option in "${valid_options[@]}"; do
            if [[ $userinput == $option ]]; then
		echo $userinput
		return
            fi
        done
    done
}

## Welcome screen and initial user prompt
echo -e "Welcome! This little script will install all the necessary configs to your system."

machine=$(promptUser "First of all, tell me if you'll be using a (laptop) or a (pc): " "laptop pc")
wm=$(promptUser "Will you be using (dwm), (kde), or (both)?: " "dwm kde both none")

pacmanRetVal xorg

## Start installing/copying configs
# Bash
sudo cp ./bashrc/bashrc ~/.bashrc
echo -e "Bash shell configuration set."

# Fish
pacmanRetVal fish
mkdir -p ~/.config/fish/ && sudo cp ./fish/config.fish ~/.config/fish/config.fish
echo -e "Fish shell configuration set."

# Picom
pacmanRetVal picom
sudo cp ./picom/picom.conf /etc/xdg/picom.conf
echo -e "Picom configuration set."

# xbindkeys
pacmanRetVal xbindkeys
pacmanRetVal maim
case $machine in
    pc)
	sudo cp ./xbindkeys/xbindkeysrc ~/.xbindkeysrc
	echo "xbindkeys configuration set for PCs."
	;;
    laptop)
	pacmanRetVal xdotool
	pacmanRetVal brightnessctl
	sudo cp ./xbindkeys/xbindkeysrc_x260 ~/.xbindkeysrc
	echo "xbindkeys configuration set for laptops."
	;;
esac

# window managers/desktop environments and xinitrc

case $wm in
    kde)
	sudo pacman -S --needed --noconfirm plasma kde-applications
	sudo cp ./xinitrc/xinitrc-kde ~/.xinitrc-kde
	;;
    dwm)
	cd ./suckless/ && ./build.sh $machine && cd $WORKDIR
	sudo cp ./xinitrc/xinitrc-dwm ~/.xinitrc-dwm
	;;
    both)
	cd ./suckless/ && ./build.sh $machine && cd $WORKDIR
	sudo pacman -S --needed --noconfirm plasma kde-applications
	sudo cp ./xinitrc/xinitrc-kde ~/.xinitrc-kde && sudo cp ./xinitrc/xinitrc-dwm ~/.xinitrc-dwm
	;;
    none)
	continue
	;;
esac

# Neovim
echo -e "Installing neovim now..."
echo -e "Checking for dependencies and installing if necessary..."
sudo pacman -S --needed --noconfirm neovim yarn nodejs npm

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim
cp ./nvim/init.lua ~/.config/nvim/init.lua
cp ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json

echo -e "Setting up language servers"
nvim +PlugInstall +qall
cd ~/.local/share/nvim/plugged/coc.nvim && yarn install && yarn build
cd $WORKDIR
nvim temp.html "+CocInstall coc-pairs coc-sh coc-html coc-css coc-tsserver coc-pyright coc-vimtex" +qall
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
curl -LO "https://github.com/clangd/clangd/releases/download/17.0.3/clangd-linux-17.0.3.zip"
unzip -o clangd-linux-17.0.3.zip && rm -rf clangd-linux-17.0.3.zip
cd $WORKDIR

cd ./scripts
if [ $machine == "laptop" ]; then
    sudo cp bnd bnu /usr/local/bin
fi
sudo cp start-de.sh webcam webcam-off webcam-on gc ainit del-his /usr/local/bin

echo -e
echo -e "----------------------------------"
echo -e "   angelpilled-configs set up!"
echo -e "----------------------------------"
echo -e
