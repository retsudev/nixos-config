{

	description = "My NixOS configuration";

	inputs = {
	  nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
	  nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
	  home-manager = { 
	    url = "github:nix-community/home-manager/release-26.05";
	    inputs.nixpkgs.follows = "nixpkgs";
	  };
	  catppuccin.url = "github:catppuccin/nix";
	};
	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, catppuccin, ... }:
	  
	  let
	    system = "x86_64-linux";
	    pkgs = nixpkgs.legacyPackages.${system};
	  in

        {
	  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	    inherit system;
	    modules = [
	      ./configuration.nix
	      ./hardware-configuration.nix
	    ];
	  };

	  homeConfigurations.retsudev = home-manager.lib.homeManagerConfiguration {
	    inherit pkgs;
	    modules = [
	      ./home.nix
	      catppuccin.homeModules.catppuccin
	    ];
	  };

	};
}

