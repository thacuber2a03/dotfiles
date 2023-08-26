#!/usr/bin/bash
alsactl -f ~/.config/asound.state restore
system76-power profile battery
killall io.elementary.appcenter
# xrandr --output eDP-1 --scale "1.25x1.25" --filter bilinear
wal -Rq
