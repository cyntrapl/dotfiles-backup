{
 programs.git = {
   enable = true;

   userName = "Cyntrap";
   userEmail = "52960173+cyntrapl@users.noreply.github.com"; 
   extraConfig = {
     #url."git@github.com".insteadOf = "https://github.com/";
     init.defaultBranch = "main";
   };
 };
}
