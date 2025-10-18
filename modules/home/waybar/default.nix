{
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      spacing = 4;
      modules-left = [
        "niri/workspaces"
        "niri/window"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "battery"
        "tray"
      ];

      "niri/workspaces" = {
        all-outputs = true;
        format = "{value}";
      };
    };

    style = "
     * {
       border: none;
       border-radius: 0;
       font-family: monospace;
       font-size: 13px;
       min-height: 0;
     }

     window#waybar {
       background: #2e3440;
       color: #eceff4;
       opacity: 1.0;
     }

     #workspaces button {
       padding: 0 5px;
       color: #eceff4;
     }

     #workspaces button.focused {
       background: #5e81ac;
     }
   ";
  };
}
