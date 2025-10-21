{
  pkgs,
  inputs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    brave
    xfce.thunar
    xfce.thunar-archive-plugin
    moonlight-qt
    gparted
    obsidian
    unixtools.netstat
    #jetbrains.idea-ultimate
  ];

  programs.git = {
    userName = "Cyntrap";
    userEmail = "219241553+cyntrapl@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
