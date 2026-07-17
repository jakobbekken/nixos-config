{ pkgs, ... }:

{

  home.homeDirectory = "/Users/jokko";
  home.username = "jokko";

  imports = [
    ./dev
    ./editors/helix
    ./tools/ghostty
    ./tools/git
    ./tools/zsh
    ./wm/aerospace
  ];

  home.shellAliases = {
    ":q" = "exit";
  };

  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "zsh";
  };

  home.packages = with pkgs; [
    ffmpeg
    age
    sops
    terraform
    talosctl
    kubectl
    cilium-cli
    openstackclient
    cilium-cli
    coder
    micromamba
    unrar
    colima
    p7zip
  ];


  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
