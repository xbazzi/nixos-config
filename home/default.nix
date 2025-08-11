{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  imports = [
    # inputs.hyprshell.homeManagerModules.default
    ./home.nix
    ./yazi.nix
    ./bash.nix
    ./gtk.nix
    ./tmux.nix
    ./starship.nix
    #./vscode.nix
    ./packages.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./notify.nix
    # ./waybar.nix
    # ./dconf.nix
    # ./quickshell.nix
    # ./hyprpanel.nix
    ./hyprpanel3.nix
    ./hyprpaper.nix
    ./git.nix
    ./hyprland.nix
    ./zsh.nix
    ./variables.nix
    ./kitty.nix
    ./neovim.nix
  ];
}
