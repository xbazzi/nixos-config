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
      splash = true;
      preload = [
        "/home/xbazzi/Pictures/wallpapers/cities/sanfran.jpg" "/home/xbazzi/Pictures/wallpapers/cities/dubai.jpg"
      ];

      wallpaper = [
        ",/home/xbazzi/Pictures/wallpapers/cities/dubai.jpg"
      ];
    };
  };
}
