{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  home.username = "xbazzi";
  home.homeDirectory = "/home/xbazzi";

  wayland.windowManager.hyprland.enable = true;

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    targets = {
      btop.enable = true;
      kitty.enable = true;
      # kitty.enable = true;
    };
  };

  programs.command-not-found.enable = false;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".claude/settings.json".text = ''
    # {
    #   "permissions": {
    #     "allow": [
    #       "Bash(npm run lint)",
    #       "Bash(npm run test:*)",
    #       "Read(~/.zshrc)"
    #     ],
    #     "deny": [
    #       "Bash(curl:*)",
    #       "Read(./.env*)",
    #       "Read(./.env.*)",
    #       "Read(./secrets/**)"
    #     ]
    #   },
    # }
    # '';

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.stateVersion = "24.11"; # Please read the comment before changing.
}
