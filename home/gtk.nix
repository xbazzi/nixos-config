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

  # Make Qt apps follow dark mode (override stylix's qt5ct default)
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk2";
    QT_STYLE_OVERRIDE = lib.mkForce "Adwaita-dark";
  };
}
