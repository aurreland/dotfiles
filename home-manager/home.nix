{ pkgs, username, config, ... }:
let
  homeDirectory = "/home/${username}";
in
{
  imports = [
    ./blackbox.nix
    ./browser.nix
    ./bspwm.nix
    ./dconf.nix
    ./git.nix
    ./helix.nix
    ./hyprland.nix
    ./lf.nix
    ./neofetch.nix
    ./packages.nix
    ./sh.nix
    ./starship.nix
    ./stm.nix
    ./sway.nix
    ./theme.nix
    ./tmux.nix
    ./games.nix
    ./spotify.nix
    ./kitty.nix
    ./neovim
    ./eww
    ./notification.nix
    ./wofi.nix
  ];

  news.display = "show";

  targets.genericLinux.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  home = {
    inherit username homeDirectory;

    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
      GOPATH = "${homeDirectory}/.local/share/go";
      GOMODCACHE="${homeDirectory}/.cache/go/pkg/mod";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };



  gtk.gtk3.bookmarks = [
    "file://${config.xdg.userDirs.documents} Documents"
    "file://${config.xdg.userDirs.download} Download"
    "file://${config.xdg.userDirs.pictures} Pictures"
    "file://${config.xdg.userDirs.music} Music"
    "file://${homeDirectory}/.config Config"
    "file://${homeDirectory}/.local/share Local"
  ];

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/music";
    videos = null;
    pictures = "${config.home.homeDirectory}/Media/pic";
    templates = null;
    download = "${config.home.homeDirectory}/Media/dl";
    documents = "${config.home.homeDirectory}/Media/files";
    desktop = "Desktop";
    publicShare = null;
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  programs.home-manager.enable = true;
  home.stateVersion = "21.11";
}
