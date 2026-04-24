{ unstable, pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity
    easyeffects
    gimp
    inkscape
    vlc
    droidcam
    davinci-resolve
    spotify
    unstable.feishin
    unstable.dolphin-emu
  ];

  programs.obs-studio = {
    enable = true;
    plugins = [ pkgs.obs-studio-plugins.droidcam-obs ];
  };
}
