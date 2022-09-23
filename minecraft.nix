{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  services.minecraft-server = {
    eula = true;
    enable = true;
    openFirewall = true;
    declarative = true;
    serverProperties = {
      motd = "A minecraft Server, powered by NixOS";
      enable-rcon = true;
      "rcon.password" = "thisisapassword";
      view-distance = 8;
      simulation-distance = 6;
    };
  };
}
