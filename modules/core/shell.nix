{pkgs, user, ...}:
{
 programs.fish = {
   enable = true;
   interactiveShellInit = "set fish_greeting ";
 };

 environment.shells = [ pkgs.fish ];
 users.users.${user}.shell = pkgs.fish;
}
