{ pkgs, ...}:

{
  programs.btop = {
    enable = true;
    # color_theme = "phoenix-night";
    color_theme = "HotPurpleTrafficLight";
    theme_background = false;
  };
}