{
  pkgs,
  inputs,
  config,
  nixgl,
  lib,
  ...
}:
{
  imports = [
    inputs.niri-flake.homeModules.niri
    ./keybinds.nix
    ./layout.nix
  ];
  programs.niri = {
    enable = true;

    settings.spawn-at-startup = [
      {
        argv = [
          "sh"
          "-c"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway"
        ];
      }
      { argv = [ "${pkgs.waybar}/bin/waybar" ]; }
      { argv = [ "xwayland-satellite" ]; }
    ];

    settings.xwayland-satellite = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    #niri deps
    xorg.libXcursor
    libxkbcommon
    wl-clipboard
    #xwayland
    xwayland-satellite
    pavucontrol
  ];

  # Set environment variables
  home.sessionVariables = {
    # XDG_SESSION_TYPE = "wayland";
    # XDG_CURRENT_DESKTOP = "niri";
    # XDG_SESSION_DESKTOP = "niri";
    # _JAVA_AWT_WM_NONREPARENTING = "1";
  };

}
