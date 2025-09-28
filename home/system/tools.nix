{ pkgs, ... }:

{
  home.packages = with pkgs; [
    p7zip
    unzip
    zip
    xdotool
    yazi
    unixtools.xxd
  ];
}
