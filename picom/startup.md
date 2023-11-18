## Easy setting up my config
Obviously, you'll need picom and the additional dependencies to be on your drive.

Place ./picom.conf into /etc/xdg/ (though you can set it anywhere to your liking), and then place the below command to your init file, ex. .xinitrc.
`picom --config /etc/xdg/picom.conf --no-fading-openclose &`
