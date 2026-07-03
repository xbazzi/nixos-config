{
  inputs,
  ...
}:

{
  # I don't think we need this
  # imports = [ inputs.waycast.homeModules.default ];

  programs.waycast = {
    enable = true;
    settings = {
      plugins.file_search = {
        # waycast already automatically adds Pictures, Documents, Videos, Music
        # search_paths = [
        #   "/home/xbazzi/Pictures"
        # ];
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
