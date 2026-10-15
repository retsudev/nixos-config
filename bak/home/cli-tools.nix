{ pkgs, pyroclear, undo, codex-nix, ... }:
{
  home.packages = with pkgs; [

    # --- WorkFlow ---
    codex-nix

    # --- Navigation & search ---
    zoxide
    fzf
    ripgrep
    fd

    # --- File & Text utils ---
    eza
    bat

    # --- Images & Videos ---
    imagemagick
    ffmpeg

    # -- Git ---
    git
    delta

    # --- Disk & System ---
    btop
    duf
    dust

    # --- Hardware ---
    brightnessctl
    playerctl

    # --- Waylaynd / Screenshots & Clipboard ---
    wl-clipboard
    grim

    # --- System information ---
    fastfetch
    onefetch
    hyfetch
    tree

    # --- Terminal toys ---
    terminal-toys
    cmatrix
    cava
    tty-clock

    # --- Docs ---
    tldr

    # --- Misc ---
    pyroclear

    # --- Safety ---
    undo
  ];

  programs.zk.enable = true;
}
