{config, ...}:
{
 programs.niri.settings.binds = with config.lib.niri.actions; {
   #Workspaces
   "Mod+1".action = focus-workspace 1;
   "Mod+2".action = focus-workspace 2;
   "Mod+3".action = focus-workspace 3;
   "Mod+4".action = focus-workspace 4;
   "Mod+5".action = focus-workspace 5;
   "Mod+6".action = focus-workspace 6;
   "Mod+7".action = focus-workspace 7;
   "Mod+8".action = focus-workspace 8;
   "Mod+9".action = focus-workspace 9;
   "Mod+0".action = focus-workspace 10;

   #Columns
   "Mod+Left".action = focus-column-left;
   "Mod+Right".action = focus-column-right;
   "Mod+Up".action = focus-window-up;
   "Mod+Down".action = focus-window-down;
   "Mod+H".action = focus-column-left;
   "Mod+L".action = focus-column-right;
   "Mod+K".action = focus-window-up;
   "Mod+J".action = focus-window-down;

   #Move
   "Mod+Ctrl+1".action.move-column-to-workspace = 1;
   "Mod+Ctrl+2".action.move-column-to-workspace = 2;
   "Mod+Ctrl+3".action.move-column-to-workspace = 3;
   "Mod+Ctrl+4".action.move-column-to-workspace = 4;
   "Mod+Ctrl+5".action.move-column-to-workspace = 5;
   "Mod+Ctrl+6".action.move-column-to-workspace = 6;
   "Mod+Ctrl+7".action.move-column-to-workspace = 7;
   "Mod+Ctrl+8".action.move-column-to-workspace = 8;
   "Mod+Ctrl+9".action.move-column-to-workspace = 9;
   "Mod+Ctrl+0".action.move-column-to-workspace = 10;

   "Mod+Shift+Left".action = move-column-left;
   "Mod+Shift+Right".action = move-column-right;
   "Mod+Shift+Up".action = move-window-up;
   "Mod+Shift+Down".action = move-window-down;
   "Mod+Shift+H".action = move-column-left;
   "Mod+Shift+L".action = move-column-right;
   "Mod+Shift+K".action = move-window-up;
   "Mod+Shift+J".action = move-window-down;

   "Mod+BracketLeft".action = consume-or-expel-window-left;
   "Mod+BracketRight".action = consume-or-expel-window-right;

   "Mod+Comma".action = consume-window-into-column;
   "Mod+Period".action = expel-window-from-column;

   #Window Size
   "Mod+Minus".action = set-column-width "-10%";
   "Mod+Shift+Minus".action = set-window-height "-10%";
   "Mod+Equal".action = set-column-width "+10%";
   "Mod+Shift+Equal".action = set-window-height "+10%";

   "Mod+V".action = toggle-window-floating;
   "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;
   
   #General
   "Mod+Shift+Slash".action = show-hotkey-overlay;
    "Mod+Shift+E" = {
       action = quit {skip-confirmation=true;};
       repeat = false;
     };
     "Mod+O" = {
       action = toggle-overview;
       repeat = false;
     };
     "Mod+Q".action = close-window;
   "Mod+F".action = maximize-column;
   "Mod+Shift+F".action = fullscreen-window;
   "Mod+Ctrl+F".action = expand-column-to-available-width;
   "Mod+C".action = center-column;

   #Spawns
   "Mod+P".action = spawn "rofi" "-show"  "run";
   "Mod+Return".action = spawn "kitty";
 };
}
