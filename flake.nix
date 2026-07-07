{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    awww = {
      url = "git+https://codeberg.org/LGFae/awww";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    nixcord = {
      url = "github:FlameFlag/nixcord";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    waycast = {
      url = "git+https://gitgud.boo/waycasthq/waycast";
    };
  };

  outputs =
    {
      nixpkgs,
      lanzaboote,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      formatter.${system} = pkgs.nixfmt;

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.neovim
          pkgs.vim
        ];
        shellHook = ''
          echo "hello"
        '';
      };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            inputs.stylix.nixosModules.stylix
            inputs.nix-flatpak.nixosModules.nix-flatpak
            lanzaboote.nixosModules.lanzaboote
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.xbazzi = {
                imports = [
                  inputs.waycast.homeManagerModules.default
                  ./home/default.nix
                ];
              };
            }
            ./system/default.nix
          ];
        };
      };
    };
}
