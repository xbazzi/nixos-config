{ ... }:
{
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
}
