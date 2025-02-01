{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
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

  outputs = { nixpkgs, ...  }@inputs:
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
            ./system/default.nix
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
