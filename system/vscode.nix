{ inputs, pkgs, lib, config, ...  }:

{
 environment.systemPackages = with pkgs; [
   (vscode-with-extensions.override {
     vscodeExtensions = with vscode-extensions; [
       bbenoist.nix
       ms-python.python
       ms-azuretools.vscode-docker
       ms-vscode-remote.remote-ssh
       golang.go
       ms-vscode.cpptools
       ms-vsliveshare.vsliveshare
       bbenoist.nix
       ms-python.python
       vscodevim.vim
       enkia.tokyo-night
       yzhang.markdown-all-in-one
       vscode-icons-team.vscode-icons
     ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
       {
         name = "remote-ssh-edit";
         publisher = "ms-vscode-remote";
         version = "0.47.2";
         sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
       }
       # {
       #   name = "vsliveshare";
       #   publisher = "ms-vsliveshare";
       #   version = "1.0.5948"; # replace with the latest version
       #   sha256 = "KOu9zF5l6MTLU8z/l4xBwRl2X3uIE15YgHEZJrKSHGY="; # replace with the calculated hash
       # }
       {
         name = "glassit";
         publisher = "s-nlf-fh";
         version = "0.2.6";
         #sha256 = "lcaomgk91hnjwqaw4i0fagtowr8kwv7zhvgcgkokkuy=";
         sha256 = "LcAomgK91hnJWqAW4I0FAgTOwr8Kwv7ZhvGCgkokKuY=";
       }
     ];
   })
 ];
}
