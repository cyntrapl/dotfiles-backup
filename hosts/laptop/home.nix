{ pkgs, inputs, config,  ... }: {
 home.packages = with pkgs; [
   brave 
 ];
}
