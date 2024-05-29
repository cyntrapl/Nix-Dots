{pkgs, lib, inputs, ...}:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify =
    {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "macchiato";

      enabledExtensions = with spicePkgs.extensions; [
        #official
        fullAppDisplay
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
	bookmark
	loopyLoop
	popupLyrics
	trashbin
	#community
	adblock
	fullAlbumDate
	goToSong
	skipStats
	autoVolume
	savePlaylists
	volumePercentage
      ];
    };
}
