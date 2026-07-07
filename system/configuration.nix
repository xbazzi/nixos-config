{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Graphics
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.amdgpu.opencl.enable = true;
  hardware.amdgpu.legacySupport.enable = true;
  hardware.amdgpu.initrd.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

  services.blueman.enable = true;

  # OpenRGB
  services.hardware.openrgb.enable = true;

  # Hyprland
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  security.pam.services.hyprlock = { };
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gcr-ssh-agent.enable = false;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd start-hyprland";
        user = "greeter";
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  systemd.network.wait-online.timeout = 5;
  systemd.network.wait-online.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "caps:swapescape";
  };

  virtualisation.docker.enable = true;

  services.printing.enable = true;

  programs.zsh.enable = true;

  services.seatd.enable = true;

  users.defaultUserShell = pkgs.zsh;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  systemd.user.services.pipewire-pulse = {
    serviceConfig.PrivateTmp = false;
    environment.LADSPA_PATH = "/tmp";
  };

  services.libinput.enable = false;

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

  programs.direnv.enable = true;

  nix.settings.trusted-users = [
    "root"
    "xbazzi"
  ];

  environment.sessionVariables = rec {
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "/opt/intel/oneapi/vtune/latest/bin64"
    ];
  };

  programs.ssh.startAgent = true;

  system.stateVersion = "24.11";
}
