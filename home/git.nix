{ inputs, pkgs, lib, config, ...  }:

{
  programs.git = {
    enable = true;
    userName = "xbazzi";
    userEmail = "codemaster@xbazzi.com";
    aliases = {
      gs = "status";
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
  };
}
