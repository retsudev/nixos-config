-- locals
mainMod  = "SUPER"
terminal = "kitty"
menu     = "fuzzel"

-- at-start-ups
hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("systemctl --user start skwd-daemon")
end)

-- Environment cursor
hl.env("XCURSOR_THEME",     "WhiteSur-cursors")
hl.env("XCURSOR_SIZE",      "24")
hl.env("HYPRCURSOR_THEME",  "WhiteSur-cursors")
hl.env("HYPRCURSOR_SIZE",   "24")

