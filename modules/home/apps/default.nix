{ unstable, pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity
    discord
    gimp
    inkscape
    joplin
    kdenlive
    keepassxc
    obs-studio
    spotify
    steam
    thunderbird
    unstable.tidal-hifi
    vlc
  ];
}
