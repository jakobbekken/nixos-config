{ self, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
  [ pkgs.vim
    pkgs.neovim
    pkgs.helix
    pkgs.git
  ];

  system.primaryUser = "jokko";


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

    casks = [
      "alacritty"
      "discord"
      "firefox"
      "ghostty"
      "microsoft-office"
      "microsoft-teams"
      "musescore"
      "obsidian"
      "prismlauncher"
      "proton-drive"
      "proton-mail"
      "steam"
      "thunderbird"
      "tidal"
      "visual-studio-code"
    ];
  };

  users.users.jokko.home = "/Users/jokko";

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}

