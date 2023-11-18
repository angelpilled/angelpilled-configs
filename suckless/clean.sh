#!/bin/bash

# This shell script will build all the suckless files I use.
# dwm, dmenu, st, slstatus

cd ./dwm/
sudo make clean

cd ../st 
sudo make clean

cd ../dmenu
sudo make clean

cd ../slstatus
sudo make clean

cd ../surf
sudo make clean

cd ../slock
sudo make clean
