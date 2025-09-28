#!/usr/bin/env bash

current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

layouts=("$@")
num_layouts=${#layouts[@]}

for i in "${!layouts[@]}"; do
  if [ "${layouts[$i]}" == "$current_layout" ]; then
    current_index=$i
    break
  fi
done

if [ -z "$current_index" ]; then
  current_index=0
fi

next_index=$(( (current_index + 1) % num_layouts ))
next_layout="${layouts[$next_index]}"

setxkbmap "$next_layout"
