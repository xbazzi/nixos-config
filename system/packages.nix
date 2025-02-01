{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim 
    wget
    xournalpp
    obsidian
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    kitty
    git
    fastfetch
    wget
    discord-canary
    cudaPackages_12.cudatoolkit
    python3
    gimp
    vlc
    xclip
    gparted
    htop
  ];

  # Install firefox.
  programs.noisetorch.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
