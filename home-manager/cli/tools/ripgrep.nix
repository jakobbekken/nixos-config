{ configm, pkgs, ... }:

{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--hidden"
    ];
  };
}
