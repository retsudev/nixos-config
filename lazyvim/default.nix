{ inputs, ... }:
{
  flake.modules.homeManager.lazyvim = { pkgs, ... }: {
    imports = [ inputs.lazyvim.homeManagerModules.default ];
    programs.lazyvim = {
      enable = true;
      configFiles = ./.;
      extras = {
        lang.clangd = {
          enable = true;
          installDependencies = false;
        };
        lang.java = {
          enable = true;
          installDependencies = false;
        };
        lang.nix = {
          enable = true;
          installDependencies = false;
        };
        lang.python = {
          enable = true;
          installDependencies = false;
        };
      };
      extraPackages = with pkgs; [
        alejandra
        clang-tools
        jdt-language-server
        google-java-format
        nil
        pyright
        ruff
        rust-analyzer
        rustfmt
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        c
        cpp
        java
        nix
        python
        rust
      ];
    };
  };
}
