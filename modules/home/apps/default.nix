{ unstable, pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity
    prismlauncher
    libreoffice-qt
    zotero
    discord
    vesktop
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
    eduvpn-client
  ];
}
