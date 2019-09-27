#!/bin/sh

xset +fp /usr/share/fonts/X11/misc
xset fp rehash

xrdb ~/.Xresources
hsetroot -solid '#4d5e63'

xrandr --dpi 96
xcalib ~/.x230.icm

$HOME/bin/bar3.sh

exec openbox
