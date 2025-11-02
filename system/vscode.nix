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
          # golang.go
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
          ms-vscode.cmake-tools
          tamasfe.even-better-toml
          formulahendry.code-runner
          jnoortheen.nix-ide
          mkhl.direnv
          # llvm-vs-code-extensions.vscode-clangd
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "remote-ssh-edit";
            publisher = "ms-vscode-remote";
            version = "0.47.2";
            sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
          }
          {
            name = "better-cpp-syntax";
            publisher = "jeff-hykin";
            version = "1.0.0";
            sha256 = "+TO/0spMGHKciWK8jd2kt+S4eNgQytpOkMYvv1av9KU=";

          }
          {
            name = "cpp-boilerplate-code";
            publisher = "RajorshiGhosh";
            version = "1.0.0";
            sha256 = "CysAp7wTEVMfPWbySstqeBcPTG0F2Mm9pRfXvdghkWE=";

          }
          {
            name = "cmantic";
            publisher = "tdennis4496";
            version = "0.9.0";
            sha256 = "bG4iNM1lLKoUWy0D+3z+zd+Vox+BcXEm/sdtcSQFYfY=";

          }
          {
            name = "c-cpp-compile-run";
            publisher = "danielpinto8zz6";
            version = "1.0.65";
            sha256 = "qsuIvRkL7/BxXP/4xdFUb9rwUYh1mO40wvK/KEcoyi0=";
          }
          {
            name = "cpp-reference";
            publisher = "Guyutongxue";
            version = "0.2.5";
            sha256 = "WpNh9A04RlHBurA4V16kWh3njnf9RdlUOEYLJ62sj3Q=";
          }
          # {
          #   name = "cpp-reference-and-documentation";
          #   publisher = "FederAndInk";
          #   version = "0.0.5";
          #   sha256 = "/5Znf9QvAQN65mZxniRVycfaktjht+mwODhqBueVGU8=";

          # }
          
          # {
          #   name = "claude-code";
          #   publisher = "anthropic";
          #   version = "1.0.80";
          #   sha256 = "WNm29AUas6ZmMC2odIs1wBNknG3DL1T2jXQChpvqTLA=";
          # }
          # {
          #   name = "stm32cube-ide-build-cmake";
          #   publisher = "stmicroelectronics";
          #   version = "1.42.2";
          #   sha256 = "E/GbVK7Er9r7P69fNvP0noptr13Lv3zslb9ch2NC1P0=";
          # }
          # {
          #   name = "stm32cube-ide-build-analyzer";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.2";
          #   sha256 = "iaCoSvO8TyOoPhzP3AoLoFt2RdPdNi3qhdb0oIa0E+Y=";
          # }
          # {
          #   name = "stm32cube-ide-debug-core";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.2";
          #   sha256 = "eHT6DZSFIFa69dhWEWAJQJexVknyWMpIBsaVkOLAxNM=";
          # }
          # {
          #   name = "stm32cube-ide-debug-core";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.2";
          #   sha256 = "eHT6DZSFIFa69dhWEWAJQJexVknyWMpIBsaVkOLAxNM=";
          # }
          
          # {
          #   name = "stm32cube-ide-clangd";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.1";
          #   sha256 = "nVXMeGxeYw+5ABZP1BTOp/lP/Rcmn0l2H35gwOIEHZI=";
          # }
          # {
          #   name = "stm32cube-ide-bundles-manager";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.2";
          #   sha256 = "cAdybkqiBQ0qA25kbCUzb/WlN1Rk3VRO6b61V8j+1dQ=";
          # }
          # {
          #   name = "stm32cube-ide-registers";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.2";
          #   sha256 = "axK9ox+SpBcXXXRcgp+tDMzMab+widDePvj+GgVWjAw=";
          # }
          # {
          #   name = "stm32cube-ide-debug-stlink-gdbserver";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.2";
          #   sha256 = "xppI+GLI/4fuGzWI7F3teDxw/czriOyzkyEmxfIeHDo=";
          # }
          # {
          #   name = "stm32cube-ide-debug-generic-gdbserver";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.2";
          #   sha256 = "iJ8RHQ+eQszVI/Z13yGD/pdIEZIjir99rnYz6k2oZD8=";
          # }
          
          # {
          #   name = "stm32cube-ide-core";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.3";
          #   sha256 = "wsfDZonPIOQC0z73noWE3TEK6pG+XFB7wuJ1Og1FxQM=";
          # }
          # {
          #   name = "stm32cube-ide-project-manager";
          #   publisher = "stmicroelectronics";
          #   version = "1.0.2";
          #   sha256 = "TeMZvIuJZaRJUZot0oBP36N7lL7eGRAJIL7PiGx69yA=";
          # }
          
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
        ];
    })
  ];
}
