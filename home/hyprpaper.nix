{
  pkgs,
  #   inputs,
  ...
}:

{
  home.packages = [
    pkgs.hyprpaper
  ];
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        "/home/xbazzi/Pictures/wallpapers/Fantasy-Landscape2.png"
      ];

      wallpaper = [
        ",/home/xbazzi/Pictures/wallpapers/Fantasy-Landscape2.png"
      ];
    };
  };
}
