{ pkgs, ... }:

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
}
