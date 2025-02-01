{ inputs, config, pkgs, ...  }:
{
  # Enable networking
  networking.networkmanager.enable = true;


  systemd.services."NetworkManager-wait-online" = {
    serviceConfig.TimeoutStartSec = "20s";
  };

  networking = {
    hostName = "nixos";
    wireless.enable = false;
    interfaces.enp6s0d1 = {
      ipv4.addresses = [{
        address = "10.29.90.110";
        prefixLength = 22;
      }];
    };
    nameservers = [ "10.29.90.1" "10.133.7.1" ];
    search = [ "lan.xbazzi.com" ];

    defaultGateway = {
      address = "10.29.90.1";
      interface = "enp6s0d1";
    };

    hosts = {
      "127.0.0.1" = [ "localhost" ];
      "10.29.90.110" = [ "nixos" "nixos.lan.xbazzi.com" ];
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
