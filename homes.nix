{ config, pkgs, home-manager, ... }: {
  imports = [
    home-manager.nixosModule
  ];
  home-manager.users.epb = {
    services = {
      gammastep = {
        enable = true;
        longitude = -80.0;
        latitude = 40.0;
      };
    };
    home = { packages = with pkgs;[ ]; stateVersion = "22.05"; };
  };
}
