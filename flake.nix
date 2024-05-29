{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    ags.url = "github:Aylur/ags";

    spicetify-nix.url = "github:the-argus/spicetify-nix";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, spicetify-nix, aagl, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { 
        inherit inputs spicetify-nix;
      };
      modules = [
        ./hosts/configuration.nix
        inputs.home-manager.nixosModules.default
	{
          imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig; # Set up Cachix
          programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
          programs.anime-games-launcher.enable = true;
          programs.anime-borb-launcher.enable = true;
          programs.honkers-railway-launcher.enable = true;
          programs.honkers-launcher.enable = true;
	}
      ];
    };
  };
}
