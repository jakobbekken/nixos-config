{ pkgs, ... }:

{
  imports = [
    ./niri.nix
    ./quickshell.nix
    ./wpaperd.nix
    ../theming/rose-pine.nix
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
