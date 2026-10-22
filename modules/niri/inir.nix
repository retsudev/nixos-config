{ ... }:
{
  flake.modules.homeManager.inir = { inputs, niriPackage, ... }: {
    imports = [ inputs.inir.homeModules.inir ];

    programs.inir = {
      enable = true;
      service.compositor = "niri";
      extraPackages = [ niriPackage ];
      configSymlink.enable = true;
    };
  };
}
