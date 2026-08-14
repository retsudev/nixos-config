-- This is 50-windowrules.lua - file for custom windowrules

-- Obsidian pop-ups fix
hl.window_rule({
    name = "obsidian-popups-float",
    match = { class = "^(md\\.Obsidian)$", title = ".+ - .+ - Obsidian .+" },
    float = true,
    no_shadow = true,
    border_size = 0,
})
