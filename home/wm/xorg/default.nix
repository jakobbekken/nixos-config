{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dmenu
    feh
    flameshot
    xclip
    x11vnc

    (writeShellScriptBin "kb-switcher" (builtins.readFile ./kb-switcher.sh))
    (writeShellScriptBin "monitor" (builtins.readFile ./monitor.sh))
  ];
}
