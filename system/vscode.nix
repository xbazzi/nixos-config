{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions =
        with vscode-extensions;
        [
          ms-python.python
          ms-azuretools.vscode-docker
          ms-vscode-remote.remote-ssh
          ms-vscode.cpptools
          ms-vsliveshare.vsliveshare
          ms-python.python
          ms-vscode-remote.remote-containers
          ms-vscode.cmake-tools
          ms-vscode.hexeditor
          redhat.vscode-yaml
          redhat.ansible
          vscodevim.vim
          enkia.tokyo-night
          yzhang.markdown-all-in-one
          vscode-icons-team.vscode-icons
          bmewburn.vscode-intelephense-client
          zxh404.vscode-proto3
          twxs.cmake
          tamasfe.even-better-toml
          formulahendry.code-runner
          jnoortheen.nix-ide
          mkhl.direnv
          eamodio.gitlens
          mhutchie.git-graph
          johnpapa.winteriscoming
          github.copilot
          github.copilot-chat
          bierner.github-markdown-preview
          xaver.clang-format
          vue.volar
          rust-lang.rust-analyzer
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "zeonica";
            publisher = "andrewvallette";
            version = "2.0.0";
            sha256 = "TzUheviS3adcirSN6XlW9toa+Jo7Lds/XexxwWdZtyg=";
          }
          {
            name = "vscode-pets";
            publisher = "tonybaloney";
            version = "1.35.0";
            sha256 = "TWWoJ0dBwEHnbi16d0/sBodqg9l92TIzxZYvXTjxNpY=";
          }
          {
            name = "brainrot-stimulation";
            publisher = "SuryaDantuluri";
            version = "0.0.5";
            sha256 = "HJl2GDRhOaxFTATBr/RqGCcOMWU16ShrqBWcRw8jaS4=";
          }
          {
            name = "chatgpt";
            publisher = "openai";
            version = "26.506.31421";
            sha256 = "mLiZu7yYlOa4yvsgJH9zMziiHh6uTu8BM837Sg9+ZL8=";
          }
          {
            name = "ml-language-support";
            publisher = "valcioffi";
            version = "1.1.1";
            sha256 = "WBwvH7jbeWy+0P30XQbyUtSIZqglfYFtn4ayTGgpyOs=";
          }
          {
            name = "cs128-clang-tidy";
            publisher = "cs128";
            version = "0.5.1";
            sha256 = "FCIizR4R1sJiifs7V4j50lMSrMZChrKV05CN8c0cWbg=";
          }
          {
            name = "Doxygen";
            publisher = "bbenoist";
            version = "1.0.0";
            sha256 = "FhH+pi2lVD7pZJMa4znJDz3S7Zqw8ltpYUMqW4FZlE0=";
          }
          {
            name = "doxdocgen";
            publisher = "cschlosser";
            version = "1.4.0";
            sha256 = "InEfF1X7AgtsV47h8WWq5DZh6k/wxYhl2r/pLZz9JbU=";
          }
          {
            name = "c-cpp-definition-generator";
            publisher = "reignofwebber";
            version = "0.0.2";
            sha256 = "WoMeL41HB/URCKqqnK09s2Y2e72ffnYeckBcRCEg2dE=";
          }
          {
            name = "remote-ssh-edit";
            publisher = "ms-vscode-remote";
            version = "0.47.2";
            sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
          }
          {
            name = "better-cpp-syntax";
            publisher = "jeff-hykin";
            version = "1.27.1";
            sha256 = "GO/ooq50KLFsiEuimqTbD/mauQYcD/p2keHYo/6L9gw=";

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

          {
            name = "claude-code";
            publisher = "anthropic";
            version = "2.1.139";
            sha256 = "QxiPr1p0QPN4lXZQJlrl5sZLx6zcOSqoPUCvRNoutKk=";
          }
        ];
    })
  ];
}
