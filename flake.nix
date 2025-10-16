{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixgl, niri-flake, ... }@inputs:
    let
      stateVersion = "25.05";
      user = "cyntrap";
      system = "x86_64-linux"; # change if needed
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nixgl.overlays.default inputs.nur.overlays.default ];
      };
      hosts = builtins.readDir ./hosts;

      hostAttrs = {
        desktop = {
          modules = commonModules ++ graphicalModules ++ waylandModules ++ [
            #other modules here if needed
          ];
        };
        laptop = {
          modules = commonModules ++ graphicalModules ++ waylandModules ++ [
            #other modules here if needed
          ];
        };
      };

      commonModules = [
        ./modules/home/git
        ./modules/home/ssh
      ];

      graphicalModules = [
        ./modules/home/qutebrowser
        ./modules/home/nvf
        ./modules/home/terminal
        ./modules/home/themes
        ./modules/home/browser
      ];

      waylandModules = [
        ./modules/home/waybar
        ./modules/home/rofi
        ./modules/home/niri
      ];

      desktopModules = [

      ];

      laptopModules = [

      ];

        

      hostConfigs = nixpkgs.lib.mapAttrs (host: _: nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs; inherit user;};
        modules = [
          ./hosts/${host}
          ./modules/core
          inputs.home-manager.nixosModules.default
          {
           
           nixpkgs.overlays = [ inputs.nur.overlays.default ];
           home-manager = {
             useUserPackages = true;
             useGlobalPkgs = true;
	     extraSpecialArgs = { inherit inputs; };
             backupFileExtension = "backup";
             users.${user} = {
               imports = hostAttrs.${host}.modules ++ [ ./hosts/${host}/home.nix ];
               home.stateVersion = stateVersion;
             };
           };

           system.stateVersion = "25.05";
          }
        ];
      }) hosts;
    in {
    nixosConfigurations = hostConfigs;

    # Single Home-Manager configuration for Ubuntu
      homeConfigurations.daniel = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; nixgl = nixgl; };
        modules = [
          ./hosts/ubuntu/home.nix
          {
            targets.genericLinux.enable = true;
            home = {
              username = "daniel";
              homeDirectory = "/home/daniel";
              stateVersion = stateVersion;
            };
          }
          # Import all modules directly
          {
            imports = commonModules ++ graphicalModules ++ waylandModules;
          }
        ];
      };
  };
}
