{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ./fonts.nix
    ./ssh.nix
    # ./openrgb.nix
    # ./stylix.nix
    # ./gnome.nix
    # ./lanzaboote.nix
    ./nvidia.nix
    ./network.nix
    ./nfs.nix
    ./packages.nix
    ./services.nix
    ./vscode.nix
    ./cachix.nix
  ];
}
