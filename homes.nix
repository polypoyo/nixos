{ config, pkgs, home-manager, ... }: {
  imports = [
    home-manager.nixosModule
  ];
  home-manager.users.epb = {
    services = {
      mpd.enable = true;
      gammastep = {
        enable = true;
        longitude = -80.0;
        latitude = 40.0;
      };
    };
    programs.waybar.enable = true;
    home = { packages = with pkgs;[ ]; stateVersion = "22.05"; };
  };
}
