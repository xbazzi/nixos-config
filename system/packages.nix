{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # modrinth-app
    ansible
    niv
    sbctl
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
    #google-chrome
    dig
    prismlauncher
    inetutils
    ansible-builder
    ansible-lint
    hollywood
    cmatrix
    nmap
    #intellephense
    brave
    ffmpeg
    variety
    fzf
    eza
    linuxPackages_latest.perf
    minicom
    wireshark
    trash-cli
    openssl
    tree
    screenkey
    # firefox
    direnv
    jq

    # Hyprland Ecosystem
    hyprpaper
    hyprpicker
    hyprpolkitagent
    hyprsunset

    (pkgs.hyprland.override {
      enableXWayland = true;
      withSystemd = true;
    })
  ];

  programs.nix-ld.enable = true;
  programs.thunderbird.enable = true;
  # Install noisetorch.
  programs.noisetorch.enable = true;

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
