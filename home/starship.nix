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

    settings = {
      format = " $time $all ";
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
  };
}
