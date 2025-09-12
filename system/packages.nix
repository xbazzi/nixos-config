{ config, lib, pkgs, system, inputs, ... }:
{
  environment.systemPackages = with pkgs; [


    # (inputs.nixpkgs.legacyPackages.${pkgs.system}.claude-code)
    # modrinth-app
    claude-code
    gnumake
    ansible
    niv
    sbctl
    vim
    wget
    xournalpp
    zathura
    obsidian
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    # kitty
    git
    fastfetch
    wget
    vesktop
    discord
    cudaPackages_12.cudatoolkit
    python3
    python313Packages.pip
    gimp
    vlc
    xclip
    gparted
    qalculate-gtk
    htop
    dig
    # netstat-net-tools
    prismlauncher
    inetutils
    ansible-builder
    nix-index
    ansible-lint
    hollywood
    cmatrix
    nmap
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
    direnv
    jq
    nixfmt
    unzip
    nettools
    vibrantlinux

    # Hyprland Ecosystem
    hyprpaper
    hyprpicker
    hyprpolkitagent
    hyprsunset
    (pkgs.hyprland.override {
      enableXWayland = true;
      withSystemd = true;
    })
    gamescope
    google-chrome
    wootility
    flatpak

    # Qt
    # kdePackages.qt5compat
    # libsForQt5.qt5.qtgraphicaleffects
    # libsForQt5.qt5.qtdeclarative
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "claude-code"
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
  programs.gamemode.enable = true;
  hardware.graphics.enable = true;
  hardware.wooting.enable = true;
  #     "steam"
  #     "steam-original"
  #     "steam-unwrapped"
  #     "steam-run"
  #   ];
}
