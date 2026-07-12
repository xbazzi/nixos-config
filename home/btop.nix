{ pkgs, lib, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "HotPurpleTrafficLight";
      theme_background = false;
      vim_keys = true;
    };
  };
}
