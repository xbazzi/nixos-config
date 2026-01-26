{
  lib,
  pkgs,
  inputs,
  ...
}:

with lib;
let
  hyprPluginPkgs = inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
  hypr-plugin-dir = pkgs.symlinkJoin {
    name = "hyrpland-plugins";
    paths = with hyprPluginPkgs; [
      csgo-vulkan-fix
      #...plugins
    ];
  };
in
{
  environment.sessionVariables = {
    HYPR_PLUGIN_DIR = hypr-plugin-dir;
  };
}
