{
  description = "My system configuration";

  inputs = {
    # nixpkgs-vscode-old.url = "github:NixOS/nixpkgs/COMMIT_HASH";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprshell = {
    #   url = "git+https://gitgud.foo/thegrind/hypr-shell.git";
    # };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.3";
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

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.hyprland.follows = "hyprland";
    # };

    waycast = {
      url = "github:javif89/waycast";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      lanzaboote,
      ...
    }@inputs:
    let
      overlays = [
      ];
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
        };
      };
      # configModule = {
      #   # Add any custom options (and do feel free to upstream them!)
      #   # options = { ... };

      #       #     config.vim = {
      #       #      theme.enable = true;
      #       #      # and more options as you see fit...
      #       #    };
      # };

    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.neovim
          # pkgs.legacyPackages.x86_64-linux.claude-code
          pkgs.vim
        ];
        shellHook = ''
          	   echo "hello"
          	'';
      };
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs system; };
          modules = [
            inputs.stylix.nixosModules.stylix
            lanzaboote.nixosModules.lanzaboote
            ./system/default.nix
            (
              {
                pkgs,
                lib,
                system ? pkgs.system,
                ...
              }:
              {
                # nixpkgs.overlays =  inputs.waycast.overlays.default;
                environment.systemPackages = [
                  pkgs.sbctl
                  inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
                ];

                # Lanzaboote currently replaces the systemd-boot module.
                # This setting is usually set to true in configuration.nix
                # generated at installation time. So we force it to false
                # for now.
                boot.loader.systemd-boot.enable = lib.mkForce false;

                boot.lanzaboote = {
                  enable = true;
                  pkiBundle = "/var/lib/sbctl";
                };
              }
            )
          ];
        };
      };

      homeConfigurations = {
        "xbazzi@nixos" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            # inputs.walker.homeManagerModules.default
            # inputs.hyprshell.homeManagerModules.default
            inputs.waycast.homeManagerModules.default
            inputs.stylix.homeModules.stylix
            ./home/default.nix
          ];
        };
      };
      home-manager.useGlobalPkgs = true;

      home-manager.users.xbazzi = {
        nixpkgs.config.allowUnfree = true;
        extraSpecialArgs = { inherit inputs; };
        # imports =
      };

      # home-manager.users.xbazzi = {
      #   extraSpecialArgs = { inherit inputs; };
      #   nixpkgs.config.allowUnfree = true;
      #   # imports = inputs.hyprshell.homeManagerModules.default;
      #   #home.packages = [
      #   #];
      # };
      #home-manager.extraSpecialArgs
    };
}
