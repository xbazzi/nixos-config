{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    # legacyPackages.${pkgs.system}.claude-code
    kitty
    btop
    hello
    tmux
    gnome-keyring
    libsecret
    grim # for screenshots
    slurp # for selecting area
    grimblast # easier syntax for grim+slurp
    wl-clipboard # copy screenshot to clipboard
    bat
    yazi
    jetbrains.datagrip

    # Hyprland
    hypridle
    hyprlock
    hyprpanel
    wofi

    # Python
    python3Packages.gpustat
  ];
  services.gnome-keyring.enable = true;
}
