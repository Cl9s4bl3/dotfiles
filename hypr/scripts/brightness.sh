#!/bin/bash

current=$(brightnessctl get)
max=$(brightnessctl max)

percent=$(( 100 * current / max ))

step=10%

case "$1" in
  up)
    brightnessctl set +$step
    swayosd-client --brightness +10
    ;;

  down)
    brightnessctl set $step-
    swayosd-client --brightness -10
    ;;

  *)
    echo "Usage: brightness.sh {up|down}"
    ;;
esac