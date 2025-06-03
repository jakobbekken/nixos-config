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

    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    inter
    fira
    roboto
  ];
}
