{ config, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;

    settings = {
      X11Forwarding = true;
    };
  };
}
