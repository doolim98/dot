#!/bin/sh

SCRIPT_PATH=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

EMACS_DIR=$HOME/.emacs.d
EMACS_INIT=$EMACS_DIR/init.el
MY_EMACS_DIR=$SCRIPT_DIR
MY_EMACS_INIT=$SCRIPT_DIR/init.el

# check if there are old init.el
mkdir -p $EMACS_DIR
touch $EMACS_INIT
if [ $(grep "HOOK_INIT" $EMACS_INIT | wc -l) -eq 0 ];then
	echo "mv $EMACS_INIT -> $EMACS_INIT.old"
	cp $EMACS_INIT $EMACS_INIT.old
fi

echo ';; HOOK_INIT' > $EMACS_INIT
echo '(setq my-emacs-directory "'$MY_EMACS_DIR'" )' >> $EMACS_INIT
echo '(load-file "'$MY_EMACS_INIT'")' >> $EMACS_INIT
