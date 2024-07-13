{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    lf
    lm_sensors
    neofetch
  ];
}
