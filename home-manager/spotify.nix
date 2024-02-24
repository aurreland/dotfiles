{ pkgs, lib, inputs, config, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify = {
    enable = true;
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      lyrics-plus
    ];

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      powerBar
      hidePodcasts
    ];

    colorScheme = "custom";
    customColorScheme = {
      text = "fffffa";
      subtext = "e7e8e9";
      sidebar-text = "fffffa";
      main = "171717";
      sidebar = "242526";
      player = "171717";
      card = "171717";
      shadow = "171717";
      # selected-row = ;
      # button = ;
      # button-active = ;
      # button-disabled = ;
      # tab-active = ;
      # notification = ;
      # notification-error = ;
      # misc = ;
    };

  };

}