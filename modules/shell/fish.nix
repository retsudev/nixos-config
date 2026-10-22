{ self, ... } :
{
  flake.wrappers.fish = { pkgs, wlib, ...}: 
  let
    starship = self.packages.${pkgs.stdenv.hostPlatform.system}.starship;
  in
    {
    imports = [ wlib.wrapperModules.fish ];

    runtimePkgs = [ pkgs.zoxide pkgs.eza ];

    configFile.content = ''
      if status is-interactive
      set -g fish_greeting

      starship init fish | source
      zoxide init fish | source

      bind ctrl-backspace backward-kill-path-component
      bind alt-backspace backward-kill-path-component

      if test -f ~/.config/fish/aliases.fish
        source ~/.config/fish/aliases.fish
      end
    end
  '';
  };

  flake.modules.nixos.fish = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.fish
    ];
  };
}
