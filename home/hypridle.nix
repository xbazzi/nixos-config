{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
        before_sleep_cmd = "hyprctl dispatch exec 'hyprlock --immediate'";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 10; # 4.5 min — warn before lock
          on-timeout = "notify-send '🔒 Locking in 30s...'";
        }
        {
          timeout = 1000; # 16 min — lock screen
          on-timeout = "hyprctl dispatch exec 'hyprlock --immediate'";
        }
      ];
    };
  };
}
