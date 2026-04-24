{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-cjk-sans
    source-han-sans
    noto-fonts-color-emoji
    inter
    fira
    roboto
  ];
}
