{ pkgs, ... }:
{
  programs.git = {
    enable = true;
  };

  home.packages = [ pkgs.lazygit ];
}
