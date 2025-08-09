{ config, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    forwardX11 = true;
  };
  # services.udev.packages = [ pkgs.gnome-settings-daemon ];
}
