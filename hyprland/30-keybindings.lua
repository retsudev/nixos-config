-- This is 30-keybindigns.lua - file for setting up custom keybinds


-- Program Shortcuts
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("zen"))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("pkill fuzzel || fuzzel"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("waypaper"))


-- Functional Hotkeys
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim - | wl-copy"))
hl.bind(mainMod .. " + V", function()
  hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
  hl.dispatch(hl.dsp.window.resize({ x = 960, y = 600, relative = false }))
  hl.dispatch(hl.dsp.window.center())
end)

-- Navigation
hl.bind(mainMod .. " + left",  hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + right",  hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + down",  hl.dsp.focus({direction = "down"}))
hl.bind(mainMod .. " + up",  hl.dsp.focus({direction = "up"}))

hl.bind(mainMod .. " + H",  hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + L",  hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + J",  hl.dsp.focus({direction = "down"}))
hl.bind(mainMod .. " + K",  hl.dsp.focus({direction = "up"}))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Dwindle-specific
hl.bind(mainMod .. " + backslash", hl.dsp.layout("swapsplit"))


-- Switching workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
  hl.bind(mainMod .. " + CTRL  +" .. key, hl.dsp.window.move({workspace = i}))
  hl.bind(mainMod .. " + SHIFT +" .. key, hl.dsp.window.move({workspace = i, follow = false}))
end

-- Multimedia / Brightness / Sound
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })


-- Playerctl keybinds
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
