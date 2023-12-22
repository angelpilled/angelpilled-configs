#!/usr/bin/sh

read -p "Please choose from the available DE list: " option
option=${option,,}
USERDIR="/home/$USER"

case $option in
    dwm)
	if test -f $USERDIR/.xinitrc-dwm; then
	    startx $USERDIR/.xinitrc-dwm
	else
	    echo "DE/WM does not exist."
	fi
	;;
    kde)
	if test -f $USERDIR/.xinitrc-kde; then
	    startx $USERDIR/.xinitrc-kde
	else
	    echo "DE/WM does not exist."
	fi
	;;
    *)
	echo "Invalid option."
esac
