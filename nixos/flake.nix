{
  description = "My very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    #home-manager.url = "github:nix-community/home-manager/release-24.05";
    #home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ...}: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        #home-manager.nixosModules.home-manager
        #{
	#  home-manager.useGlobalPkgs = true;
	#  home-manager.useUserPackages = true;
	#  home-manager.users.jokko = import /home/jokko/.config/home-manager/home.nix;
        #}
      ];
    };
  };
}
