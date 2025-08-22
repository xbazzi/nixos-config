{
  pkgs,
  config,
  ...
}:

{
  home.packages = [
    pkgs.hyprpaper
  ]; 
  # xdg.configFile."/hypr/hyprpaper/matsumoto.jpg".source = "${config.home.homeDirectory}/nixos-config/home/wallpapers";
  home.file."wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = true;
      preload = [
        "${config.home.homeDirectory}/wallpapers/dubai.jpg"
        "${config.home.homeDirectory}/wallpapers/newyork.jpg"
      ];

      wallpaper = [
        ",${config.home.homeDirectory}/wallpapers/newyork.jpg"
        ",${config.home.homeDirectory}/wallpapers/dubai.jpg"
      ];
    };
  };
}
