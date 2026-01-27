{
  pkgs,
  config,
  ...
}:
let
  wallpaperDir = "${config.home.homeDirectory}/wallpapers";
in
{
  home.packages = [
    pkgs.hyprpaper
  ];

  home.file."wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        "${wallpaperDir}/dubai.jpg"
      ];
      wallpaper = [
        ",${wallpaperDir}/dubai.jpg"
      ];
    };
  };

  # Create systemd user service for wallpaper cycling
  # systemd.user.services.wallpaper-cycler = {
  #     Description = "Wallpaper cycler for hyprpaper";
  #     After = [ "hyprpaper.service" ];
  #     Wants = [ "hyprpaper.service" ];
  #   };
  #   Service = {
  #     Type = "oneshot";
  #     ExecStart = "${wallpaperScript}";
  #     Environment = [ "PATH=${pkgs.hyprland}/bin:$PATH" ];
  #   };
  # };

  # # Create systemd timer to run every 10 minutes
  # systemd.user.timers.wallpaper-cycler = {
  #   Unit = {
  #     Description = "Timer for wallpaper cycling";
  #     Requires = [ "wallpaper-cycler.service" ];
  #   };
  #   Timer = {
  #     OnBootSec = "1min";
  #     OnUnitActiveSec = "1min";
  #     Unit = "wallpaper-cycler.service";
  #   };
  #   Install = {
  #     WantedBy = [ "timers.target" ];
  #   };
  # };
}
