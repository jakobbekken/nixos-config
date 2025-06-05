{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt
    nil
    gnumake
    bootdev-cli
  ];
}
