{ pkgs, nixgl, config, lib, ...}: 
{
  nixGL.packages = import nixgl { inherit pkgs; };
  nixGL.defaultWrapper = "mesa"; # or the driver you need
  nixGL.installScripts = [ "mesa" ];

  programs.kitty.package = (config.lib.nixGL.wrap pkgs.kitty);


  programs.niri.package = (config.lib.nixGL.wrap pkgs.niri);


    home.file.".local/share/wayland-sessions/niri.desktop".text = ''
    [Desktop Entry]
    Name=Niri
    Comment=Scrollable-tiling Wayland compositor
    Exec=dbus-run-session ${pkgs.niri}/bin/niri
    Type=Application
    DesktopNames=niri
  '';
}
