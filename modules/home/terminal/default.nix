{
  pkgs,
  nixgl,
  config,
  lib,
  ...
}:
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

    interactiveShellInit = "set fish_greeting ";

    functions = {
      # Function that works with any command
      sw = "sudo (which $argv[1]) $argv[2..]";
    };
  };
}
