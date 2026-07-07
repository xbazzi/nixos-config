{
  inputs,
  config,
  pkgs,
  ...
}:
{
  # VPN
  services.openvpn.servers = {
    office = {
      config = "config /home/xbazzi/office.ovpn ";
      updateResolvConf = true;
      autoStart = false;
    };
  };

  networking = {
    resolvconf.enable = true;
    useDHCP = false;
    hostName = "nixos";
    wireless = {
      enable = true;
      userControlled = true;
    };
    interfaces.enp6s0f0 = {
      ipv4.addresses = [
        {
          address = "10.29.90.100";
          prefixLength = 22;
        }
      ];
      mtu = 1500;
      ipv4.routes = [
        {
          address = "10.133.4.0";
          prefixLength = 22;
          via = "10.29.90.1";
        }
        {
          address = "10.69.0.0";
          prefixLength = 22;
          via = "10.29.90.1";
        }
      ];
    };

    defaultGateway = {
      address = "10.29.90.1";
      interface = "enp6s0f0";
    };

    nameservers = [
      "10.29.90.1"
    ];
    search = [ "lan.xbazzi.com" ];
    hosts = {
      "127.0.0.1" = [ "localhost" ];
      "10.29.90.100" = [ "nixos" ];
    };
  };
}
