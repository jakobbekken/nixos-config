{ config, pkgs, ... }:

{
  xsession = {
    enable = true;
    windowManager.bspwm = {
      enable = true;
      monitors = {
        eDP = [ "1" "2" "3" "4" "5" "6" "7" "8" ];
      };
      settings = {
	border_width = 4;
	window_gap = 16;

        split_ratio = 0.5;
        borderless_monocle = true;
        gapless_monocle = true;
	
        normal_border_color = "#1e1e2e";
        focused_border_color = "#f38ba8";
      };
      extraConfig = ''
	      feh --bg-fill $HOME/Pictures/wallpapers/catppuccin/shaded_landscape.jpg
      '';
    };
  };

}
