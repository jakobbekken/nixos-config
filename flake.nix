{
  description = "My very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers.url = "github:jakobbekken/wallpapers";
    
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
let
  system = "x86_64-linux";
  unstable = import nixpkgs-unstable {
    inherit system;
  };
in
{
    nixosConfigurations.rivendell = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit unstable;
      };
      modules = [
        ./hosts/rivendell/configuration.nix
        home-manager.nixosModules.home-manager
        {
      	  home-manager.useGlobalPkgs = true;
      	  home-manager.useUserPackages = true;
      	  home-manager.users.jokko = import ./modules/home;
          home-manager.extraSpecialArgs = {
            inherit inputs;
            inherit unstable;
          };
        }
      ];
    };
  };
}
