#!/bin/bash

EDITOR="vim"

config_files=(
	"$HOME/dots/.config/fuzzel/fuzzel.ini"
	"$HOME/dots/.config/sway/config"
	"$HOME/dots/.config/alacritty/alacritty.toml"
	"$HOME/dots/.config/waybar/config"
	"$HOME/dots/.config/waybar/modules.json"
	"$HOME/dots/.config/waybar/style.css"
	"$HOME/dots/.config/dunst/dunstrc"
	"$HOME/dots/.config/gamemode.ini"
	"$HOME/dots/.config/fonts.conf"
	"$HOME/dots/.zshrc"
)

menu_options=""
for file in "${config_files[@]}"; do
	menu_options+="$file\n"
done

selected_file=$(echo -e "$menu_options" | fuzzel --dmenu --prompt="Edit Config: ")
if [ -n "$selected_file" ]; then
	alacritty -e $EDITOR "$selected_file"
fi
