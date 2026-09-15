{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./system/throne-prog.nix
  ];
  # Nix settings
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  nixpkgs.config.allowUnfree = true;
  # BootLoader
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # auto-delete generations
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  # GPU and Sound
  services = {
    blueman.enable = true;
    upower.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  hardware = {
    amdgpu.initrd.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  # Network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # timezone
  time.timeZone = "Europe/Moscow";

  # user settings
  users.users.retsudev = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "input"
      "vboxusers"
    ];
    shell = pkgs.fish;
  };

  # Enable virtualisation
  virtualisation.virtualbox.host.enable = true;
  # System Wide programs
  programs = {
    fish.enable = true;
  };

  # Steam settings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  # Serpantinum shell
  programs.serpantinum.enable = true;

  # hypland & fish settings & hyprland autoexec
  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "start-hyprland";
        user = "retsudev";
      };
    };
  };
  # Dont suspend or turn off the display when closing the lid
  services.logind.settings.Login.HandleLidSwitch = "ignore";

  # Fonts
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.enable = true;
  };

  # First version
  system.stateVersion = "26.05";
}
