{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    monitor = [
      "DP-1, 1920x1080@144, 0x0, 1"
      "DP-3, 2560x1440@240, 1920x0, 1"
      "HMDI-A-1, 3440x1440@160, 4480x0, 1"
      # "DP-3,addreserved,30,0,0,0"
    ];

    bind =
      [
        # "$mod, k, exec, kitty"
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
        "$mod, q, killactive"

        "$mod, f, fullscreen, 0"

        "$mod, d, exec, wofi --show drun"

        "$mod, t, exec, kitty --single-instance"
        "$mod, c, exec, code"
        "$mod SHIFT, l, movewindow, mon:-1"
        "$mod SHIFT, h, movewindow, mon:+1"

        ", Print, exec, grimblast copy area"

        "$mod, e, exec, thunderbird"
        "$mod, r, exec, kitty -- zsh -c 'exec yazi; exec zsh'"
        "$mod, b, exec, kitty -- zsh -c 'btop; exec zsh'"
        "$mod, y, exec, kitty --start-as=normal -- zsh -ic 'repos'"
        "$mod, i, exec, brave"
        "$mod, u, exec, kitty --start-as=normal -- zsh -ic 'home'"

        "$mod, s, togglespecialworkspace, special1"
        "$mod, v, togglespecialworkspace, special2"
        
        "$mod, p, swapwindow, l"

        # Log out
        # "$mod, -, exec, hyprctl dispatch exit"
        "$mod, _, exec, hyprctl dispatch exit"


        # Shift+Print → select area and copy
        "SHIFT, Print, exec, grimblast copy area"

        # Ctrl+Print → select window and copy
        "CTRL, Print, exec, grimblast copy active"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );

      decoration = {
        active_opacity = 1.0;
        inactive_opacity = 0.85;
        rounding = 5;
        # blur = {
        #     enabled = true;
        #     size = 9;
        #     passes = 1;
        # };
        shadow = {
            enabled = true;
            color = "rgba(2e3440aa)";
            range = 4;
            render_power = 3;
        };
        # border_size = 3;
      };

      animations = {
        enabled = true;
        animation = "fade, 1, 5, default";
      };

      general = {
        # allow_reserved_areas = true;
      };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    "sleep 2 && waybar"
    "eval $(gnome-keyring-daemon --start --components=secrets,ssh,gpg)"
  ];

  wayland.windowManager.hyprland.plugins = [
    # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
  ];
}
