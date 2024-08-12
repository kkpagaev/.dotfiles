#!/bin/sh

# Usage: focus_tab.sh <tab_number>
# Example: focus_tab.sh 3 will focus on the 3rd tab

TARGET_TAB=$1
CURRENT_TAB=1

while [ $CURRENT_TAB -lt $TARGET_TAB ]; do
  swaymsg focus next
  CURRENT_TAB=$((CURRENT_TAB + 1))
done

