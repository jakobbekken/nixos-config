
{ ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {
      
      #
      # WM independent hotkeys
      #

      # Terminal emulator
      "super + Return" = "ghostty";

      # Menu
      "super + d" = "dmenu_run";

      # Reload sxhkd config
      "super + Escape" = "pkill -USR1 -x sxhkd";

      # Volume/mic controls
      "XF86Audio{Lower,Raise}Volume" = "pactl set-sink-volume @DEFAULT_SINK@ {-,+}5%";
      "XF86AudioMute" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      "XF86AudioMicMute" = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";

      # Brightness control
      "XF86MonBrightness{Down,Up}" = "xrandr --output eDP --brightness {0.5,1.0}";

      # Screenshots
      "super + {_,shift + }Print" = "flameshot {screen,gui}";

      # Custom keyboard layout switcher
      "super + space" = "kb-switcher us no";

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
      "super + {_,shift + }{left,down,up,right}" = "bspc node -{f,s} {west,south,north,east}";

      # Focus next/prev node in current desktop
      "super + {_,shift + }c" = "bspc node -f {next,prev}.local";

      # Focus the last node/desktop
      "super + {grave,Tab}" = "bspc {node,desktop} -f last";

      # Focus/send and follow to given desktop
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '{1-9,0}' --follow";
    };
  };
}
