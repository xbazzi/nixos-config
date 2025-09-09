{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.waycast.overlays.default ];

  programs.waycast = {
    enable = true;
  };
}