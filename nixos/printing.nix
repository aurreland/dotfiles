{ config, pkgs, ... }: {

  # Enable printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplip  hplipWithPlugin ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };


  environment.systemPackages = [ pkgs.cups-filters ];

}