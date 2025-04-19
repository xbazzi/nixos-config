{ config, pkgs, ... }:

{
  imports =
    [ 
      ./configuration.nix
      ./fonts.nix
      ./ssh.nix
      # ./openrgb.nix
      # ./stylix.nix
      ./gnome.nix
      # ./lanzaboote.nix
      ./yazi.nix
      ./nvidia.nix
      ./network.nix
      ./net-drives.nix
      ./packages.nix
      ./services.nix
      ./vscode.nix
      ./cachix.nix
    ];
}
