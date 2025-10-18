{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dysk
    btop
  ];
}
