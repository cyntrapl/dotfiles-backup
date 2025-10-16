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

  outputs = { self, nixpkgs, ... }@inputs:
    let
      stateVersion = "25.05";
      user = "cyntrap";
      system = "x86_64-linux"; # change if needed
      pkgs = nixpkgs.legacyPackages.${system};
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
  };
}
