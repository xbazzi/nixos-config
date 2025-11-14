{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.git = {
    enable = true;
    settings = {
      core.editor = "nvim";
      pull.rebase = false;
      init.defaultBranch = "master";
      user.name = "xbazzi";
      user.email = "codemaster@xbazzi.com";
      aliases = {
        gs = "status";
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };
  };
}
