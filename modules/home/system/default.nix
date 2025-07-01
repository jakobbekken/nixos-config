{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    pulseaudio
    pavucontrol
    blueman
    p7zip
    unzip
    zip
    weylus
    xdotool
    yazi
    unixtools.xxd
    reveal-md

    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    inter
    fira
    roboto
  ];
}
