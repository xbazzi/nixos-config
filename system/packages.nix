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
    #discord-canary
    vesktop
    cudaPackages_12.cudatoolkit
    python3
    gimp
    vlc
    xclip
    gparted
    htop
    btop
    yazi
  ];

  programs.thunderbird.enable = true;
  # Install firefox.
  programs.noisetorch.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
