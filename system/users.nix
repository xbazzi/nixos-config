{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;

  users.users.xbazzi = {
    isNormalUser = true;
    description = "Xander Bazzi";
    extraGroups = [
      "seat"
      "xbazzi"
      "video"
      "render"
      "docker"
      "networkmanager"
      "wheel"
      "wireshark"
      "wpa_supplicant"
    ];
  };
}
