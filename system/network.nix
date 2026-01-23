{
  inputs,
  config,
  pkgs,
  ...
}:
{
  # Enable networking
  # networking.networkmanager.enable = true;

  # systemd.services."NetworkManager-wait-online" = {
  #   serviceConfig.TimeoutStartSec = "20s";
  # };

  networking = {
    useDHCP = false;
    # interfaces.enp5s0.useDHCP = true;
    # useDHCP = true;
    hostName = "nixos";
    wireless = {
      enable = true;
      userControlled = true;
    };
	interfaces.enp0s20f0u11 = {
		ipv4.addresses = [
			{
				address = "192.168.1.100";
				prefixLength = 24;
			}
		];
		mtu = 1500;
	};
    # interfaces.enp6s0f0 = {
    #   ipv4.addresses = [
    #     {
    #       address = "10.29.90.100";
    #       prefixLength = 22;
    #     }
    #   ];
    #   mtu = 1500;
    # };

    defaultGateway = {
      address = "192.168.1.1";
      interface = "enp0s20f0u11";
    };

    nameservers = [ "1.1.1.1" ];
    # search = [ "lan.xbazzi.com" ];
    hosts = {
      "127.0.0.1" = [ "localhost" ];
      # "10.29.90.100" = [ "nixos" ];
    };
  };
  #systemd.network.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
