{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    # settings = pkgs.lib.importTOML ./xbazzi_starship.toml;
    settings = {

      format = " $time $all ";
      directory = {
        truncation_length = 9;
      };
      php = {
        format = "[$symbol($version )]($style)";
      };

      golang = {
        format = "[$symbol($version )]($style)";
      };

      nodejs = {
        format = "[$symbol($version )]($style)";
      };

      bun = {
        format = "[$symbol($version )]($style)";
      };
      cpp = {
        format = "[$symbol($version )]($style)";
      };
      python = {
        format = "[$symbol$pyenv_prefix($version)( \($virtualenv\) )]($style)";
      };
      time = {
        disabled = false;
        format = "[$time]($style)";

      };
    };


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
