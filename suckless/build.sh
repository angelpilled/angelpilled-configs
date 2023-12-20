#!/bin/bash
# This shell script will build all the suckless files I use.

echo -e "Dependencies will be installed if they are needed...\n"
sudo pacman -S --needed --noconfirm make gcc libavif gcr webkit2gtk
yay -S --needed --noconfirm ttf-iosevka ttf-font-awesome

echo -e
read -p "Will you be using suckless software on PC or laptop? (pc/laptop) " platform
platform=${platform,,}

if [ $platform == "laptop" ]; then
    sudo cp ./dwm/config.h.x260 ./dwm/config.h
    sudo cp ./st/config.h.x260 ./st/config.h
    sudo cp ./dmenu/config.h.x260 ./dmenu/config.h
    sudo cp ./slstatus/config.h.x260 ./slstatus/config.h
elif [ $platform == "pc" ]; then
    sudo cp ./dwm/config.h.pc ./dwm/config.h
    sudo cp ./st/config.h.pc ./st/config.h
    sudo cp ./dmenu/config.h.pc ./dmenu/config.h
    sudo cp ./slstatus/config.h.pc ./slstatus/config.h
    sudo cp ./surf/config.h.pc ./surf/config.h
    sudo cp ./slock/config.h.pc ./slock/config.h
else
    echo "The what?"
    exit
fi

echo -e "Suckless software is being installed on a ${platform~~}.\n"

cd ./dwm/ && sudo make clean install
cd ../st && sudo make clean install
cd ../dmenu && sudo make clean install
cd ../slstatus && sudo make clean install
cd ../surf && sudo make clean install
cd ../slock && sudo make clean install

echo -e "\nSuccess!\nEverything should be up and running. Append \"exec dwm\" on the last line of your .xinitrc file in the home directory."
