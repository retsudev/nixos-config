{

  description = "RetsuDevs NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-2605.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    serpantinum = {
      url = "github:ilyamiro/serpantinum";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-2605,
      home-manager,
      lazyvim,
      zen-browser,
      serpantinum,
      ...
    }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in

    {
      # Formatter
      formatter.${system} = pkgs.nixfmt-tree;

      # NixOS system configuration
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit serpantinum inputs nixpkgs-2605;
        };
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          serpantinum.nixosModules.default
        ];
      };

      # Home-Manager configuration
      homeConfigurations.retsudev = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit serpantinum;
          zen-browser = zen-browser.packages.${system}.default;
        };
        modules = [
          ./home.nix
        ];
      };

    };
}
