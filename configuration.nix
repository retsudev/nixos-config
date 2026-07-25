{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = ["amdgpu"];
  hardware.amdgpu.initrd.enable = true;

  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  services.pipewire.enable = true;

  services.libinput.enable = true;

  users.users.retsudev = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "meme";
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    kitty
    fastfetch
    fuzzel
    obsidian
    starship
  ];
  
  # hypland & fish settings & autoexec

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.fish.enable = true;
  users.users.retsudev.shell = pkgs.fish;

  services.greetd =  {
    enable = true;
    settings = {
      default_session = {
        command = "start-hyprland";
	user = "retsudev";
      };
    };
  };


  system.stateVersion = "26.05";

}

