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

    casks = [
      "alacritty"
      "canva"
      "discord"
      "elgato-stream-deck"
      "figma"
      "firefox"
      "gimp"
      "keepassxc"
      "linearmouse"
      "microsoft-office"
      "microsoft-teams"
      "middleclick"
      "musescore"
      "nikitabobko/tap/aerospace"
      "obs"
      "obsidian"
      "prismlauncher"
      "proton-drive"
      "proton-mail"
      "spotify"
      "steam"
      "tidal"
      "visual-studio-code"
      "zotero"
    ];
  };
}

