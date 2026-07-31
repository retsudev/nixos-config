-- Floating mode window size reduction
hl.window_rule ({
  match = { float = true },
  size = "monitor_w*0.5 monitor_h*0.5",
  move = "(monitor_w-window_w)/2 (monitor_h-window_h)/2",
})
