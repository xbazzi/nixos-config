{ config, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;

    settings = {
      X11Forwarding = true;
    };
  };
  # services.udev.packages = [ pkgs.gnome-settings-daemon ];
}
