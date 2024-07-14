{ config, pkgs, ... }:

{
  imports = [
    ./eza.nix
    ./git.nix
    ./ripgrep.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    bat
    docker-compose
    fd
    fzf
  ];
}
