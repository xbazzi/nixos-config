{ inputs, pkgs, lib, config, ...  }:

{
  imports = [
    ./home.nix
    ./bash.nix
    ./tmux.nix
    ./starship.nix
    #./vscode.nix
    ./packages.nix
    ./git.nix
    ./zsh.nix
    ./variables.nix
    ./kitty.nix
    ./neovim.nix
  ];
}
