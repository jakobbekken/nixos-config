{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice-qt
    zotero
    joplin
    thunderbird
    eduvpn-client
    protonmail-desktop
  ];
}
