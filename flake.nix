{

  description = "RetsuDevs NixOS dendritic flake";

  inputs = {
    # pkg branches
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # dendritic flake deps
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # additional programs
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  # import modules/ automatically
  outputs = inputs: inputs.flake-parts.lib.mkFlake
    {inherit inputs;}
    {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        inputs.flake-parts.flakeModules.modules
        inputs.wrapper-modules.flakeModules.wrappers
        (inputs.import-tree ./modules)
      ];
    };
}
