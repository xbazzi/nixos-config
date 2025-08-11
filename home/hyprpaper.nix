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
        "/home/xbazzi/Pictures/wallpapers/cities"
      ];

      wallpaper = [
        ",/home/xbazzi/Pictures/wallpapers/Fantasy-Lake1.png"
      ];
    };
  };
}
