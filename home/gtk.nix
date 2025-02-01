{ inputs, pkgs, lib, config, ...  }:

{
  #home.sessionVariables.GTK_THEME = "Tokyonight-Dark-B";
  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark-B";
      package = pkgs.tokyo-night-gtk;
    };

    cursorTheme = {
      name = "Vimix-Cursors";
      package = pkgs.vimix-cursor-theme;
    };

    iconTheme = {
      name = "breeze-dark";
      package = pkgs.breeze-icons;
    };
  };
  # home.sessionVariables = {
  #   GTK_THEME = "Tokyonight-Dark-B";
  #   XCURSOR_THEME = "vimix-cursor-theme";
  #   XDG_CURRENT_DESKTOP = "GNOME";
  #   GTK_ICON_THEME = "breeze-dark";
  # };
}