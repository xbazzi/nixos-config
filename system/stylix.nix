{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light.yaml";
    # image = ./forest.png;
    polarity = "dark";
  };
}
