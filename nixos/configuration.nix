{ pkgs, username, hostname, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./audio.nix
    # ./greeter.nix
    # ./gnome.nix
    ./hyprland.nix
    # ./laptop.nix
    ./locale.nix
    ./printing.nix
  ];

  # nix
  documentation.nixos.enable = false; # .desktop
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # virtualisation
  programs.virt-manager.enable = true;
  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };

  # dconf
  programs.dconf.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    home-manager
    neovim
    git
    wget
    gamemode
  ];

  programs.gamemode.enable = true;
  programs.steam.enable = true;

  # Avoids crashes
  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
  };

  # 32 bit support
  hardware.opengl.driSupport32Bit = true;

  # services
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    flatpak.enable = true;
  };

  # logind
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=ignore
  '';

  # kde connect
  networking.firewall = rec {
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # user
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = username;
    extraGroups = [
      "nixosvmtest"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
    ];
  };

  # network
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General.Experimental = true; # for gnome-bluetooth percentage
  };

  # bootloader
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ntfs" ];
    loader = {
      timeout = 10;
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        devices = [ "nodev" ];
        enable = true;
        efiSupport = true;
        useOSProber= true;
        gfxmodeEfi = "1920x1080";
      };
    };
    initrd.luks.devices."luks-67516d05-67c4-48b7-bb8b-83671bdfe23b".device = "/dev/disk/by-uuid/67516d05-67c4-48b7-bb8b-83671bdfe23b";
  };

  system.stateVersion = "23.05";
}
