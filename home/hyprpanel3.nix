{ inputs, ... }:

{
  programs.hyprpanel = {
    enable = true;
    settings = {
      bar = {
        layouts = {
          "0" = {
            left = [ "dashboard" "workspaces" ];
            middle = [ "media" ];
            right = [ "volume" "systray" "notifications" ];
          };
        };

        launcher.autoDetectIcon = true;
        customModules.storage.paths = [ "/" ];
        autoHide = "never";

        workspaces = {
          show_icons = true;
          show_numbered = false;
          workspaceMask = false;
          showWsIcons = true;
          showApplicationIcons = true;
          showAllActive = true;
        };

        network = {
          showWifiInfo   = true;
          truncation_size = 6;
          label          = true;
        };
      };

      menus = {
        media = {
          displayTimeTooltip = true;
          noMediaText = "Nathan rn";
        };
        clock.time = {
          military    = true;
          hideSeconds = false;
        };
        dashboard.controls.enabled = true;
      };

      theme = {
        matugen = false;

        font = {
          name  = "Monaspace Krypton";
          label = "Monaspace Krypton Medium";
        };

        bar = {
          floating    = false;
          location    = "bottom";
          transparent = false;
          opacity     = 90;
          background  = "#241f31";

          buttons = {
            enableBorders = true;
            borderSize    = "0.02em";
            monochrome    = false;

            workspaces = {
              occupied                        = "#00d0d0";
              active                          = "#05ff00";
              numbered_active_underline_color = "#00d0d0";
            };

            windowtitle = {
              text = "#00d0d0";
              icon = "#00ff19";
            };

            network.enableBorder = false;

            modules = {
              hypridle.enableBorder = true;
              cava.enableBorder     = true;
            };
          };

          menus.menu.media = {
            slider.primary = "#00e2c5";
            artist         = "#50ff00";
          };
        };
      };
    };
  };
}