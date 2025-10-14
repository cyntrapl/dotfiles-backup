{inputs, ...}:
{
 imports = [ 
   inputs.nvf.homeManagerModules.default 
   ./ui.nix
 ];

 programs.nvf = {
   enable = true;
 };
}
