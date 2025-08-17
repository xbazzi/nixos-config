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
      "_netdev"
      "rw"
      "vers=4"

      # On-demand mount (recommended): mounts when first accessed
      "x-systemd.automount"
      # "noauto"                         # optional but fine with automount

      # Make sure network is really up before trying
      # "x-systemd.after=network-online.target"
      # "x-systemd.requires=network-online.target"

      # Quality-of-life
      # "x-systemd.mount-timeout=30s"
      # "x-systemd.idle-timeout=600"     # unmount after 10min idle (automount only)
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
