{ config, pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {
      
      #
      # WM independent hotkeys
      #

      # Terminal emulator
      "super + Return" = "alacritty";

      # Menu
      "super + d" = "dmenu_run";

      # Reload sxhkd config
      "super + Escape" = "pkill -USR1 -x sxhkd";

      # Volume/mic controls
      "XF86AudioLowerVolume" = "amixer set Master 5%-";
      "XF86AudioRaiseVolume" = "amixer set Master 5%+";
      "XF86AudioMute" = "amixer set Master toggle";
      "XF86AudioMicMute" = "amixer set Capture toggle";

      #
      # Bspwm config
      #

      # Quit/reload
      "super + alt + {q,r}" = "bspc {quit,wm -r}";

      # Close/kill node
      "super + {_,shift + }w" = "bspc node -{c,k}";

      # Alternate between tiled and monocle
      "super + m" = "bspc desktop -l next";

      # Focus/swap in given direction
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

      # Focus next/prev node in current desktop
      "super + {_,shift + }c" = "bspc node -f {next,prev}.local";

      # Focus the last node/desktop
      "super + {grave,Tab}" = "bspc {node,desktop} -f last";

      # Focus/send and follow to given desktop
      "super + {_,shift + }{1-8}" = "bspc {desktop -f,node -d} '{1-8}' --follow";
    };
  };
}
