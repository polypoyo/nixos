# Enables GUI applications

{ config, pkgs, ... }:

{
  programs = {
    sway = {
      enable = true;
      extraPackages = with pkgs; [
        kitty
        rofi
        light
        dmenu
        vscodium
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    firefox # mostly-free web browser
    mpv # media player
    solaar # logitech unifying
    blender # graphics suite, mostly 3D
    smplayer # mpv frontend
    python310Packages.yt-dlp # downloads online videos
  ];
  virtualisation = {
    waydroid = {
      enable = true;
    };
  };
  hardware.logitech.wireless.enableGraphical = true;
  hardware.logitech.wireless.enable = true;
  services.xserver = {
    enable = true;
    windowManager.i3 = { };
    displayManager = {
      startx = {
        enable = true;
      };
    };
    desktopManager.xfce.enable = true;
  };
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-kde ];
    wlr = {
      enable = true;
    };
  };
}
