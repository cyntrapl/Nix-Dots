{ inputs, config, pkgs, ... }:

{

  home.username = "cyntrap";
  home.homeDirectory = "/home/cyntrap";   
  
  imports = [
    ../modules/terminal/kitty.nix
    ../modules/launcher/fuzzel.nix
    ../modules/editor/neovim.nix
    ../modules/hyprland/hyprland.nix
    ../modules/explorer/lf.nix
    ../modules/explorer/bat.nix
    ../modules/themes/gtk.nix
    ../modules/widgets/ags.nix
    ../modules/spicetify/spicetify.nix
    ../modules/video/mpv.nix
    ../modules/animegames/animegames.nix
    ]; 
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    
    #general
    brave
    sublime
    libreoffice
    qbittorrent
    pavucontrol
    htop
    unrar
    (vesktop.override {
    	withSystemVencord = false; #this fixes most plugin issues
    })

    #gaming
    heroic
    gamescope
    mangohud
    r2modman

    #weeb
    miru
    memento
    

    #audio and video
    easyeffects
    rnnoise
    deepfilternet
    obs-studio
    obs-studio-plugins.obs-replay-source

    #file manager
    gnome.nautilus

    #development
    git
    github-desktop
    jetbrains-toolbox
    sublime
    unityhub
    temurin-jre-bin-21

    (wineWowPackages.full.override {
     wineRelease = "staging";
     mingwSupport = true;
    })
    winetricks
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
