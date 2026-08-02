{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # BootLoader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
  
  # GPU and Sound 
  hardware.amdgpu.initrd.enable = true;
  services = { 
    xserver.videoDrivers = ["amdgpu"];
    pipewire = {
      enable = true; 
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  }; 

  # Allow proprietary software
  nixpkgs.config.allowUnfree = true;
  
  # Wallpaper Stack
  programs.skwd-wall.enable = true;
  
  # Network 
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;


  # Timezone
  time.timeZone = "Europe/Moscow";
  
  # User settings
  users.users.retsudev = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "everyonelovessystemd";
    shell = pkgs.fish;
  };
  
  # System Wide programs 
  programs = { 
    fish.enable = true;
    throne = {
      enable = true;
      tunMode.enable = true;
    };
  };
  
  # hypland & fish settings & hyprland autoexec

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.greetd =  {
    enable = true;
    settings = {
      default_session = {
        command = "start-hyprland";
      	user = "retsudev";
      };
    };
  };
  
  # First version 
  system.stateVersion = "26.05";

}

