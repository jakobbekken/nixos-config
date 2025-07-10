{ inputs, ... }:

{
  imports = [
    ./sxhkd.nix
    ./polybar.nix
    ../xorg
    ../theming
  ];

  xsession = {
    enable = true;
    windowManager.bspwm = {
      enable = true;
      settings = {
    	border_width = 4;
    	window_gap = 16;

      split_ratio = 0.5;
      borderless_monocle = true;
      gapless_monocle = true;

      normal_border_color = "#191724";
      focused_border_color = "#eb6f92";
    };
      extraConfig = ''
        feh --bg-fill ${inputs.wallpapers.all.GiftOfOrzhova}
      '';
    };
  };
}
