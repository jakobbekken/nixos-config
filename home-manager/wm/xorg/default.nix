{ config, pkgs, ... }:

{
  imports = [
    ./bspwm
  ];

  home.packages = with pkgs; [
    dmenu
    feh
    flameshot
    xclip
    xorg.xrandr
  ];
}
