{ config, pkgs, lib, ... }: {
  services.joycond.enable = true;
  # Allow steam to install
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-runtime"
  ];
  hardware.steam-hardware.enable = true;
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall =
        true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall =
        true; # Open ports in the firewall for Source Dedicated Server
    };
  };
  environment.systemPackages = with pkgs; [
    yuzu-ea
    yuzu-mainline # nintendo switch emulator
  ];
}
