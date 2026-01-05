{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = 
    inputs@{
        self,
      nix-darwin,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [ 
        vim
        nixfmt
        neovim
        raycast
        git
        hello
        direnv
      ];

      # User 
      system.primaryUser = "xbazzi";
      users.users.xbazzi = {
        name = "xbazzi";
        home = "/Users/xbazzi"; # Note: On macOS, it's `/Users`, not `/home`
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      nixpkgs.config.allowUnfree = true;
      # nixpkgs.overlays = [
      #   inputs.neovim-nightly-overlay.overlays.default
      #   myNodeOverlay
      # ];

      system.defaults = {
        NSGlobalDomain = {
          KeyRepeat = 4;
          InitialKeyRepeat = 10;
          AppleInterfaceStyle = "Dark";
          ApplePressAndHoldEnabled = false;
        };

        dock = {
          autohide = true;
          mru-spaces = false;
        };

        finder = {
          FXPreferredViewStyle = "NLsv";
          NewWindowTarget = "Home";
          ShowPathbar = true;
        };
    };

    # home-manager = {
    #   useGlobalPkgs = true;
    #   extraSpecialArgs = {
    #     inherit inputs;
    #   };
    #   users = {
    #     "xbazzi" = {
    #       # imports = [
    #       #   ./home.nix
    #       # ];
    #     };
    #   };
    # };

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mac
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [
        stylix.darwinModules.stylix
        # home-manager.darwinModules.home-manager
        configuration
      ];
    };
  };
}
