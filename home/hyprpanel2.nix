{ lib, ... }:
let
  tokyo = lib.importJSON (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Jas-SinghFSU/HyprPanel/master/themes/tokyo_night.json";
    sha256 = "0fpl12109cim5nfm9kx5zcd50i3avzvh2sl4syb40q12k2wi7ibj"; # nix-prefetch-url <url>
  });
  tokyo-moon = lib.importJSON (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Jas-SinghFSU/HyprPanel/master/themes/tokyo_night_moon.json";
    sha256 = "14wmf4zv28zkkjswr5iy56imxfjyyp9aw624m19aigx9qckqi2p9"; # nix-prefetch-url <url>
  });
  cyberpunk = lib.importJSON (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Jas-SinghFSU/HyprPanel/refs/heads/master/themes/cyberpunk_vivid.json";
    sha256 = "0wvx49zyka84wwzi8mxnvgjb5zbb41z1lw0asbj15yyi6k4d38ws"; # nix-prefetch-url <url>
  });
  nord = lib.importJSON (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Jas-SinghFSU/HyprPanel/refs/heads/master/themes/nord.json";
    sha256 = "1gm1lbjrmah4ji8zvfz5dpsbfk0la2a1r431fynnafbnwb3mwxj8"; # nix-prefetch-url <url>
  });
  nord-vivid = lib.importJSON (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Jas-SinghFSU/HyprPanel/refs/heads/master/themes/nord_vivid.json";
    sha256 = "05qdkvkqf58bgnibc54sfvmw210adi7h2hczjz6b1vx043wxgxan"; # nix-prefetch-url <url>
  });
  tokyo-vivid = lib.importJSON (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Jas-SinghFSU/HyprPanel/refs/heads/master/themes/tokyo_night_vivid.json";
    sha256 = "09mhl9lkqya5lf306h6ynmfaxqngv9f1q1c27lmrwx0vriv97vkq"; # nix-prefetch-url <url>
  });
  one_dark = lib.importJSON (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Jas-SinghFSU/HyprPanel/refs/heads/master/themes/one_dark.json";
    sha256 = "0034jb14fxfhm7669kp0ik0jgn7j7glyimsyvksxb88y6lpgqjw9"; # nix-prefetch-url <url>
  });

  mySettings = {
    bar = {
      autoHide = "never";

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
          left   = [ "dashboard" "workspaces" "media" ];
          middle = [ 
            "clock"
            "volume"
          ];
          right  = [
            "hyprsunset"
            "hypridle"
            "netstat"
            "systray"
            "updates"
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

    theme = {
      matugen = false;

      font = {
        name  = "Monaspace Krypton";
        label = "Monaspace Krypton Medium";
      };

      osd.enable = true;

      bar = {
        floating    = false;
        location    = "bottom";
        opacity     = 90;
        transparent = false;

        border = {
          location = "none";
          width    = "0.15em";
        };

        buttons = {
          style = "wave";
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
  };

  myOverrides = mySettings // {
    "theme.bar.buttons.style" = "wave";
    "theme.bar.opacity"     = "95";
    "theme.bar.transparent"     = "false";
        # transparent = false;
  };

  merged = lib.recursiveUpdate nord-vivid myOverrides;
in {
  programs.hyprpanel.enable = true;
  programs.hyprpanel.settings = merged;
}
