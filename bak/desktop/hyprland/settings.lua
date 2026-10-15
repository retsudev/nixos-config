hl.config({
  general = {
    border_size = 0,
    gaps_in = 6,
    gaps_out = 10,
    float_gaps = 6,
    resize_on_border = true,
    extend_border_grab_area = 50,
  },

  decoration = {
    rounding = 16,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    blur = {
      enabled = true,
      size = 8,
      passes = 2,

      brightness = 0.75,
      contrast = 1.0,

      ignore_opacity = true;
      new_optimizations = true,

      noise = 0.0117,
      vibrancy = 0.1,
    },
    shadow = {
      enabled = false,
    },
  },

  

  input = {
    kb_layout = "us,ru",
    kb_options = "grp:alt_shift_toggle",
    accel_profile = "flat",
    touchpad = {
      natural_scroll = true,
      disable_while_typing = true,
    },
  },

  misc = {
    focus_on_activate = false,
    font_family = "JetBrains Mono",
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
  },
})


hl.window_rule({
  match = { class = "^kitty$",},
  opacity = "0.93 override",
})
hl.window_rule({
  name = "obsidian pop-up float",
  match = { class = "^(md\\.Obsidian)$",title = ".+ - .+ - Obsidian .+"},
  float = true,
  no_shadow = true,
  border_size = 0,
})

hl.curve("smoothWindow", {
    type = "bezier",
    points = {
        {0.16, 0.77},
        {0.33, 1.0}
    }
})

hl.curve("smoothIn", {
    type = "bezier",
    points = {
        {0.12, 0.8},
        {0.39, 1.0}
    }
})

hl.curve("smoothOut", {
    type = "bezier",
    points = {
        {0.4, 0.0},
        {0.6, 1.0}
    }
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 5,
    bezier = "smoothWindow",
    style = "slide"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5,
    bezier = "smoothIn",
    style = "popin 70%"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 6,
    bezier = "smoothOut",
    style = "popin 0%"
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 5,
    bezier = "smoothWindow",
    style = "fade"
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 5,
    bezier = "smoothIn",
    style = "fade"
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 6,
    bezier = "smoothOut",
    style = "fade"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 5,
    bezier = "smoothWindow"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "smoothWindow",
    style = "slidevert"
})

hl.animation({
    leaf = "specialWorkspaceIn",
    enabled = true,
    speed = 5,
    bezier = "smoothIn",
    style = "slidefade"
})

hl.animation({
    leaf = "specialWorkspaceOut",
    enabled = true,
    speed = 6,
    bezier = "smoothOut",
    style = "slidefade"
})
