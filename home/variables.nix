{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nixxer/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
    XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
    EDITOR = "nvim";
    # TERM = "xterm-kitty";
  };
    xdg = {
    enable = true;
    configFile."user-dirs.conf" = {
      text = ''
        enabled=True
        filename_encoding=UTF-8
      '';
      force = true; # This forces overwrite of existing content
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      publicShare = "${config.home.homeDirectory}/Public";
      templates = "${config.home.homeDirectory}/Templates";
      videos = "${config.home.homeDirectory}/Videos";
    };

    # TODO: Move the http handler to a browser.nix
    #   # File/app associations
    #   mimeApps = {
    #     enable = true;
    #     defaultApplications = {
    #       "text/html" = "brave.desktop";
    #       "x-scheme-handler/http" = "brave.desktop";
    #       "x-scheme-handler/https" = "brave.desktop";
    #       "x-scheme-handler/about" = "brave.desktop";
    #       "x-scheme-handler/unknown" = "brave.desktop";
    #       "application/pdf" = "org.gnome.Evince.desktop";
    #       "text/plain" = "code.desktop";
    #       "application/json" = "code.desktop";
    #       "application/javascript" = "code.desktop";
    #       "text/x-php" = "code.desktop";
    #     };
    #   };
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
