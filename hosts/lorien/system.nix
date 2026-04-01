{ self, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    git
    helix
    libfido2
    neovim
    openssh
    vim
  ];

  users.users.jokko.home = "/Users/jokko";

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = "jokko";
    startup.chime = false;
    defaults = {
      screencapture.location = "$HOME/Pictures/screenshots";
      loginwindow.LoginwindowText = "If lost, call +47 41 32 59 51 or email post@jokko.no";
    };
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.config.allowUnfree = true;

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

