{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };
}
