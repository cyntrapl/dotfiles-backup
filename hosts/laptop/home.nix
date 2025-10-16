{ pkgs, inputs, config,  ... }: {
 home.packages = with pkgs; [
   brave
   xfce.thunar
   xfce.thunar-archive-plugin
   moonlight-qt
   gparted
 ];
}
