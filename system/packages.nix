{
  config,
  lib,
  pkgs,
  system,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # Vibrance
    libvibrant

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
    # linuxPackages_latest.perf
    perf
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
    wpa_supplicant_gui

    # Dev
    cmake
    cmakeWithGui
    gdb

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
    jetbrains.clion
    google-chrome
    wootility
    # flatpak
    stm32cubemx

    # Qt
    # kdePackages.qt5compat
    # libsForQt5.qt5.qtgraphicaleffects
    # libsForQt5.qt5.qtdeclarative
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "claude-code"
    ];

  programs.nix-ld.enable = true;
  programs.thunderbird.enable = true;
  programs.noisetorch.enable = true;

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
}
