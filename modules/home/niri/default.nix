{pkgs, inputs, ...}:
{
 imports = [ 
   inputs.niri-flake.homeModules.niri
   ./keybinds.nix
   ./layout.nix
 ];
 programs.niri = {
   enable = true;  


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

 home.sessionVariables = {
   NIXOS_OZONE_WL = 1;
   XDG_SESSION_TYPE = "wayland";
   WLR_NO_HARDWARE_CURSORS = 1;
 }; 
}
