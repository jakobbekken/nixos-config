{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pulseaudio
    pavucontrol
    blueman
  ];
}
