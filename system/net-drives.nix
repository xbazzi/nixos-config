
{ config, pkgs, ... }:

{
  # fileSystems."/mnt/media" = {
  #   device = "nas.lan.xbazzi.com:/mnt/ALEXANDRIA/media";
  #   fsType = "nfs";
  # };

  fileSystems."/mnt/os-images" = {
    device = "nas.lan.xbazzi.com:/mnt/ALEXANDRIA/os-images";
    fsType = "nfs";
    options = [
      "rw"
      "vers=4"
    ];
  };

  fileSystems."/mnt/media" = {
    device = "nas.lan.xbazzi.com:/mnt/ALEXANDRIA/media";
    fsType = "nfs";
    options = [
      "rw"
      "vers=4"
    ];
  };

  fileSystems."/mnt/school" = {
    device = "nas.lan.xbazzi.com:/mnt/ALEXANDRIA/school";
    fsType = "nfs";
    options = [
      "rw"
      "vers=4"
    ]; 
  };
}
