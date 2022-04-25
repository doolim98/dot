#!/bin/sh
EVDEV=/usr/share/X11/xkb/keycodes/evdev

KEY_CODE_ESC=9
KEY_CODE_TLDE=49

save_old_evdev(){
	if [ ! -e $EVDEV.old ]; then 
		sudo cp $EVDEV $EVDEV.old; 
	fi
}

swap_tlde_esc(){
	sudo sed -E -i 's/(<ESC>.*=.*)\s[0-9]+/\1 49/g' $EVDEV
	sudo sed -E -i 's/(<TLDE>.*=.*)\s[0-9]+/\1 9/g' $EVDEV
	sudo setxkbmap -layout us
}

unswap_tlde_esc(){
	sudo sed -E -i 's/(<ESC>.*=.*)\s[0-9]+/\1  9/g' $EVDEV
	sudo sed -E -i 's/(<TLDE>.*=.*)\s[0-9]+/\1 49/g' $EVDEV
	sudo setxkbmap -layout us
}

if [ "$1" = 0 ];then
	unswap_tlde_esc
else
	swap_tlde_esc
fi
