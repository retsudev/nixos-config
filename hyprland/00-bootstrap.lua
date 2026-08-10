-- This is 00-bootstrap.lua - file for the environment variables, at-start-ups and lua locals


-- locals
mainMod  = "SUPER"
terminal = "kitty"
menu     = "fuzzel"

-- at-start-ups
hl.on("hyprland.start", function()
  hl.exec_cmd("swww-daemon")
  hl.exec_cmd("sh -c 'sleep 1 && waypaper --restore'")
end)

-- Environment cursor
hl.env("XCURSOR_THEME",     "WhiteSur-cursors")
hl.env("XCURSOR_SIZE",      "24")
hl.env("HYPRCURSOR_THEME",  "WhiteSur-cursors")
hl.env("HYPRCURSOR_SIZE",   "24")

