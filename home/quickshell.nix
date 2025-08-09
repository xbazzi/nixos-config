{ pkgs, ... }:

{
  home.packages = [ pkgs.quickshell ];

  home.file.".config/quickshell" = {
    source = ./quickshell;
    recursive = true;
  };

  # start it when Hyprland starts
  wayland.windowManager.hyprland.settings.exec-once = [
    "quickshell -c default"
  ];

  # write the Quickshell config
  # xdg.configFile."quickshell/default/shell.qml".text = ''
  # '';
}
