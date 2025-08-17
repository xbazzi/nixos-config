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
        # lock_cmd = "hyprctl dispatch exec 'hyprlock --immediate'";
        lock_cmd = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
        before_sleep_cmd = "hyprctl dispatch exec 'hyprlock --immediate'";
        # before_sleep_cmd = "loginctl lock-session";
        # after_sleep_cmd = "notify-send '💡 Welcome back, badman!'";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 270; # 4.5 min — warn before lock
          on-timeout = "notify-send '🔒 Locking in 30s...'";
          # on-timeout = "notify-send 'hiii'";
        }
        {
          timeout = 1000; # 16 min — lock screen
          on-timeout = "hyprctl dispatch exec 'hyprlock --immediate'";
        }
        # {
        #   timeout = 900; # 15 min — suspend
        #   on-timeout = "systemctl suspend";
        # }
      ];
    };
  };
}
