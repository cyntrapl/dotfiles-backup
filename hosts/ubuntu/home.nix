{
  pkgs,
  nixgl,
  config,
  lib,
  inputs,
  ...
}:
{
  # nixGL.packages = import nixgl { inherit pkgs; };
  # nixGL.defaultWrapper = "mesa";
  # nixGL.installScripts = [ "mesa" ];

  # programs.kitty.package = (config.lib.nixGL.wrap pkgs.kitty);
  # programs.niri.package = (config.lib.nixGL.wrap pkgs.niri);
  # programs.zen-browser.package = config.lib.nixGL.wrap (
  #   inputs.zen-browser.packages."${pkgs.system}".default
  # );

  programs.kitty.enable = lib.mkForce false;
  programs.rofi.enable = lib.mkForce false;
  programs.waybar.enable = lib.mkForce false;
  programs.zen-browser.enable = lib.mkForce false;

  programs.niri = {
    enable = lib.mkForce false;
    settings = {
      outputs = {
        "eDP-1" = {
          mode = {
            width = 1920;
            height = 1080;
          };
          position = {
            x = 0;
            y = 0;
          };
        };
        "HDMI-A-1" = {
          mode = {
            width = 1920;
            height = 1080;
          };
          position = {
            x = 1920;
            y = 0;
          };
        };
      };
    };
  };

  programs.git = {
    userName = "Daniel Chobanov";
    userEmail = "219241553+DanielChobanov@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    # mesa
    # vulkan-tools
    # intel-media-driver # for hardware video decoding
    # libva-utils
    (config.lib.nixGL.wrap moonlight-qt)
    jetbrains.phpstorm
    dbeaver-bin
    (config.lib.nixGL.wrap cider)
    #_1password-gui
  ];
  #targets.genericLinux.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # Force software rendering for all apps in Niri
    # LIBGL_ALWAYS_SOFTWARE = "1";

    # PULSE_RUNTIME_PATH = "/run/user/$(id -u)/pulse";

    # # GBM_BACKEND = "kms"; # or "kms" for Intel/AMD
    # # __GLX_VENDOR_LIBRARY_NAME = "mesa"; # or "nvidia" if you have NVIDIA

    # # EGL platform
    EGL_PLATFORM = "wayland";

    # # Mesa driver override
    # # MESA_LOADER_DRIVER_OVERRIDE = "iris"; # for Intel, or "radeonsi" for AMD

    # # OpenGL
    # LIBGL_ALWAYS_INDIRECT = "0";

    # # Wayland display
    WAYLAND_DISPLAY = "wayland-1";
    XDG_CURRENT_DESKTOP = "sway";
    LIBGL_DRIVERS_PATH = "/usr/lib/x86_64-linux-gnu/dri";
    LD_LIBRARY_PATH = "/home/daniel/.nix-profile/lib:/nix/var/nix/profiles/default/lib:${builtins.getEnv "LD_LIBRARY_PATH"}";

    # Also ensure other important Nix paths
    NIX_PROFILES = "/nix/var/nix/profiles/default /home/daniel/.nix-profile";
  };

  # programs.chromium = {
  #   enable = true;
  #   package = pkgs.brave;

  #   #Move commandLineArgs here, not in override
  #   # commandLineArgs = [
  #   #   "--disable-setuid-sandbox"
  #   #   "--no-sandbox"
  #   #   "--disable-features=Sandbox"
  #   #   "--enable-features=UseOzonePlatform"
  #   #   "--ozone-platform=wayland"
  #   # ];
  # };
  #

  # Copy this file to /usr/share/wayland-sessions/
  home.file.".local/share/wayland-sessions/niri.desktop".text = ''
        [Desktop Entry]
    Name=Niri
    Comment=Scrollable-tiling Wayland compositor
    Exec=dbus-run-session /home/daniel/.nix-profile/bin/niri
    Type=Application
    DesktopNames=niri 
  '';
}
