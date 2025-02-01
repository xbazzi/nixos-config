{ inputs, pkgs, lib, config, ...  }:

{
  home.username = "xbazzi";
  home.homeDirectory = "/home/xbazzi";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.name = "GruvboxPlus";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    #".p10k.zsh".text = builtins.readFile ./.p10k.zsh;

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
