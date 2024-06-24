{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

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
      ];
    };
  };
}
