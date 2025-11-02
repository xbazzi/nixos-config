{
  config,
  pkgs,
  inputs,
  ...
}:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
  wayland.windowManager.hyprland = {
    settings = {
      "$file_browser" = "thunar";
      "$mod" = "SUPER";

      input = {
        repeat_delay = 240;
        repeat_rate = 40;
      };

      env = [
        "HYPRLAND_PRIMARY_MONITOR,DP-3"
      ];

      monitor = [
        "DP-1, 1920x1080@144, 0x0, 1"
        "DP-3, 2560x1440@240, 1920x0, 1"
        "HDMI-A-1, 3440x1440@160, 4480x0, 1"
        # "DP-3,addreserved,30,0,0,0"
      ];

      # Mouse stuff (Ew... I know)
      bindm = [
        # Right click move
        "ALT, mouse:272, movewindow"

        # Left click resize
        "ALT, mouse:273, resizewindow"
        # "ALT CTRL, mouse:272, resizewindow 1"
      ];

      binde = [
        "$mod CTRL, h, resizeactive, -30 0"
        "$mod CTRL, l, resizeactive, 30 0"
        "$mod CTRL, j, resizeactive, 0 30"
        "$mod CTRL, k, resizeactive, 0 -30"

        "$mod, 0, layoutmsg, rollnext"
        "$mod SHIFT, 0, layoutmsg, rollprev"
        "$mod SHIFT, n, layoutmsg, cycleprev"
        "$mod SHIFT, p, layoutmsg, cyclenext"
      ];

      bind = [
        # File manager
        "$mod, z, exec, $file_browser"

        # Dwindle
        "$mod, p, layoutmsg, togglesplit"
        "$mod, 0, layoutmsg, swapsplit"
        "$mod, o, layoutmsg, movetoroot"

        "$mod, a, layoutmsg, preselect l"
        "$mod SHIFT, a, layoutmsg, preselect u"

        "ALT, TAB, cyclenext, all"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
        "$mod SHIFT, q, killactive"

        "$mod, f, fullscreen, 0"

        # "$mod, d, exec, wofi --show drun"
        "$mod, d, exec, waycast"
        "$mod, SPACE, exec, ${pkgs.wofi-emoji}/bin/wofi-emoji"

        "$mod, t, exec, kitty --single-instance"

        "$mod, c, exec, code"
        "$mod SHIFT, l, movewindow, mon:-1"
        "$mod SHIFT, h, movewindow, mon:+1"

        "$mod, e, exec, thunderbird"
        "$mod, r, exec, kitty -- zsh -c 'exec yazi; exec zsh'"
        "$mod, b, exec, kitty -- zsh -c 'exec btop; exec zsh'"
        "$mod CTRL, n, exec, kitty --start-as=normal -- zsh -ic 'code ~/nixos-config && exit'"

        "$mod, i, exec, brave --disable-features=WaylandWpColorManagerV1"
        "$mod, u, exec, kitty --start-as=normal -- zsh -ic 'home'"
        # "$mod, y, exec, kitty --start-as=normal -- zsh -ic 'repos'"
        "$mod, y, exec, eza -ld $HOME/repos/* --color=never | awk '{print $7}' | wofi --dmenu --prompt \"Open project:\" | xargs -I{} code {} -n && exit"

        "$mod, s, togglespecialworkspace, special1"
        # "$mod, v, togglespecialworkspace, special2"

        "$mod, p, layoutmsg, swapwithmaster"

        "$mod, v, togglefloating, active"

        # Log out
        # "$mod, -, exec, hyprctl dispatch exit"
        "$mod SHIFT ALT, x, exec, hyprctl dispatch exit"
        
        # Reload
        "$mod SHIFT rLT, R, exec, hyprctl reload"

        "$mod ALT, L, exec, hyprlock --immediate"

        # Print whole screen
        ", Print, exec, grimblast copy screen"

        # Shift+Print → select area and copy
        "SHIFT, Print, exec, grimblast copy area"

        # Ctrl+Print → select window and copy
        "CTRL, Print, exec, grimblast copy active"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      );

      # doesn't work
      # workspace =
      #   builtins.genList (i: "DP-3, ${toString (i + 1)}") 9;
      workspace = [
        "1, monitor:DP-3, persistent:true"
        "2, monitor:DP-3, persistent:true"
        "3, monitor:DP-3, persistent:true"
        "4, monitor:DP-3, persistent:true"
        "5, monitor:DP-3, persistent:true"
        "6, monitor:DP-3, persistent:true"
        "7, monitor:DP-3, persistent:true"
      ];

      dwindle = {
        preserve_split = true;
        smart_resizing = true;
      };

      general = {
        gaps_out = 0;
        gaps_in = 0;
        layout = "master";
        # layout = "dwindle";
      };

      windowrulev2 = [
        # "size 1920 1440, class:^(cs2)$"

        "opacity 0.87, class:^(Code)$"
        "opacity 0.87, class:^(code)$"
        "opacity 0.75, class:^(kitty)$"
      ];
      layerrule = [
        "noanim, Waycast"
      ];

      # layerrule = [
      #   "ignorealpha 0.1, title:^(Blur)$"
      # ];

      decoration = {
        # active_opacity = 1.0;
        # inactive_opacity = 1.0;
        # rounding = 5;

        blur = {
          enabled = true;
          size = 1;
          passes = 2;
          brightness = 1;
          contrast = 1.0;
          ignore_opacity = false;
          noise = 0;
          new_optimizations = true;
          # xray = true;
        };

        blurls = "^(popup|menu)$";

        # shadow = {
        #   enabled = true;

        #   ignore_window = true;
        #   offset = "0 2";
        #   range = 20;
        #   render_power = 3;
        #   color = "rgba(00000055)";
        # };
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "fade_curve, 0, 0.55, 0.45, 1"
        ];

        animation = [
          # name, enable, speed, curve, style

          # Windows
          "windowsIn,   0, 4, easeOutCubic,  popin 20%" # window open
          "windowsOut,  0, 4, fluent_decel,  popin 80%" # window close.
          "windowsMove, 1, 2, fluent_decel, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn,      1, 3,   fade_curve" # fade in (open) -> layers and windows
          "fadeOut,     1, 3,   fade_curve" # fade out (close) -> layers and windows
          "fadeSwitch,  0, 1,   easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow,  1, 10,  easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim,     1, 4,   fluent_decel" # the easing of the dimming of inactive windows
          # "border,      1, 2.7, easeOutCirc"  # for animating the border's color switch speed
          # "borderangle, 1, 30,  fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces,  1, 4,   easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      exec-once = [
        "noisetorch"
        ''hyprctl plugin load "$HYPR_PLUGIN_DIR/lib/libhyprexpo.so"''
        "eval $(gnome-keyring-daemon --start --components=secrets,ssh,gpg)"
        # "hash dbus-update-activation-environment 2>/dev/null"
        # "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      # plugins = [
        # inputs.hyprland-plugins.packages.${pkgs.system}.hyprfocus
        # pkgs.hyprlandPlugins.csgo-vulkan-fix
        # legacyPackages.x86_64-linux.hyprlandPlugins.csgo-vulkan-fix
        # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
        # inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix
      # ];
    };
  };
}
