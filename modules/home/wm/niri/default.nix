{ pkgs, ... }:

{
  imports = [
    ./niri.nix
    ./waybar.nix
    ./wpaperd.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    grim
    slurp
    mako
    fuzzel
    xwayland-satellite
    brightnessctl
  ];
}
