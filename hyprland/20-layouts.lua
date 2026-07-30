hl.config ({
  general = {
    layout      = "scrolling",
    gaps_in     = 8,
    gaps_out    = 12,
    border_size = 2,
  },
})

-- Scrolling layout settings
hl.config ({
  scrolling = {
    fullscreen_on_one_column = false,
    column_width             = 0.5,
    focus_fit_method         = 1,
    follow_focus             = true,
    follow_min_visible       = 0.4,
    wrap_focus               = true,
    wrap_swapcol             = true,
    direction                = "right",
  },
})
