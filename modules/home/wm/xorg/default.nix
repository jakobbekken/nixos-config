{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dmenu
    feh
    flameshot
    xclip

    (writeShellScriptBin "kb-switcher" (builtins.readFile ./kb-switcher.sh))
  ];
}
