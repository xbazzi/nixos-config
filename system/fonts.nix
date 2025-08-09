{ config, pkgs, ... }:

{
  fonts.packages =
    with pkgs;
    [
      nerd-fonts.fira-code
      nerd-fonts.sauce-code-pro
      # nerd-fonts._Oxproto
      nerd-fonts.space-mono
      nerd-fonts.droid-sans-mono
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      monaspace
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
