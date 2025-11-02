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
    ./fzf.nix
    #./vscode.nix
    ./packages.nix
    ./desktop-env.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./notify.nix
    # ./waybar.nix
    # ./dconf.nix
    # ./quickshell.nix
    ./hyprpanel.nix
    ./wofi.nix
    ./hyprpaper2.nix
    ./waycast.nix
    ./git.nix
    ./hyprland.nix
    ./zsh.nix
    ./variables.nix
    ./kitty.nix
    ./neovim.nix
  ];
}
