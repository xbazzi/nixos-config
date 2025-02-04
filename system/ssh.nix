{ config, pkgs, ... }:

{
    programs.ssh.extraConfig = ''
        Host school
            HostName school
            IdentityFile ~/.ssh/lan_ed25519
    '';
}