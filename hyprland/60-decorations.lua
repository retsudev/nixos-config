-- Dynamic border color matugen

local colorsPath = os.getenv("HOME") .. "/.config/hypr/matugen-colors.lua"
local ok, accentColor = pcall(dotfile,colorsPath)
if not ok then
  accentColor = "rgba(888888ff)" -- backup color
end

hl.config ({
  general = {
    ["col.active_border"] = accentColor,
  },
  
  decoration = {
    active_opacity   = 0.92,
    inactive_opacity = 0.92,
    rounding = 8,
    blur = {
      enabled = true,
      size    = 4,
      passes  = 2,
    },
  },
})


