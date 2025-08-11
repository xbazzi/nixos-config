{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
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
