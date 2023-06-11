#!/bin/bash

usage() { echo "$0 usage: [-t] "; exit 0; }

SWAP_TLDE_ESC=true
EVDEV=/usr/share/X11/xkb/keycodes/evdev

KEYCODE_CAPS=66
KEYCODE_LCTL=37
KEYCODE_RCTL=105
KEYCODE_ESC=9
KEYCODE_TLDE=49

backup_and_restore_evdev(){
	[ ! -e $EVDEV.old ] && sudo cp $EVDEV $EVDEV.old
	sudo cp $EVDEV.old $EVDEV
}

evdev_set_keycode(){
	sudo sed -E -i "s/(<$1>.*=.*)\s[0-9]+/\1 $2/g" $EVDEV
}

while getopts ":ht" arg; do
	case $arg in
		t) 
			SWAP_TLDE_ESC=false
			;;
		h | *) # Display help.
			usage
			exit 0
			;;
	esac
done

# Use Original EVDEV file
backup_and_restore_evdev

if $SWAP_TLDE_ESC;then
	evdev_set_keycode ESC  $KEYCODE_TLDE
	evdev_set_keycode TLDE $KEYCODE_ESC
else
	evdev_set_keycode ESC  $KEYCODE_ESC
	evdev_set_keycode TLDE $KEYCODE_TLDE
fi

# caps -> lctl, rctl -> caps
# evdev_set_keycode CAPS $KEYCODE_LCTL
# evdev_set_keycode RCTL $KEYCODE_CAPS

# apply settings
sudo setxkbmap -layout us

# reload xcape
pkill xcape
xcape -e 'Control_L=Escape'
