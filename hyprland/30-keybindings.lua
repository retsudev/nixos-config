-- Program Shortcuts
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("zen"))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("pkill fuzzel || fuzzel"))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.exec_cmd("skwd wall toggle"))

-- Functional Hotkeys
hl.bind(mainMod .. " + C", hl.dsp.window.center())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim - | wl-copy"))

-- Scrolling navigation
hl.bind(mainMod .. " + left",  hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + right", hl.dsp.layout("focus r"))

hl.bind(mainMod .. " + up",  hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",hl.dsp.focus({ direction = "down" }))

-- Resizing windows 
hl.bind(mainMod .. " + equal", hl.dsp.layout("colresize +0.1"))
hl.bind(mainMod .. " + minus", hl.dsp.layout("colresize -0.1"))

hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.window.resize({ x = 0, y = 50}))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.resize({ x = 0, y = -50}))

hl.bind(mainMod .. " + P", hl.dsp.layout("promote"))

-- Switching workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
  hl.bind(mainMod .. " + CTRL  +" .. key, hl.dsp.window.move({workspace = i}))
  hl.bind(mainMod .. " + SHIFT +" .. key, hl.dsp.window.move({workspace = i, follow = false}))
end

-- Touchpad gestures
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.gesture({fingers = 2, direction = "pinch", action = "resize", mods = mainMod })

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
