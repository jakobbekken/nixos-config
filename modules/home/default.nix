{ ... }:

{
  home.username = "jokko";
  home.homeDirectory = "/home/jokko";
  home.keyboard.options = [ "caps:escape" ];
  home.keyboard.layout = "us";

  imports = [
    ./apps
    ./browsers/firefox
    ./browsers/thunar
    ./dev
    ./editors/helix
    ./system
    ./tools/alacritty
    ./tools/kitty
    ./tools/ghostty
    ./tools/git
    ./tools/zsh
    ./wm/bspwm
    ./wm/niri
  ];

  home.shellAliases = {
    shx = "sudo -E hx";
    nxconf = "cd /etc/nixos/";
    nxhome = "cd /etc/nixos/modules/home/";
    nxresw = "sudo nixos-rebuild switch";
    ":q" = "exit";
  };

  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "zsh";
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
