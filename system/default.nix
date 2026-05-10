{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ./fonts.nix
    ./ssh.nix
    ./stylix.nix
    ./ghub.nix
    # ./sddm.nix
    # ./hyprland-plugins.nix
    ./flatpak.nix
    ./awww.nix
    ./nvidia.nix
    ./network.nix
    ./nfs.nix
    ./packages.nix
    ./services.nix
    ./vscode.nix
    ./cachix.nix
  ];
}
