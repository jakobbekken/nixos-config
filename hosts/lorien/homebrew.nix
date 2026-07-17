{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "none";
      upgrade = true;
    };

    # brewPrefix = "/opt/homebrew/bin";
    # caskArgs = {
    #   no_quarantine = true;
    # };

    global = {
      brewfile = false;
    };

    taps = [
      "nikitabobko/tap"
    ];

    casks = [
      "android-studio"
      "audacity"
      "discord"
      "firefox"
      "ghostty"
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
      "spotify"
      "steam"
      "visual-studio-code"
      "vlc"
      "xld"
      "zotero"
    ];
  };
}

