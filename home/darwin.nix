{ pkgs, config, ... }:

{

  home.homeDirectory = "/Users/jokko";
  home.username = "jokko";

  imports = [
    ./dev
    ./editors/helix
    ./tools/alacritty
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
  ];

  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../secrets/secrets.yaml;

    secrets = {
      openai_api_key.path = "${config.xdg.configHome}/secrets/openai_api_key";
    };
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
