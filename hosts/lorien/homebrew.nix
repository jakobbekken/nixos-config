{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    # brewPrefix = "/opt/homebrew/bin";
    caskArgs = {
      no_quarantine = true;
    };

    global = {
      brewfile = true;
    };

    taps = [
      "nikitabobko/tap"
    ];

    brews = [
      "colima"
    ];

    casks = [
      "alacritty"
      "android-studio"
      "audacity"
      "canva"
      "google-chrome"
      "discord"
      "elgato-stream-deck"
      "firefox"
      "gimp"
      "inkscape"
      "intellij-idea"
      "keepassxc"
      "linearmouse"
      "microsoft-office"
      "microsoft-teams"
      "middleclick"
      "musescore"
      "musicbrainz-picard"
      "nikitabobko/tap/aerospace"
      "obs"
      "obsidian"
      "prismlauncher"
      "proton-drive"
      "proton-mail"
      "protonvpn"
      "spotify"
      "steam"
      "tidal"
      "visual-studio-code"
      "vivaldi"
      "vlc"
      "xld"
      "xquartz"
      "zotero"
    ];
  };
}

