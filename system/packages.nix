{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # Vibrance
    libvibrant

    claude-code
    gnumake
    ansible
    sbctl
    vim
    wget
    xournalpp
    zathura
    obsidian
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    git
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
    prismlauncher
    inetutils
    ansible-builder
    nix-index
    ansible-lint
    hollywood
    cmatrix
    nmap
    brave
    ffmpeg-full
    variety
    fzf
    eza
    perf
    minicom
    wireshark
    trash-cli
    openssl
    tree
    screenkey
    jq
    nixfmt
    unzip
    nettools
    vibrantlinux
    wpa_supplicant_gui
    element-desktop

    remmina

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
    stm32cubemx

    deadlock-mod-manager
    pulseaudio
    ntfs3g
    man-pages
    man-pages-posix

    amdgpu_top
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

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamemode.enable = true;
  hardware.wooting.enable = true;
}
