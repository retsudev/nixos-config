{lib, ...}: let
  lua = lib.generators.mkLuaInline;

  # Lua binds must be expressions. Wrap multi-statement handlers in a function
  # so Home Manager emits valid Lua instead of placing `local` after `function`.
  luaBind = key: body: {
    _args = [key (lua "function() ${body} end")];
  };

  layoutBind = key: scrollingAction: dwindleAction:
    luaBind key ''
      local workspace = hl.get_active_workspace()
      if not workspace then return end

      if workspace.tiled_layout == "scrolling" then
        ${scrollingAction}
      elseif workspace.tiled_layout == "dwindle" then
        ${dwindleAction}
      end
    '';

  dispatch = message: "hl.dispatch(hl.dsp.layout(${builtins.toJSON message}))";
in {
  flake.modules.homeManager.hyprlandLayouts = {...}: {
    wayland.windowManager.hyprland.settings = {
      config = {
        general = {
          layout = "scrolling";
          border_size = 0;
          gaps_in = 6;
          # Scrolling adds the inner gap beside its outermost columns.
          # Compensate horizontally so the visible screen-edge gap matches dwindle.
          gaps_out = {
            top = 10;
            right = 4;
            bottom = 10;
            left = 4;
          };
          resize_on_border = true;
          extend_border_grab_area = 50;
        };
        scrolling = {
          # A lone tiled column fills the monitor, matching dwindle's single window.
          fullscreen_on_one_column = true;
          # Keep focus at the first or last column instead of wrapping around.
          wrap_focus = false;
          # Width presets cycled by `colresize +conf`.
          explicit_column_widths = "0.333, 0.5, 0.667, 1.0";
        };
      };
      bind = [
      (luaBind "SUPER + CTRL + F" ''hl.dispatch(hl.dsp.window.fullscreen({ action = "toggle" }))'')
      (luaBind "SUPER + SHIFT + F" ''hl.dispatch(hl.dsp.window.fullscreen({ action = "toggle" }))'')
      (luaBind "SUPER + f" ''
        local w = hl.get_active_window()
        if w == nil then return end
        if not w.floating then
          hl.dispatch(hl.dsp.window.float({ action = "set" }))
          hl.dispatch(hl.dsp.window.resize({ x = 800, y = 600, relative = false }))
          hl.dispatch(hl.dsp.window.center())
        else
          hl.dispatch(hl.dsp.window.float({ action = "unset" }))
        end
      '')
      (luaBind "SUPER + TAB" ''
        local layout = hl.get_config("general.layout")
        local nextLayout = layout == "scrolling" and "dwindle" or "scrolling"
        local nextGapsOut = nextLayout == "scrolling"
          and { top = 10, right = 4, bottom = 10, left = 4 }
          or 10
        hl.config({ general = { layout = nextLayout, gaps_out = nextGapsOut } })
      '')

      # Cycle scrolling column widths, or swap the active dwindle split.
      (layoutBind "SUPER + r" (dispatch "colresize +conf")
        (dispatch "swapsplit"))

      # Navigation follows columns in scrolling and tiled neighbors in dwindle.
      (layoutBind "SUPER + left" (dispatch "focus l")
        "hl.dispatch(hl.dsp.focus({ direction = \"left\" }))")
      (layoutBind "SUPER + right" (dispatch "focus r")
        "hl.dispatch(hl.dsp.focus({ direction = \"right\" }))")
      (luaBind "SUPER + up" ''hl.dispatch(hl.dsp.focus({ direction = "up" }))'')
      (luaBind "SUPER + down" ''hl.dispatch(hl.dsp.focus({ direction = "down" }))'')

      # Shift + comma/period are the < and > keys: scroll by one column.
      (layoutBind "SUPER + SHIFT + comma" (dispatch "move -col") "")
      (layoutBind "SUPER + SHIFT + period" (dispatch "move +col") "")

      # Existing window movement, focus and resize bindings now live together here.
      (luaBind "SUPER + code:43" ''hl.dispatch(hl.dsp.focus({ direction = "left" }))'')
      (luaBind "SUPER + code:44" ''hl.dispatch(hl.dsp.focus({ direction = "down" }))'')
      (luaBind "SUPER + code:45" ''hl.dispatch(hl.dsp.focus({ direction = "up" }))'')
      (luaBind "SUPER + code:46" ''hl.dispatch(hl.dsp.focus({ direction = "right" }))'')
      (luaBind "SUPER + CTRL + left" ''hl.dispatch(hl.dsp.window.swap({ direction = "l" }))'')
      (luaBind "SUPER + CTRL + right" ''hl.dispatch(hl.dsp.window.swap({ direction = "r" }))'')
      (luaBind "SUPER + CTRL + up" ''hl.dispatch(hl.dsp.window.swap({ direction = "u" }))'')
      (luaBind "SUPER + CTRL + down" ''hl.dispatch(hl.dsp.window.swap({ direction = "d" }))'')
      (layoutBind "SUPER + SHIFT + left" (dispatch "colresize -0.1")
        "hl.dispatch(hl.dsp.window.resize({ x = -50, y = 0, relative = true }))")
      (layoutBind "SUPER + SHIFT + right" (dispatch "colresize +0.1")
        "hl.dispatch(hl.dsp.window.resize({ x = 50, y = 0, relative = true }))")
      (luaBind "SUPER + SHIFT + up" ''hl.dispatch(hl.dsp.window.resize({ x = 0, y = -50, relative = true }))'')
      (luaBind "SUPER + SHIFT + down" ''hl.dispatch(hl.dsp.window.resize({ x = 0, y = 50, relative = true }))'')
      {
        _args = ["SUPER + mouse:272" (lua "function() hl.dispatch(hl.dsp.window.drag()) end") {mouse = true;}];
      }
      {
        _args = ["SUPER + mouse:273" (lua "function() hl.dispatch(hl.dsp.window.resize()) end") {mouse = true;}];
      }
      ];
    };
  };
}
