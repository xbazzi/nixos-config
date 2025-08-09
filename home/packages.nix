{ inputs, pkgs, ...  }:

{
  home.packages = with pkgs; [
    hello
    tmux
    # gnomeExtensions.appindicator
    wofi
    waybar
    # eww
    # gnome-keyring
    libsecret
    grim           # for screenshots
    slurp          # for selecting area
    grimblast      # easier syntax for grim+slurp
    wl-clipboard   # copy screenshot to clipboard
    hypridle
    hyprlock
    # (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    #zsh-powerlevel10k
    #inputs.nixvim.packages.${pkgs.system}.default
  ];
  services.gnome-keyring.enable = true;

}
