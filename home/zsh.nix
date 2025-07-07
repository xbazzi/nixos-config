

{ inputs, pkgs, lib, config, ...  }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      bindkey -e
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
      function repos() {
          eza -ld ~/repos/* --color=never | \
          awk '{print $7}' | \
          fzf --reverse | xargs -I{} code {} -n && exit
      }
      function home() {
          eza -ld ~/* --color=never | \
          awk '{print $7}' | \
          fzf --reverse | xargs -I{} code {} -n && exit
      }
    '';
    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    shellAliases =
      let
        flakePath = "~/nixos-config";
      in
      {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
        la = "ls -lAth";
        lr = "ls -ltr";
        rebuild = "sudo nixos-rebuild switch --flake ${flakePath}";
        hms = "home-manager switch --flake ${flakePath}";
        config = "nvim ~/nix/configuration.nix";
        homecfg = "nvim ~/nix/home.nix";
        vi = "vim ";
        sudo = "sudo ";
      };

    # plugins = [
    #   #{
    #   #  name = "powerlevel10k";
    #   #  src = pkgs.zsh-powerlevel10k;
    #   #  file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    #   #}
    #   # {
    #   #   name = "powerlevel10k-config";
    #   #   src = ./p10k-config;
    #   #   file = ".p10k.zsh";
    #   # }
    # ];

    #histSize = 10000;
    #  oh-my-zsh = {
    #    enable = true;
    #    plugins = [ "git" "thefuck" ];
    #    theme = "";
    #  };
    # zplug = {
    #   enable = true;
    #   plugins = [
    #     { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
    #      #{ name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
    #    ];
    #  };
  };
}
