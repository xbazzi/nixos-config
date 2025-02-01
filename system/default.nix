{ config, pkgs, ... }:

{
  imports =
    [ 
      ./configuration.nix
      ./nvidia.nix
      ./network.nix
      ./net-drives.nix
      ./packages.nix
      ./services.nix
    ];
}
