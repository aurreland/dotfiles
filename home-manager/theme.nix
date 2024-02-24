{ pkgs, inputs, config, ... }:
let
  nerdfonts = (pkgs.nerdfonts.override { fonts = [
    "Ubuntu"
    "UbuntuMono"
    "CascadiaCode"
    "FantasqueSansMono"
    "FiraCode"
    "Mononoki"
  ]; });
in
{

  imports = [ inputs.stylix.homeManagerModules.stylix ];

  home.packages = with pkgs; [
    nerdfonts
    adw-gtk3
    font-awesome
    nerdfonts
    morewaita-icon-theme
    cantarell-fonts
    qt5ct
    pkgs.libsForQt5.breeze-qt5

  ];

  stylix = {
    autoEnable = false;

    base16Scheme = ./stylix/theme.yaml;
    image = ./stylix/black.jpg;
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 10;
    };

    fonts = {
        monospace = {
           name = "Fira Code";
           package = pkgs.fira-code;
        };
        # serif = {
          # name = "Fira";
          # package = pkgs.fira;
        # };
        # sansSerif = config.stylix.fonts.serif;
        emoji = {
            name = "Noto Color Emoji";
            package = pkgs.noto-fonts-emoji-blob-bin;
        };
        sizes = {
          terminal = 12;
          applications = 12;
          popups = 12;
          desktop = 12;
        };
    };
    targets = {
      gtk.enable = true;
      gnome.enable = true;
      nixvim.enable = true;
      #kitty.enable = true;
    };

  };

  xdg.configFile = {
    "qt5ct/colors/oomox-current.conf".source = config.lib.stylix.colors {
      template = builtins.readFile ./stylix/oomox-current.conf.mustache;
      extension = ".conf";
    };
    "Trolltech.conf".source = config.lib.stylix.colors {
      template = builtins.readFile ./stylix/Trolltech.conf.mustache;
      extension = ".conf";
    };
    "kdeglobals".source = config.lib.stylix.colors {
      template = builtins.readFile ./stylix/Trolltech.conf.mustache;
      extension = "";
    };
    "qt5ct/qt5ct.conf".text = pkgs.lib.mkBefore (builtins.readFile ./stylix/qt5ct.conf);
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME="qt5ct";
  };
  programs.zsh.sessionVariables = {
    QT_QPA_PLATFORMTHEME="qt5ct";
  };
  programs.bash.sessionVariables = {
    QT_QPA_PLATFORMTHEME="qt5ct";
  };
  qt = {
    enable = true;
  };
}