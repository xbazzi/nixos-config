{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprshell = {
      url = "git+https://gitgud.foo/thegrind/hypr-shell.git";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # walker = {
    #   url = "github:abenz1267/walker";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprdots = {
    #  url = "github:JaKooLit/Hyprland-Dots";
    #  flake = false;
    # };

    # nixvim = {
    #      url = "github:xbazzi/nixvim";
    #     };

    # nvf = {
    #      url = "github:notashelf/nvf";
    #        inputs.nixpkgs.follows = "nixpkgs";
    #      };

    #stylix.url = "github:danth/stylix";

    # nixvim = {
    #   url = "github:xbazzi/nixvim-config";
    # };
  };

  outputs =
    { nixpkgs, lanzaboote, ... }@inputs:
    let
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
            lanzaboote.nixosModules.lanzaboote
            ./system/default.nix
            (
              { pkgs, lib, ... }:
              {

                environment.systemPackages = [
                  # For debugging and troubleshooting Secure Boot.
                  pkgs.sbctl
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
            inputs.hyprshell.homeManagerModules.default
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
