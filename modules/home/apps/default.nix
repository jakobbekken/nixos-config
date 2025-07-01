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
    keepassxc
    spotify
    steam
    thunderbird
    unstable.tidal-hifi
    vlc
    eduvpn-client
    vscode
    davinci-resolve
    droidcam
  ];

  programs.obs-studio = {
    enable = true;
    plugins = [ pkgs.obs-studio-plugins.droidcam-obs ];
  };
}
