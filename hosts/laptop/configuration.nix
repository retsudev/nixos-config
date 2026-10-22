{ self, inputs, ...}: {
  flake.modules.nixos.laptopConfiguration = {pkgs, lib, ... }: {
    imports = [
      self.modules.nixos.laptopHardware
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.auto-optimise-store = true;
    nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      vim
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Moscow";
    services.blueman.enable = true;
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    hardware.amdgpu.initrd.enable = true;
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    services.logind.settings.Login.HandleLidSwitch = "ignore";

    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [ noto-fonts noto-fonts-color-emoji ];
      fontconfig.enable = true;
    };

    desktop.autoLoginUser = "retsudev";

    # Do NOT change it
    system.stateVersion = "26.05";
  };
}

