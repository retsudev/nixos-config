{ self, ... }:
{
  flake.modules.nixos.nixvim = { inputs, ... }: {
    imports = [ 
	inputs.nixvim.nixosModules.nixvim
	self.modules.nixos.nixvimBase
	self.modules.nixos.nixvimFormatting
    ];

    programs.nixvim = {
      enable = true;
    };
  };
}
