{ pkgs, pyroclear, ... }:
{
  home.packages = with pkgs; [
    # --- Navigation & search ---
    zoxide
    fzf
    ripgrep
    fd

    # --- File & Text utils ---
    eza
    bat

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
  ];
}
