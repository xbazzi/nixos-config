{
  programs.bash = {
    enable = true;
    shellAliases =
      let
        flakePath = "~/nixos-config";
      in
      {
        la = "ls -lath";
        lr = "ls -ltr";
        rebuild = "sudo nixos-rebuild switch --flake ${flakePath}";
        hms = "home-manager switch --flake ${flakePath}";
        vi = "vim";
        #config = "nvim ~/nix/configuration.nix";
        #homecfg = "nvim ~/nix/home.nix";
      };
  };
}
