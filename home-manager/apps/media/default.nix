{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity
    vlc
    xfce.thunar
  ];
}
