{ pkgs, ... }:

{
  services.udiskie.enable = true;

  home.packages = with pkgs; [
    xfce.thunar
    xfce.thunar-volman
  ];
}
