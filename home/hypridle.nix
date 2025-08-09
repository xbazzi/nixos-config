{ inputs, pkgs, lib, config, ...  }:

{
    programs.hypridle = {
        enable = true;

        settings = {
            general = {
                lock_cmd = "hyprctl dispatch exec 'hyprlock --immediate'";
                before_sleep_cmd = "hyprctl dispatch exec 'hyprlock --immediate'";
                after_sleep_cmd = "notify-send '💡 Welcome back, badman!'";
            };

            listener = [
            {
                timeout = 270; # 4.5 min — warn before lock
                on-timeout = "notify-send '🔒 Locking in 30s...'";
            }
            {
                timeout = 300; # 5 min — lock screen
                on-timeout = "hyprctl dispatch exec 'hypelock --immediate'";
            }
            {
                timeout = 900; # 15 min — suspend
                on-timeout = "systemctl suspend";
            }
            ];
        };
    };
}
