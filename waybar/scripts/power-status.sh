#!/bin/bash

profile=$(powerprofilesctl get)

case "$profile" in
    performance)
        icon="󰓅"
        class="performance"
        ;;
    balanced)
        icon="󰾅"
        class="balanced"
        ;;
    power-saver)
        icon="󰾆"
        class="powersave"
        ;;
esac

printf '{"text":"%s","class":"%s"}\n' "$icon" "$class"
