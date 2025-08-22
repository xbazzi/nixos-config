{
  config,
  pkgs,
  inputs,
  # assets,
  ...
}:
let
  basePath = "/home/xbazzi/Pictures/wallpapers/cities";
  wallpaper = "dubai.jpg";
in
{
  environment = {
    etc = {
      # "sddm-wallpaper.png".source = "${assets}/sddm-background.png";
      "gtk-3.0/settings.ini".text = ''
        [Settings]
        gtk-icon-theme-name=Papirus
        gtk-theme-name=Adwaita
        gtk-cursor-theme-name=Adwaita
      '';
    };

    # systemPackages = with pkgs; [
    #   papirus-icon-theme
    #   (sddm-chili-theme.override {
    #     themeConfig = {
    #       background = "/etc/sddm-wallpaper.png";
    #       ScreenWidth = "3440";
    #       ScreenHeight = "1440";
    #       recursiveBlurLoops = 1;
    #       recursiveBlurRadius = 10;
    #     };
    #   })
    #   libsForQt5.qt5.qtgraphicaleffects
    # ];

    pathsToLink = [
      "/share/icons"
    ];

    variables = {
      GTK_ICON_THEME = "Papirus";
    };
  };

  programs.dconf.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "chili";
    autoNumlock = true;
    package = pkgs.libsForQt5.sddm;
    extraPackages = with pkgs.libsForQt5.qt5; [
      qtgraphicaleffects
      qtquickcontrols2
      qtquickcontrols
      qtsvg
      qtdeclarative # QtQuick core
    ];
  };
}