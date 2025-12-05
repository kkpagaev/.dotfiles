#!/bin/bash

switch_kitty_theme() {
  KITTY_THEME_DIR="$HOME/.config/kitty/themes"

  GTK_THEME=$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")
  if [[ "$GTK_THEME" == *"dark"* ]]; then
    THEME=gruvbox
    kitty +kitten themes $THEME
  else
    THEME=nier
    # THEME=kikisen
    kitty +kitten themes $THEME
  fi
  echo "return \"$THEME\"" > ~/.config/nvim/lua/current-theme.lua

  kill -SIGUSR1 $(pgrep kitty)
}

switch_kitty_theme

gsettings monitor org.gnome.desktop.interface color-scheme | while read -r _; do
    # echo 123
    switch_kitty_theme
done
