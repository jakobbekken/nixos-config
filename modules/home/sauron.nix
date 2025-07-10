{ ... }:

{
  home.username = "sauron";
  home.homeDirectory = "/home/sauron";
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
  ];

  home.shellAliases = {
    ":q" = "exit";
  };

  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "zsh";
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}

