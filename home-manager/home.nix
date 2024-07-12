{ config, pkgs, ... }:

{
  # Home manager information
  home.username = "jokko";
  home.homeDirectory = "/home/jokko";
  home.stateVersion = "24.05"; # Do not change

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/alacritty.nix
    ./modules/bspwm.nix
    ./modules/git.nix
    ./modules/nvim.nix
    ./modules/packages.nix
    ./modules/sxhkd.nix
    ./modules/zsh.nix
  ];

  #
  # Configs
  #

  home.keyboard.options = [ "caps:escape" ];

  # Apps
  programs.alacritty.enable = true;
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = true;
  };

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
    WALLPAPER_PATH = "$HOME/.config/home-manager/wallpapers/gruvbox/brown_city.jpg";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
