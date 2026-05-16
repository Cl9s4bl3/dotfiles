#!/bin/bash

chosen=$(echo -e "logout\nreboot\npoweroff" | rofi -dmenu -i -p "power")

case "$chosen" in
  logout)
    hyprctl dispatch exit
    ;;
  reboot)
    systemctl reboot
    ;;
  poweroff)
    systemctl poweroff
    ;;
esac
