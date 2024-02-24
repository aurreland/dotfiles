{ config, lib, pkgs, stylix, inputs, userSettings, ... }: {

  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    autoEnable = false;
    polarity = "dark";
    image = ../home-manager/stylix/black.jpg;


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
          terminal = 18;
          applications = 12;
          popups = 12;
          desktop = 12;
        };
    };

    base16scheme = ../home-manager/stylix/theme.yaml;

    targets = {
      console.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      nixvim.enable = true;
      grub.enable = true;
    };
  } 

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

}
