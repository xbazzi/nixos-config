{
  pkgs,
  config,
  ...
}:
let

  ########################
  ########################
  ########################
  ########################
  ########################
  # DO AWWW INSTEAD OF THIS GAY ASS BS
  ########################
  ########################
  ########################
  ########################
  ########################

  wallpaperDir = "${config.home.homeDirectory}/wallpapers";
  # wallpaperScript = pkgs.writeShellScript "wallpaper-cycler" ''
  #   #!/bin/bash

  #   # Array of wallpapers
  #   wallpapers=(
  #     "${wallpaperDir}/dubai.jpg"
  #     "${wallpaperDir}/amsterdam.jpg"
  #     "${wallpaperDir}/matsumoto.jpg"
  #     # Add more wallpapers here
  #   )

  #   # Get current wallpaper index from file (or default to 0)
  #   index_file="$HOME/.cache/wallpaper_index"
  #   if [ -f "$index_file" ]; then
  #     current_index=$(cat "$index_file")
  #     notify-send "uncle philly"
  #   else
  #     notify-send "mafangu"
  #     current_index=0
  #   fi

  #   # Get next wallpaper
  #   next_index=$(( (current_index + 1) % ''${#wallpapers[@]} ))
  #   next_wallpaper="''${wallpapers[$next_index]}"

  #   # Set wallpaper using hyprctl
  #   ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper ",$next_wallpaper"

  #   # Save current index
  #   echo "$next_index" > "$index_file"
  # '';
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
