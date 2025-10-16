{pkgs, ...}:
{ 
  gtk = {
    enable = true;
  };

  qt = {
    enable = true;

    style = {
      name = "adwaita-dark";
    };
  };
 }
