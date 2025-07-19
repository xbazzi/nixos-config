{ config, pkgs, ... }:

{

  fileSystems."/mnt/os-images" = {
    device = "nas:/mnt/ALEXANDRIA/os-images";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
      "rw"
      "vers=4"
    ];
  };

  fileSystems."/docker-shared" = {
    device = "nas:/mnt/ALEXANDRIA/docker-shared";
    fsType = "nfs";
    options = [
      "auto"
      "rw"
      "vers=4"
    ];
  };

  fileSystems."/mnt/media" = {
    device = "nas:/mnt/ALEXANDRIA/media";
    fsType = "nfs";
    options = [
      "noauto"
      "rw"
      "vers=4"
    ];
  };

  fileSystems."/mnt/school" = {
    device = "nas:/mnt/ALEXANDRIA/school";
    fsType = "nfs";
    options = [
      "noauto"
      "rw"
      "vers=4"
    ]; 
  };
}
