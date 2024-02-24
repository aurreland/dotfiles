{ config, pkgs, lib, ... }:

with config.lib.stylix.colors.withHashtag;

{

  home.packages = with pkgs; [ eww-wayland playerctl libnotify socat jq file flac ffmpeg ];

  xdg.configFile."eww" = {
    recursive = true;
    source = ./eww-config;
  };

  xdg.configFile."eww/scripts" = {
    source = ./scripts;
    executable = true;
  };

}