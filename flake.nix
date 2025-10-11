{
  description = "My very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    
    nix-homebrew = { url = "github:zhaofengli/nix-homebrew"; };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers.url = "github:jakobbekken/wallpapers";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nix-darwin, nix-homebrew, home-manager, nix-index-database, ... }:
    let
      system = "x86_64-linux";
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        rivendell = nixpkgs.lib.nixosSystem {
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
              home-manager.users.jokko = import ./home/jokko-linux.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit unstable;
              };
            }

            nix-index-database.nixosModules.nix-index
            {
              programs.nix-index-database.comma.enable = true;
            }
          ];
        };
      };

      darwinConfigurations = {
        lorien = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit self unstable;
          };
          modules = [
            ./hosts/lorien
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jokko = import ./home/darwin.nix;
            }

            nix-index-database.darwinModules.nix-index
            {
              programs.nix-index-database.comma.enable = true;
            }
          ];
        };
      };
    };
}
