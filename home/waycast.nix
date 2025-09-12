{
  pkgs,
  config,
  inputs,
  ...
}:

{
  nixpkgs.overlays = [ inputs.waycast.overlays.default ];

  programs.waycast = {
    enable = true;
    settings = {
      plugins.file_search = {
        search_paths = [
        ];
      };
      plugins.projects = {
        open_command = "code -n {path}";
        search_paths = [
          "/home/xbazzi/repos"
        ];
      };
    };
  };
}