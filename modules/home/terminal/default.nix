{ pkgs, nixgl, config, lib, ... }:
{
 imports = [
   ./utils.nix
 ];

 programs.kitty = {
   enable = true;


   settings = {
     confirm_os_window_close = 0;
     #background_opacity = "0.9";
   };

   themeFile = "Grape";
 };

 programs.fish = {
    enable = true;
    
    shellInit = ''
      # Nix environment
      set -gx NIX_PATH /home/daniel/.nix-defexpr/channels
      set -gx PATH /home/daniel/.nix-profile/bin /nix/var/nix/profiles/default/bin $PATH
      
      # Convert your bash exports to fish
      set -gx __HM_SESS_VARS_SOURCED 1
      set -gx LIBGL_ALWAYS_SOFTWARE "0"
      set -gx LOCALE_ARCHIVE_2_27 "/nix/store/qr1k8avryysx5m9ggbcds123d7y6f6as-glibc-locales-2.40-66/lib/locale/locale-archive"
      set -gx NIX_XDG_DESKTOP_PORTAL_DIR "/home/daniel/.nix-profile/share/xdg-desktop-portal/portals"
      set -gx XDG_CURRENT_DESKTOP "niri"
      set -gx XDG_SESSION_DESKTOP "niri"
      set -gx XDG_SESSION_TYPE "wayland"
      set -gx _JAVA_AWT_WM_NONREPARENTING "1"
      
      # XCURSOR_PATH with fish string expansion
      set -gx XCURSOR_PATH "/home/daniel/.nix-profile/share/icons:/usr/share/icons:/usr/share/pixmaps"
      if test -n "$XCURSOR_PATH"
        set -gx XCURSOR_PATH "$XCURSOR_PATH:$XCURSOR_PATH"
      end
      
      # SSH_AUTH_SOCK condition
      if test -z "$SSH_AUTH_SOCK"
        set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent"
      end
    '';

    interactiveShellInit = "set fish_greeting ";

    functions = {
      # Function that works with any command
      sw = "sudo (which $argv[1]) $argv[2..]";
    };
  }; 
}
