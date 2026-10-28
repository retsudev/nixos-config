{...}: {
  perSystem = {pkgs, ...}: {
    devShells.parallel-cpp = pkgs.mkShell {
      packages = [
        pkgs.cmake
        pkgs.gcc
        pkgs.gnumake
        pkgs.openmpi
        pkgs.openmpi.dev
      ];
    };
  };
}
