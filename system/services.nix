
{ config, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;
  services.udev.packages = [ pkgs.gnome-settings-daemon ];
}
