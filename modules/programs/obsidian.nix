{ pkgs, ... }:
let
  obsidianUnwrapped = pkgs.obsidian;

  obsidian-fhs = pkgs.buildFHSEnv {
    name = "obsidian";
    targetPkgs = _: [ obsidianUnwrapped ];
    runScript = "obsidian";

    extraInstallCommands = ''
      cp -r ${obsidianUnwrapped}/share $out/
    '';
  };
in
{
  home.packages = [ obsidian-fhs ];

  home.file."Obsidian/.keep".text = "";
}
