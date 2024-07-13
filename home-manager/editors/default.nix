{ config, pkgs, ... }:

{
  imports = [
    ./nvim
  ];

  home.packages = with pkgs; [
    helix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
