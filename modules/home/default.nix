{ ... }:

{
  home.username = "jokko";
  home.homeDirectory = "/home/jokko";
  home.keyboard.options = [ "caps:escape" ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./apps
    ./browsers/firefox
    ./browsers/thunar
    ./dev
    ./editors/helix
    ./editors/vscode
    ./system
    ./tools/alacritty
    ./tools/git
    ./tools/zsh
    ./wm/bspwm
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "zsh";
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
