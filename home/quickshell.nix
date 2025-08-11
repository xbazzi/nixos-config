{ pkgs, ... }:

{
  home.packages = with pkgs; [
    quickshell 
  ];

  home.file.".config/quickshell" = {
    source = ./quickshell;
    recursive = true;
  };

  # start it when Hyprland starts
  # wayland.windowManager.hyprland.settings.exec-once = [
  #   "quickshell -c default"
  # ];
  
  # auto reload
  systemd.user.services.quickshell = {
    Unit = { Description = "Quickshell bar"; PartOf = [ "graphical-session.target" ]; };
    Service = {
      ExecStart = "${pkgs.quickshell}/bin/quickshell -c hyprshell";
      Restart = "always";
    };
    Install = { WantedBy = [ "default.target" ]; };
  };

  # Restart service when config changes (needs systemd 245+; HM supports Path units)
  systemd.user.paths.quickshell-watch = {
    Unit = { Description = "Watch Quickshell config"; };
    Path = { PathChanged = "%h/.config/quickshell"; };
    Install = { WantedBy = [ "default.target" ]; };
  };

  # write the Quickshell config
  # xdg.configFile."quickshell/default/shell.qml".text = ''
  # '';
}
