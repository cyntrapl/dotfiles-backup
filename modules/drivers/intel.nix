{pkgs, ...}:
{
 hardware.graphics = {
   # OpenGL Stuff
   extraPackages = with pkgs; [
     intel-media-driver
     vaapiIntel
     vaapiVdpau
     libvdpau-va-gl
   ];
 }; 
}
