{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [

    #
    # General utilities
    #
    
    # CLI tools
    htop
    lf
    neofetch
    ripgrep
    eza

    # Developer tools
    git
    helix
    vim
    docker-compose
    
    # File management

    # Networking
    blueman

    # System monitoring
    flameshot
    xorg.xrandr
    xclip

    # Sound
    alsa-utils

    # Window manager
    feh
    dmenu

    #
    # Multimedia and recording
    #

    # Recording and editing
    audacity
    droidcam
    kdenlive
    obs-studio
    vlc

    # Graphics
    gimp
    inkscape

    #
    # Apps and games
    #

    # Browsers
    firefox

    # Games
    prismlauncher
    steam

    # Media
    discord
    spotify

    # Productivity
    obsidian

    #
    # Fonts
    #

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" ]; })

    #
    # Custom
    #

    (writeShellScriptBin "battery" ''
      echo "Battery status: $(cat /sys/class/power_supply/BAT0/capacity)%"
    '')

  ];
}
