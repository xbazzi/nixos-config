{ config, pkgs, ... }:

{
  imports = [
    ./lanzaboote.nix
    ./configuration.nix
    ./fonts.nix
    ./ssh.nix
    ./stylix.nix
    ./ghub.nix
    ./flatpak.nix
    ./awww.nix
    ./amd.nix
    ./network.nix
    ./nfs.nix
    ./packages.nix
    ./services.nix
    ./vscode.nix
    ./cachix.nix
    ./obs.nix
  ];
}
