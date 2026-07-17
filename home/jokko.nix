{ ... }:

{
  home.username = "jokko";
  home.homeDirectory = "/home/jokko";
  home.keyboard.variant = "altgr-intl";
  home.keyboard.options = [ "caps:escape" ];
  home.keyboard.layout = "us";

  imports = [
    ./apps
    ./browsers/firefox
    ./dev
    ./editors/helix
    ./tools/alacritty
    ./tools/git
    ./tools/zsh
  ];

  home.shellAliases = {
    ":q" = "exit";
  };

  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "zsh";
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
