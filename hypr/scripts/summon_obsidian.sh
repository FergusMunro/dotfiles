#!/bin/bash
CURRENT_WS=$(hyprctl activeworkspace -j | jq '.id')

hyprctl dispatch movetoworkspace $CURRENT_WS,obsidian

hyprctl dispatch focuswindow obsidian

hyprctl dispatch movewindow r
