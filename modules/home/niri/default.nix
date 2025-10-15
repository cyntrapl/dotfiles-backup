{pkgs, inputs, config, nixgl, lib, ...}:
{
 imports = [ 
   inputs.niri-flake.homeModules.niri
   ./keybinds.nix
   ./layout.nix
 ];
 programs.niri = {
   enable = true;  

   package = (config.lib.nixGL.wrap pkgs.niri);

   settings.spawn-at-startup = [ 
     {argv = ["waybar"];}
   ];
 };

  home.packages = with pkgs; [
    #niri deps
    xorg.libXcursor
    libxkbcommon
    wl-clipboard
  ];

  # Set environment variables
  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_DESKTOP = "niri";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  }; 

    home.file.".local/share/wayland-sessions/niri.desktop".text = ''
    [Desktop Entry]
    Name=Niri
    Comment=Scrollable-tiling Wayland compositor
    Exec=dbus-run-session ${pkgs.niri}/bin/niri
    Type=Application
    DesktopNames=niri
  '';

}
