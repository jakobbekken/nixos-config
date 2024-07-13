{ config, pkgs, ... }:

{
  imports = [
    ./eza.nix
    ./git.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    bat
    docker-compose
    fd
    fzf
    ripgrep
  ];
}
