{
  nix.enable = true;

  clangd.enable = true;

  cmake.enable = true;

  typescript.enable = true;

  rust = {
    enable = true;
    installDependencies = false;
    installRuntimeDependencies = false;
  };

  java = {
    enable = true;
    installDependencies = false;
    installRuntimeDependencies = false;
  };
  python = {
    enable = true;
    installDependencies = false;
    installRuntimeDependencies = false;
  };
}
