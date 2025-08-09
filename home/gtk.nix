{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  # Make Qt apps follow dark mode
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "Adwaita-dark";
  };

  #home.sessionVariables.GTK_THEME = "Tokyonight-Dark-B";
  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Tokyonight-Dark-B";
  #     package = pkgs.tokyo-night-gtk;
  #   };

  #   # cursorTheme = {
  #   #   name = "Vimix-Cursors";
  #   #   package = pkgs.vimix-cursors;
  #   # };

  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };
  # };
  # # home.sessionVariables = {
  # #   GTK_THEME = "Tokyonight-Dark-B";
  # #   XCURSOR_THEME = "vimix-cursor-theme";
  # #   XDG_CURRENT_DESKTOP = "GNOME";
  # #   GTK_ICON_THEME = "breeze-dark";
  # # };
  # home.sessionVariables = {
  #   QT_QPA_PLATFORMTHEME = "gtk2";
  #   QT_STYLE_OVERRIDE = "Tokyonight-Dark-B";
  # };

}
