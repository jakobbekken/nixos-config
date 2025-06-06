{ ... }:

{
  home.username = "sauron";
  home.homeDirectory = "/home/sauron";
  home.keyboard.options = [ "caps:escape" ];
  home.keyboard.layout = "us";

  imports = [
    ./editors/helix
    ./tools/git
  ];

  home.shellAliases = {
    ":q" = "exit";
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
