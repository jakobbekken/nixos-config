{
  description = "My very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    nix-homebrew = { url = "github:zhaofengli/nix-homebrew"; };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nix-darwin, nix-homebrew, home-manager, nix-index-database, sops-nix, ... }:
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
              home-manager.users.jokko = import ./home/jokko.nix;
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
            inherit self unstable inputs sops-nix;
          };
          modules = [
            ./hosts/lorien
            sops-nix.darwinModules.sops
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jokko = import ./home/darwin.nix;
              home-manager.sharedModules = [
                sops-nix.homeManagerModules.sops
              ];
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
