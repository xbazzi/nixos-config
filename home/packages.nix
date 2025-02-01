{ inputs, pkgs, lib, config, ...  }:

{
  home.packages = with pkgs; [
    hello
    tmux
    gnomeExtensions.appindicator

    #zsh-powerlevel10k
    #inputs.nixvim.packages.${pkgs.system}.default
  ];
}
