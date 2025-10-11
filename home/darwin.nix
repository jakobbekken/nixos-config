{ ... }:

{

  home.homeDirectory = "/Users/jokko";
  home.username = "jokko";

  imports = [
    ./editors/helix
    ./tools/alacritty
    ./tools/zsh
    ./tools/git
    ./wm/aerospace
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
