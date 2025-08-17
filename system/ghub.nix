{
  config,
  pkgs,
  inputs,
  ...
}:

{
  boot = {
    kernelModules = [ "uinput" ];
  };

  environment = {
    systemPackages = with pkgs; [
      solaar # Manage logitech mouse
    ];
  };

  hardware = {
    logitech = {
      wireless.enable = true;
      wireless.enableGraphical = true;
    };
  };

  users.users.xbazzi.extraGroups = [
    "input"
    "plugdev"
  ];
}