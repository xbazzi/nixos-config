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
    discord
    cudaPackages_12.cudatoolkit
    python3
    gimp
    vlc
    xclip
    gparted
    htop
    btop
    yazi
    dig
    prismlauncher
    inetutils
    hollywood
    cmatrix
    nmap
    #intellephense
    firefoxpwa
    ffmpeg
    variety
    fzf
    eza
    linuxPackages_latest.perf
    minicom
  ];

  programs.nix-ld.enable = true;
  programs.thunderbird.enable = true;
  # Install firefox.
  programs.noisetorch.enable = true;

  # Install firefox.
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Install Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #     "steam"
  #     "steam-original"
  #     "steam-unwrapped"
  #     "steam-run"
  #   ];
}
