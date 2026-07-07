{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
      "xbazzi"
    ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  systemd.network.wait-online.timeout = 5;
  systemd.network.wait-online.enable = true;

  virtualisation.docker.enable = true;

  services.printing.enable = true;
  services.libinput.enable = false;
  services.seatd.enable = true;

  programs.zsh.enable = true;
  programs.direnv.enable = true;
  programs.ssh.startAgent = true;

  environment.sessionVariables = {
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [ "/opt/intel/oneapi/vtune/latest/bin64" ];
  };

  system.stateVersion = "24.11";
}
