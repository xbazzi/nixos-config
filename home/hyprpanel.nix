{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

let
  themeDirectory = "${config.programs.hyprpanel.package}/share/themes";
  currentTheme = "monochrome";
  raw = lib.importJSON "${themeDirectory}/${currentTheme}.json";
  selectedTheme = if raw ? theme then raw.theme else raw;

  # We need to turn the theme json into a nested attribute set. Otherwise we
  # end up with an incorrect configuration that looks like:
  # theme: {theme.bar.transparent: "value", theme.foo.bar: "another value"}
  # when what we really want is: theme: {bar: ..., buttons: ...}
  # ----
  # turn "foo.bar.baz" and value into { foo = { bar = { baz = value; }; }; }
  nestAttr = path: value: lib.attrsets.setAttrByPath (lib.splitString "." path) value;

  # merge a flat attrset into nested
  unflatten =
    flat:
    lib.foldlAttrs (
      acc: k: v:
      lib.recursiveUpdate acc (nestAttr k v)
    ) { } flat;

  themeAttrs = unflatten selectedTheme;
  base = themeAttrs.theme;
  themeOverrides = {
    font.size = "16px";
    # bar.buttons.workspaces.numbered_active_highlighted_text_color = "#21252b";
    # bar.buttons.style = "default";
    matugen = false;

    font = {
      name  = "Monaspace Krypton";
      label = "Monaspace Krypton Medium";
    };

    osd.enable = true;

    bar = {

      bar.background = lib.mkForce "#000000";
      floating    = false;
      location    = "bottom";
      opacity     = 50;
      transparent = false;

      border = {
        location = "none";
        width    = "0.15em";
      };

      buttons = {
        style = "default";
        borderSize    = "0.02em";
        enableBorders = false;
        monochrome    = false;

        network.enableBorder = true;
        systray.enableBorder = false;
        clock.enableBorder   = false;

        windowtitle = {
          icon = "#00ff19";
          text = "#00d0d0";
        };

        workspaces = {
          active                          = "#05ff00";
          numbered_active_underline_color = "#00d0d0";
          occupied                        = "#00d0d0";
        };

        modules = {
          hypridle.enableBorder = true;
          cava.enableBorder     = true;
          netstat = {
            enableBorder = false;
            spacing      = "0.45em";
          };
        };
      };

      menus.menu.media = {
        artist         = "#50ff00";
        slider.primary = "#00e2c5";
      };
    };
  };

  finalTheme = lib.recursiveUpdate base themeOverrides;
in
{
  programs.hyprpanel = {
    enable = true;
    settings = {
      bar = {
        # autoHide = "never";

        customModules = {
          hypridle = {
            isActiveCommand = "systemctl --user status hypridle.service | grep -q 'Active: active (running)' && echo 'yes' || echo 'no'";
            startCommand    = "systemctl --user start hypridle.service";
            stopCommand     = "systemctl --user stop hypridle.service";
          };
          storage.paths = [ "/" ];
          hyprsunset = {
            temperature = "4000K";
          };
          hypridle = {
          };
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
            left   = [ 
              "dashboard"
              "workspaces"
              "media"
              "volume"
            ];
            middle = [ 
              "clock"
            ];
            right  = [
              "systray"
              "netstat"
              "hyprsunset"
              "hypridle"
              # "updates"
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
          identifier           = true;
          show_numbered        = false;
          workspaceMask        = false;
        };
        # clock.format = "%a %b %d  %I:%M:%S %p";
      };


        menus = {
          clock = {
            time = {
              hideSeconds = false;
              military    = true;
            };
            weather.unit = "standard";
          };
          dashboard = {
            controls.enabled = true;
            directories.enabled = false;
            stats.enable_gpu = true;
            media = {
              displayTimeTooltip = true;
              noMediaText        = "Nathan rn";
            };
          };
        };

        # theme = builtins.fromJSON (builtins.readFile "${themeDirectory}/${currentTheme}.json");
        theme = lib.mkForce finalTheme;
    };
  };
}