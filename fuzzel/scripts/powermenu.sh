#!/bin/bash

SELECTION="$(printf "1 - Lock\n2 - Reboot\n3 - Shutdown\n4 - Logout" | fuzzel --dmenu -l 4 -p "Power Menu: ")"

case $SELECTION in
	*"Lock")
		hyprlock;;
	*"Reboot")
		systemctl reboot;;
	*"Shutdown")
		systemctl poweroff;;
	*"Logout")
		swaymsg exit;;
esac
