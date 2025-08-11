{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
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

    # Hyprland
    hypridle
    hyprlock
    hyprpanel
    wofi

    # Python
    python3Packages.gpustat

    # Old stuff for documentation
    # gnomeExtensions.appindicator
    # waybar
    # eww
    # (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    #zsh-powerlevel10k
    #inputs.nixvim.packages.${pkgs.system}.default
  ];
  services.gnome-keyring.enable = true;

}
