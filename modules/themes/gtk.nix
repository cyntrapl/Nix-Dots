{pkgs, lib, ...}:
{ 
  gtk = {
    enable = true;
    theme.name = "Dracula";
    theme.package = pkgs.dracula-theme;

    font = {
      name = "Noto Sans JP";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";

    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
 }
