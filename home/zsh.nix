

{ inputs, pkgs, lib, config, ...  }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      export TERM=xterm-kitty
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

      function makerole() {
        mkdir -p "roles/$1/tasks"
        mkdir -p "roles/$1/defaults"
        mkdir -p "roles/$1/templates"
        mkdir -p "roles/$1/handlers"
        touch "roles/$1/tasks/main.yml"
        touch "roles/$1/defaults/main.yml"
      }

      function ansible-edit() {
        ROOT_DIR="$HOME/repos/ansible-on-prem/inventory"
        FINAL_PATH=$(find $ROOT_DIR -name "*$1*.yml" -type f)

        EDITOR='code --wait' \
          ansible-vault edit "$FINAL_PATH" \
          --vault-password-file "$HOME/.ansible-vault-key"
        # case "$1" in
        #   group_vars)
        #     EDITOR='code --wait'\
        #     ansible-vault edit \
        #     /home/xbazzi/repos/ansible-on-prem/inventory/group_vars/all.yml
        #     ;;
        #   hosts)
        #     EDITOR='code --wait'\
        #     ansible-vault edit \
        #     /home/xbazzi/repos/ansible-on-prem/inventory/hosts.yml
        #     ;;
        #   pve1)
        #     EDITOR='code --wait'\
        #     ansible-vault edit \
        #     /home/xbazzi/repos/ansible-on-prem/inventory/host_vars/pve1.yml
        #     ;;
        #   pve2)
        #     EDITOR='code --wait'\
        #     ansible-vault edit \
        #     /home/xbazzi/repos/ansible-on-prem/inventory/host_vars/pve2.yml
        #     ;;
        #   pve3)
        #     EDITOR='code --wait'\
        #     ansible-vault edit \
        #     /home/xbazzi/repos/ansible-on-prem/inventory/host_vars/pve3.yml
        #     ;;
        #   prod3)
        #     EDITOR='code --wait'\
        #     ansible-vault edit \
        #     /home/xbazzi/repos/ansible-on-prem/inventory/host_vars/prod3.yml
        #     ;;
        #   *)
        #     echo "Usage: ansible-edit {group_vars|hosts|pve1|pve2|pve3}"\
        #     return 1
        #     ;;
        # esac
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
        ls="eza -lh --group-directories-first --icons";
        clipboard="xclip -selection clipboard";
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
        edit-groupvars = "EDITOR='code --wait' ansible-vault edit /home/xbazzi/repos/ansible-on-prem/inventory/group_vars/all.yml";
        edit-hosts = "EDITOR='code --wait' ansible-vault edit /home/xbazzi/repos/ansible-on-prem/inventory/hosts.yml";
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
