{ inputs, pkgs, lib, config, ...  }:

{
  imports = [
    ./home.nix
    ./bash.nix
    ./gtk.nix
    ./tmux.nix
    ./starship.nix
    #./vscode.nix
    ./packages.nix
    ./waybar.nix
    ./dconf.nix
    ./git.nix
    ./hyprland.nix
    ./zsh.nix
    ./variables.nix
    ./kitty.nix
    ./neovim.nix
  ];
}