{ config, pkgs, ... }:

{

  programs.yazi = {
    enable = true;
    settings = {
      yazi = {
        ratio = [
          1
          4
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };

      # tasks = {
      #   micro_workers = 5;
      #   macro_workers = 10;
      #   bizarre_retry = 5;
      # };
    };
  };
}
