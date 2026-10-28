{ self, ... }:
{
  flake.modules.nixos.nixvim = { inputs, ... }: {
    imports = [ 
	inputs.nixvim.nixosModules.nixvim
    ];

    programs.nixvim = {
      enable = true;
    };
  };
}
