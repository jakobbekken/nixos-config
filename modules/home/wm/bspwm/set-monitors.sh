#!/usr/bin/env bash

hdmi_status=$(xrandr | grep "HDMI-A-0")

if xrandr | grep -q "HDMI-A-0 connected"; then
    xrandr --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rate 180.00 --set TearFree on --output eDP --mode 1920x1200 --pos 0x1080 --rate 60.00 --set TearFree on

    bspc monitor eDP -d 1 2 3 4 5
    bspc monitor HDMI-A-0 -d 6 7 8 9 0

    pkill -x polybar
    polybar main &
    polybar monitor &
else
    xrandr --output eDP --mode 1920x1200 --pos 0x0 --rate 60.00 --set TearFree on

    bspc monitor eDP -d 1 2 3 4 5 6 7 8 9 0

    pkill -x polybar
    polybar main &
fi
