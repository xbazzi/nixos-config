{ inputs, pkgs, lib, config, ...  }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = pkgs.lib.importTOML ./xbazzi_starship.toml;
      # username = {
      #   style_user = "blue bold";
      #   style_root = "red bold";
      #   format = "[$user]($style) ";
      #   disabled = false;
      #   show_always = true;
      # };
      # hostname = {
      #   ssh_only = false;
      #   ssh_symbol = "🌐 ";
      #   format = "on [$hostname](bold red) ";
      #   trim_at = ".local";
      #   disabled = false;
      # };
  };
  # home.sessionVariables = {
  #   STARSHIP_CONFIG = "/home/xbazzi/.config/starship.toml";
  # };
}
