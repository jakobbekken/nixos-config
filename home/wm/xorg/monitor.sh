#!/usr/bin/env bash

PRIMARY="eDP"
SECONDARY="HDMI-A-0"

if [ "$1" == "clone" ]; then
    echo "Cloning $PRIMARY to $SECONDARY"
    xrandr --output "$PRIMARY" --mode 1920x1080 --set TearFree on --output "$SECONDARY" --same-as "$PRIMARY" --mode 1920x1080 --set TearFree on
else
    echo "Setting default (only $PRIMARY on)"
    xrandr --output "$PRIMARY" --mode 1920x1200 --set TearFree on --output "$SECONDARY" --off
fi
