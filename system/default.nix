{ config, pkgs, ... }:

{
  imports =
    [ 
      ./configuration.nix
      ./fonts.nix
      ./ssh.nix
      # ./stylix.nix
      ./gnome.nix
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
