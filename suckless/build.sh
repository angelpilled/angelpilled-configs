#!/bin/bash

# This shell script will build all the suckless files I use.
# dwm, dmenu, st, slstatus

cd ./dwm/
sudo make clean install

cd ../st 
sudo make clean install

cd ../dmenu
sudo make clean install

cd ../slstatus
sudo make clean install
