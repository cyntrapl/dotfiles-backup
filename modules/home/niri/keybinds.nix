{ config, ... }:
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    #Workspaces
    "Alt+1".action = focus-workspace 1;
    "Alt+2".action = focus-workspace 2;
    "Alt+3".action = focus-workspace 3;
    "Alt+4".action = focus-workspace 4;
    "Alt+5".action = focus-workspace 5;
    "Alt+6".action = focus-workspace 6;
    "Alt+7".action = focus-workspace 7;
    "Alt+8".action = focus-workspace 8;
    "Alt+9".action = focus-workspace 9;
    "Alt+0".action = focus-workspace 10;

    #Focus
    "Super+Left".action = focus-column-left;
    "Super+Right".action = focus-column-right;
    "Super+Up".action = focus-window-up;
    "Super+Down".action = focus-window-down;
    "Alt+H".action = focus-column-left;
    "Alt+L".action = focus-column-right;
    "Alt+K".action = focus-window-up;
    "Alt+J".action = focus-window-down;

    "Alt+Shift+Left".action = focus-monitor-left;
    "Alt+Shift+Right".action = focus-monitor-right;
    "Alt+Shift+Up".action = focus-monitor-up;
    "Alt+Shift+Down".action = focus-monitor-down;

    #Move
    "Alt+Ctrl+1".action.move-column-to-workspace = 1;
    "Alt+Ctrl+2".action.move-column-to-workspace = 2;
    "Alt+Ctrl+3".action.move-column-to-workspace = 3;
    "Alt+Ctrl+4".action.move-column-to-workspace = 4;
    "Alt+Ctrl+5".action.move-column-to-workspace = 5;
    "Alt+Ctrl+6".action.move-column-to-workspace = 6;
    "Alt+Ctrl+7".action.move-column-to-workspace = 7;
    "Alt+Ctrl+8".action.move-column-to-workspace = 8;
    "Alt+Ctrl+9".action.move-column-to-workspace = 9;
    "Alt+Ctrl+0".action.move-column-to-workspace = 10;

    # Changed these to Super+Shift
    "Super+Shift+Left".action = move-column-left;
    "Super+Shift+Right".action = move-column-right;
    "Super+Shift+Up".action = move-window-up;
    "Super+Shift+Down".action = move-window-down;
    "Super+Shift+H".action = move-column-left;
    "Super+Shift+L".action = move-column-right;
    "Super+Shift+K".action = move-window-up;
    "Super+Shift+J".action = move-window-down;

    "Alt+BracketLeft".action = consume-or-expel-window-left;
    "Alt+BracketRight".action = consume-or-expel-window-right;

    "Alt+Comma".action = consume-window-into-column;
    "Alt+Period".action = expel-window-from-column;

    #Window Size
    "Alt+Minus".action = set-column-width "-10%";
    "Alt+Shift+Minus".action = set-window-height "-10%";
    "Alt+Equal".action = set-column-width "+10%";
    "Alt+Shift+Equal".action = set-window-height "+10%";

    "Alt+V".action = toggle-window-floating;
    "Alt+Shift+V".action = switch-focus-between-floating-and-tiling;

    #General
    "Alt+Shift+Slash".action = show-hotkey-overlay;
    "Alt+Shift+E" = {
      action = quit { skip-confirmation = true; };
      repeat = false;
    };
    "Alt+O" = {
      action = toggle-overview;
      repeat = false;
    };
    "Alt+Q".action = close-window;
    "Alt+F".action = maximize-column;
    "Super+Ctrl+F".action = fullscreen-window;
    "Alt+Shift+F".action = expand-column-to-available-width;
    "Alt+C".action = center-column;

    #Spawns
    "Alt+P".action = spawn "fuzzel";
    "Alt+Return".action = spawn "kitty";
    "Alt+D".action = spawn "brave-browser";
  };
}
