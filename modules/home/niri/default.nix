{pkgs, inputs, ...}:
{
 imports = [ 
   inputs.niri-flake.homeModules.niri
   ./keybinds.nix
   ./layout.nix
 ];
 programs.niri = {
   enable = true;  

   package = pkgs.niri;
   settings.spawn-at-startup = [ 
     {argv = ["waybar"];}


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
    xwayland
    xwayland-satellite
    pavucontrol
  ];

 home.sessionVariables = {
   NIXOS_OZONE_WL = 1;
   XDG_SESSION_TYPE = "wayland";
   WLR_NO_HARDWARE_CURSORS = 1;
 }; 
}
