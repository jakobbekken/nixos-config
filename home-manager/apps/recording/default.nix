{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    droidcam
    kdenlive
    obs-studio
  ];
}
