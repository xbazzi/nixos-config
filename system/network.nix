{ inputs, config, pkgs, ...  }:
{
  # Enable networking
  # networking.networkmanager.enable = true;


  # systemd.services."NetworkManager-wait-online" = {
  #   serviceConfig.TimeoutStartSec = "20s";
  # };

  networking = {
    hostName = "nixos";
    wireless.enable = false;
    interfaces.enp6s0f0 = {
      ipv4.addresses = [{
        address = "10.29.90.100";
        prefixLength = 22;
      }];
      mtu = 9000;
    };
    defaultGateway = {
      address = "10.29.90.1";
      interface = "enp6s0f0";
    };
    nameservers = [ "10.29.90.1" ];
    search = [ "lan.xbazzi.com" ];
    hosts = {
      "127.0.0.1" = [ "localhost" ];
      "10.29.90.100" = [ "nixos" ];
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
