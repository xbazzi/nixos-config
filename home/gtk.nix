{ inputs, pkgs, lib, config, ...  }:

{
  home.sessionVariables.GTK_THEME = "Tokyonight-Dark-B";
  gtk = {
    enable = true;
    # theme.name = "adw-gtk3";
    theme = {
      name = "Tokyonight-Dark-B";
      package = pkgs.tokyo-night-gtk;
    };
    cursorTheme = {
      name = "Oreo-Cursors";
      package = pkgs.oreo-cursors-plus;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.breeze-icons;
    };
  };
}