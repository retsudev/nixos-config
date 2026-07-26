{

	description = "My NixOS configuration";

	inputs = {
	  nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
	  nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
	  home-manager = { 
	    url = "github:nix-community/home-manager/release-26.05";
	    inputs.nixpkgs.follows = "nixpkgs";
	  };
	  catppuccin = {
	    url = "github:catppuccin/nix";
	    inputs.nixpkgs.follows = "nixpkgs";
	  };
	  lazyvim = {
	    url = "github:pfassina/lazyvim-nix";
	    inputs.nixpkgs.follows = "nixpkgs";
	  };		
	};


	outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, catppuccin, lazyvim, ... }:
	  
	  let
	    system = "x86_64-linux";
	    pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
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
	    extraSpecialArgs = { inherit inputs; };
	    modules = [
	      ./home.nix
	      catppuccin.homeModules.catppuccin
	    ];
	  };

	};
}

