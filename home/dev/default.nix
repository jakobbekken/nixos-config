{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt
    nil
    gnumake
    bootdev-cli
    jdk25_headless
    claude-code
  ];
}
