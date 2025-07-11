{ config, pkgs, ... }:

{
    programs.ssh.extraConfig = ''
        Host fw-mgmt
            HostName fw-mgmt
            ForwardAgent yes
            User xbazzi
            Port 22
            PubkeyAuthentication yes
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host db1
            HostName db1
            ForwardAgent yes
            User xbazzi
            Port 22
            PubkeyAuthentication yes
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host prod1
            HostName prod1
            ForwardAgent yes
            Port 22222
            User xbazzi
            PubkeyAuthentication yes
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host prod3
            HostName prod3
            ForwardAgent yes
            Port 22
            User xbazzi
            PubkeyAuthentication yes
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host nas-mgmt
            HostName nas-mgmt
            ForwardAgent yes
            User xbazzi
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host nas
            HostName nas
            ForwardAgent yes
            User xbazzi
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host school
            HostName school
            ForwardAgent yes
            User xbazzi
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host ext1-mgmt
            HostName ext1-mgmt
            ForwardAgent yes
            User xbazzi
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes
    '';
}