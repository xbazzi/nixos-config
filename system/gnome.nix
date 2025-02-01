{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = (with pkgs.gnomeExtensions; [
    blur-my-shell
    pop-shell
    tactile
    pop-shell
    space-bar
    undecorate
    pastafarian-holy-days
    just-perfection
  ]) ++ (with pkgs; [
    # gnome-tweaks
    # adwaita-icon-theme
  ]);
}

