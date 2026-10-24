{ ... }:
{
  flake.modules.homeManager.music-dl = { pkgs, ... }: {
    home.packages = with pkgs; [
      yt-dlp
      spotdl
      ffmpeg
    ];
  };
}
