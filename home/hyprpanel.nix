{ inputs, ... }:
{
  programs.hyprpanel = {
    enable = true;
    # Configure and theme almost all options from the GUI.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      bar = {
        autoHide = "never";
        location = "bottom";

        customModules = {
          hypridle = {
            isActiveCommand = "systemctl --user status hypridle.service | grep -q 'Active: active (running)' && echo 'yes' || echo 'no'";
            startCommand    = "systemctl --user start hypridle.service";
            stopCommand     = "systemctl --user stop hypridle.service";
          };
          storage.paths = [ "/" ];
          hyprsunset = { };
          netstat = {
            networkInterface = "enp6s0f0";
            label            = true;
            leftClick        = "nm-applet";
          };
        };

        launcher.autoDetectIcon = true;

        layouts = {
          "0" = { left = [ ]; middle = [ ]; right = [ ]; };
          "1" = { left = [ ]; middle = [ ]; right = [ ]; };
          "2" = {
            left   = [ "dashboard" "workspaces" "media" ];
            middle = [ "clock" ];
            right  = [
              "volume"
              "systray"
              "notifications"
              # "network"
              "hyprsunset"
              "netstat"
              "systray"
              "updates"
              "notifications"
              "notifications"
              "notifications"
            ];
          };
        };

        network = {
          label           = true;
          showWifiInfo    = true;
          truncation_size = 6;
          truncation      = true;
        };

        workspaces = {
          showAllActive        = true;
          showApplicationIcons = true;
          showWsIcons          = true;
          show_icons           = true;
          show_numbered        = false;
          workspaceMask        = false;
        };

        clock.format = "%a %b %d  %I:%M:%S %p";
      };

    menus = {
      clock.time = {
        hideSeconds = false;
        military    = true;
      };
      dashboard.controls.enabled = true;
      media = {
        displayTimeTooltip = true;
        noMediaText        = "Nathan rn";
      };
    };


      theme = import ./hyprpanel/tokyo-night.nix;

      # theme = {
      #   matugen = false;

      #   font = {
      #     name  = "Monaspace Krypton";
      #     label = "Monaspace Krypton Medium";
      #   };

      #   osd.enable = true;

      #   bar = {
      #     background  = "#241f31";
      #     floating    = false;
      #     location    = "bottom";
      #     opacity     = 90;
      #     transparent = false;

      #     border = {
      #       location = "none";
      #       width    = "0.15em";
      #     };

      #     buttons = {
      #       style = "wave";
      #       # background = "#282828";
      #       # icon_background = "#242438";
      #       # hover = "#504945";
      #       # text = "#83a598";
      #       # icon = "#83a598";
      #       # borderColor = "#83a598";
      #       borderSize    = "0.02em";
      #       enableBorders = false;
      #       monochrome    = false;

      #       network.enableBorder = true;     # last value wins

      #       systray.enableBorder = false;
      #       clock.enableBorder   = false;

      #       windowtitle = {
      #         icon = "#00ff19";
      #         text = "#00d0d0";
      #       };

      #       workspaces = {
      #         active                          = "#05ff00";
      #         numbered_active_underline_color = "#00d0d0";
      #         occupied                        = "#00d0d0";
      #       };

      #       modules = {
      #         hypridle.enableBorder = true;
      #         cava.enableBorder     = true;

      #         netstat = {
      #           enableBorder = false;        # last value wins
      #           spacing      = "0.45em";
      #         };
      #       };
      #     };

      #     menus.menu.media = {
      #       artist         = "#50ff00";
      #       slider.primary = "#00e2c5";
      #     };
      #   };
      # };

    };
  };
}