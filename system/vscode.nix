{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "claude-code"
  ];
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions =
        with vscode-extensions;
        [
          redhat.vscode-yaml
          redhat.ansible
          ms-python.python
          ms-azuretools.vscode-docker
          ms-vscode-remote.remote-ssh
          golang.go
          ms-vscode.cpptools
          ms-vsliveshare.vsliveshare
          ms-python.python
          vscodevim.vim
          enkia.tokyo-night
          yzhang.markdown-all-in-one
          vscode-icons-team.vscode-icons
          ms-vscode-remote.remote-containers
          bmewburn.vscode-intelephense-client
          zxh404.vscode-proto3
          twxs.cmake
          tamasfe.even-better-toml
          # anthropic.claude-code
          
          # Use the nix-ide instead
          #  arrterian.nix-env-selector
          #  bbenoist.nix
          jnoortheen.nix-ide
          
          # Neither works
          # TheQtCompany.qt-qml
          # bbenoist.qml
          mkhl.direnv
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "claude-code";
            publisher = "anthropic";
            version = "1.0.80";
            sha256 = "WNm29AUas6ZmMC2odIs1wBNknG3DL1T2jXQChpvqTLA=";
          }
          # {
          #   name = "QML";            # keep exact Marketplace name
          #   publisher = "bbenoist";
          #   version = "1.7.1";       # or di current version
          #   sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
          # }
          {
            name = "remote-ssh-edit";
            publisher = "ms-vscode-remote";
            version = "0.47.2";
            sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
          }
          #  {
          #    name = "sukumo28.wav-preview";
          #    publisher = "sukumo28";
          #    version = "2.6.0";
          #    sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
          #  }

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
          {
            name = "vscode-postgres";
            publisher = "ckolkman";
            version = "1.4.3";
            sha256 = "OCy2Nc35vmynoKxoUoTL2qyUoiByTMMPebEjySIZihQ=";

          }
        ];
    })
  ];
}
