{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    audacity
    gimp
    inkscape
    vlc
    droidcam
    davinci-resolve
    spotify
    unstable.tidal-hifi
  ];

  programs.obs-studio = {
    enable = true;
    plugins = [ pkgs.obs-studio-plugins.droidcam-obs ];
  };
}
