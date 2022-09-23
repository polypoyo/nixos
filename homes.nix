{ config, pkgs, home-manager, ... }: {
  imports = [
    home-manager.nixosModule
  ];
  home-manager.users.epb = {
    services = {
      gammastep = {
        enable = true;
        longitude = -80;
        latitude = 40;
      };
    };
    home = { packages = with pkgs;[ ]; stateVersion = "22.05"; };
  };
}
