{ inputs, pkgs, ... }:

{
  home.packages =
    with pkgs;
    [
      hello
      tmux
      gnome-keyring
      libsecret
      grim # for screenshots
      slurp # for selecting area
      grimblast # easier syntax for grim+slurp
      (flameshot.override { enableWlrSupport = true; })
      wl-clipboard # copy screenshot to clipboard
      bat
      yazi
      jetbrains.datagrip

      # Hyprland
      hypridle
      hyprlock
      hyprpanel
      wofi

      devenv

      # Cursor
      adwaita-icon-theme

      # mikrotik
      winbox

      #serial
      picocom

      # Python
      python3Packages.gpustat

    ]
    ++ [ inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww ];

  services.gnome-keyring = {
    enable = true;
    components = [ "secrets" ];
  };
}
