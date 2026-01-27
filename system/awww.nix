{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];
}
