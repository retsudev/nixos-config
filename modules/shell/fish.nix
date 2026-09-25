{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      zoxide init fish | source
      bind ctrl-backspace backward-kill-path-component
      bind alt-backspace backward-kill-path-component
    '';
    shellAliases = {
      # Basic aliases
      c = "pyroclear";
      n = "nvim";
      ff = "clear && fastfetch";
      conf = "cd && cd nixos-config/";
      nconf = "cd && cd nixos-config/modules/programs/lazyvim";
      # NixOS flake.nix aliases
      nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
      nix-build = "sudo nixos-rebuild build --flake ~/nixos-config#nixos";
      nix-listgens = "nixos-rebuild list-generations";
      nix-deletegens = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system";
      # NixOS home-manager standalone aliases
      hm-switch = "home-manager switch --flake ~/nixos-config#retsudev";
      hm-build = "home-manager build --flake ~/nixos-config#retsudev";
      hm-gens = "home-manager generations";
      hm-deletegens = "home-manager remove-generations";

      # Files
      ls = "eza";
      ll = "eza -lah --git";
      la = "eza -a";
      lt = "eza --tree --level=2";
      cat = "bat --paging=never";

      # Git
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git lod --oneline --graph --decorate";
      lg = "lazygit";

      # Disk
      df = "duf";
      du = "dust";
    };
    functions = {
    cmake-build = {
      body = ''
        set build_dir build

        cmake -S . -B $build_dir -G Ninja \
          -DCMAKE_CXX_COMPILER=clang++

        and cmake --build $build_dir

        if test "$argv[1]" = "--run"
          set executables (
            ninja -C $build_dir -t targets all |
            string match -r '^[^:]+: (?:CXX|C)_EXECUTABLE_LINKER' |
            string replace -r ': (?:CXX|C)_EXECUTABLE_LINKER.*' ""
          )

          if test (count $executables) -eq 0
            echo "No executable targets found."
            return 1
          end

          if test (count $executables) -eq 1
            set target $executables[1]
          else
            echo "Available executables:"
            for i in (seq (count $executables))
              echo "$i) $executables[$i]"
            end

            read -P "Select executable: " choice

            if not string match -qr '^[0-9]+$' -- $choice
              echo "Invalid selection."
              return 1
            end

            if test $choice -lt 1 -o $choice -gt (count $executables)
              echo "Invalid selection."
              return 1
            end

            set target $executables[$choice]
          end

          echo "Running $target..."
          $build_dir/$target
        end
      '';
      description = "Configure, build and optionally run a CMake project";
      };
    };
  };
}
