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

        Host db1-mgmt
            HostName db1-mgmt
            ForwardAgent yes
            User xbazzi
            Port 22
            PubkeyAuthentication yes
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host gitgud.foo
            HostName prod1.lan.xbazzi.com
            User git
            Port 2222
            PubkeyAuthentication yes
            ForwardAgent yes
            IdentitiesOnly yes
            IdentityFile ~/.ssh/gt_id_ed25519

        Host prod1
            HostName prod1
            ForwardAgent yes
            Port 22222
            User xbazzi
            PubkeyAuthentication yes
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host prod3-mgmt
            HostName prod3-mgmt 
            ForwardAgent yes
            Port 22
            User xbazzi
            PubkeyAuthentication yes
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host prod2-mgmt
            HostName prod2-mgmt
            ForwardAgent yes
            Port 22
            User xbazzi
            PubkeyAuthentication yes
            IdentityFile ~/.ssh/lan_id_ed25519
            IdentitiesOnly yes

        Host prod2
            HostName prod2
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