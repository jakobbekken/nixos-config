{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    alsa-utils
    blueman
  ];
}
