{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  home.username = "xbazzi";
  home.homeDirectory = "/home/xbazzi";

  wayland.windowManager.hyprland.enable = true;

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    targets = {
      kitty.enable = true;
    };
  };

  programs.command-not-found.enable = false;

  programs.home-manager.enable = true;

  nixpkgs.config.packageOverrides = pkgs: {
    flameshot = pkgs.flameshot.override {
      enableWlrSupport = true;
    };
  };

  xdg.userDirs.setSessionVariables = false;

  home.stateVersion = "24.11"; # Please read the comment before changing.
}
