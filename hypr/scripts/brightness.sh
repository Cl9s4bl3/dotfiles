#!/bin/bash

current=$(brightnessctl get)
max=$(brightnessctl max)

percent=$(( 100 * current / max ))

step=10%

case "$1" in
  up)
    brightnessctl set +$step
    notify-send "Brightness" "${percent}%"
    ;;

  down)
    brightnessctl set $step-
    notify-send "Brightness" "${percent}%"
    ;;

  *)
    echo "Usage: brightness.sh {up|down}"
    ;;
esac