{ pkgs, lib, inputs, ... }:
{
  environment.systemPackages = [
    pkgs.sbctl
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
