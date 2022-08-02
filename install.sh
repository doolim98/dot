#!/bin/bash -eu

cd "$(dirname "$0")"

DIR="$PWD"

HOME_PATH="$HOME"
CONFIG_PATH="$HOME_PATH/.config"

BACKUP_DIR="$DIR/.backup"

mkdir -p "$HOME_PATH" "$CONFIG_PATH" "$BACKUP_DIR"

V(){
	echo "$@"
	"$@"
}

link_files(){
	SRC_PATH=$(realpath "$1")
	DST_PATH=$(realpath "$2")
	cd "$SRC_PATH"
	for file in $(ls -A) ;do
		dst="$DST_PATH/$file"
		if [ -L "$dst" ];then 
			rm "$dst"
		elif [ -e "$dst" ];then
			V mv "$dst" "$BACKUP_DIR/$file.$(date +%s)"
		fi
		V ln -s "$SRC_PATH/$file" "$dst"
	done
	cd "$DIR"
}

link_files './home' "$HOME_PATH"
link_files './config' "$CONFIG_PATH"

