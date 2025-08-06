{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
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

  outputs = { nixpkgs, lanzaboote, ...  }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = "x86_64-linux"; config = { allowUnfree = true; }; };
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
          pkgs.neovim pkgs.vim 
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
            ./system/default.nix
            lanzaboote.nixosModules.lanzaboote

            ({ pkgs, lib, ... }: {

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
            })
          ];
        };
      };

      homeConfigurations = {
        "xbazzi@nixos" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home/default.nix
          ];
        };
      };
      home-manager.useGlobalPkgs = true;

      home-manager.users.xbazzi = {
	nixpkgs.config.allowUnfree = true;
	#home.packages = [
        #];
      };
      #home-manager.extraSpecialArgs
    };
}
