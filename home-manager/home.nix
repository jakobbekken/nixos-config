{ config, pkgs, ... }:

{
  # Home manager information
  home.username = "jokko";
  home.homeDirectory = "/home/jokko";
  home.stateVersion = "24.05"; # Do not change
  home.keyboard.options = [ "caps:escape" ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./apps
    ./cli
    ./editors
    ./fonts
    ./wm
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
