{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    prismlauncher
    steam
  ];
}
