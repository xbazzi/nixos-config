{ config, pkgs, ... }:

{
    programs.ssh.extraConfig = ''
        Host prod1
        HostName prod1
        ForwardAgent yes
        Port 22222
        User xbazzi
        PubkeyAuthentication yes
        IdentityFile ~/.ssh/lan_id_ed25519

        Host nas-mgmt
        HostName nas-mgmt
        ForwardAgent yes
        User xbazzi
        IdentityFile ~/.ssh/lan_id_ed25519

        Host nas
        HostName nas
        User xbazzi
        IdentityFile ~/.ssh/lan_id_ed25519

        Host school
        HostName school
        ForwardAgent yes
        User xbazzi
        IdentityFile ~/.ssh/lan_id_ed25519

        Host ext1-mgmt
        HostName ext1-mgmt
        ForwardAgent yes
        User xbazzi
        IdentityFile ~/.ssh/lan_id_ed25519
    '';
}