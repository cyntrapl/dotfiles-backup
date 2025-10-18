# In your home.nix
{ inputs, pkgs, ... }:
{
  # 1. Import the AGS Home Manager module
  imports = [ inputs.ags.homeManagerModules.default ];
  # 2. Enable and configure AGS
  programs.ags = {
    enable = true;

    # Path to your config directory (e.g., './ags' within your flake)
    configDir = ./config;
    # Optional: Extra packages needed for your AGS config to run
    extraPackages = with pkgs; [
      gtksourceview
      # webkitgtk
      # accountsservice
    ];
  };
}
