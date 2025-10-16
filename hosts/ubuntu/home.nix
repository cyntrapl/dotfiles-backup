{ pkgs, nixgl, config, lib, inputs, ...}: 
{
  nixGL.packages = import nixgl { inherit pkgs; };
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];

  programs.kitty.package = (config.lib.nixGL.wrap pkgs.kitty);
  programs.niri.package = (config.lib.nixGL.wrap pkgs.niri);
  programs.zen-browser.package = config.lib.nixGL.wrap (inputs.zen-browser.packages."${pkgs.system}".default);

  home.packages = with pkgs; [
    mesa
    vulkan-tools
    intel-media-driver  # for hardware video decoding
    libva-utils
    (config.lib.nixGL.wrap moonlight-qt) 
  ];

  home.sessionVariables = {
    # Force software rendering for all apps in Niri
    LIBGL_ALWAYS_SOFTWARE = "1";

    GBM_BACKEND = "kms";  # or "kms" for Intel/AMD
    __GLX_VENDOR_LIBRARY_NAME = "mesa";  # or "nvidia" if you have NVIDIA
    
    # EGL platform
    EGL_PLATFORM = "wayland";
    
    # Mesa driver override
    MESA_LOADER_DRIVER_OVERRIDE = "iris";  # for Intel, or "radeonsi" for AMD
    
    # OpenGL
    LIBGL_ALWAYS_INDIRECT = "0";
    
    # Wayland display
    WAYLAND_DISPLAY = "wayland-1";
  };

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    
    # Move commandLineArgs here, not in override
    commandLineArgs = [
      "--disable-setuid-sandbox"
      "--no-sandbox"
      "--disable-features=Sandbox"
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
  };
 
    # Enable user namespaces if not already enabled
  home.activation.enableUserNamespaces = ''
    if [ ! -f /proc/sys/kernel/unprivileged_userns_clone ] || [ "$(cat /proc/sys/kernel/unprivileged_userns_clone)" = "0" ]; then
      echo "Consider enabling kernel.unprivileged_userns_clone=1 for better sandboxing"
    fi
  '';


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
