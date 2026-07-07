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
  };

  # Make Qt apps follow dark mode
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "Adwaita-dark";
  };
}
