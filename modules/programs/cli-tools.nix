{ ... }:
{
  flake.modules.homeManager.cli-tools = { inputs, pkgs, ... }: {
    home.packages = with pkgs; [
      fzf
      bat
      git
      ripgrep
      fd
      jq
      delta
      imagemagick
      ffmpeg
      pulseaudio
      btop
      duf
      dust
      brightnessctl
      playerctl
      wl-clipboard
      grim
      fastfetch
      onefetch
      hyfetch
      tree
      terminal-toys
      cmatrix
      cava
      tty-clock
      tldr
      inputs.undo.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
