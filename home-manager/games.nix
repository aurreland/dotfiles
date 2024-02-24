{ pkgs, config, ... }: 
with config.lib.stylix.colors.withHashtag;
{

  home.packages = with pkgs; [
    heroic
    gamescope
    mangohud
    protontricks
    prismlauncher
  ];

}