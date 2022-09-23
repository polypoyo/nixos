# Edit this configuration file to define what should be installed on your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  #networking.hostName = "epb-desktop";
  hardware.bluetooth.enable = true;
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.utf8";
  services.sshd.enable = true;
  services.pipewire.enable = true;
  services.pipewire.audio.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.pulse.enable = true;
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  users.users = {
    epb = {
      isNormalUser = true;
      description = "Evan Paul Bishop";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [ ];
      initialPassword = "dont4get2change";
      subUidRanges = [{
        count = 100000;
        startUid = 100001;
      }];
      subGidRanges = [{
        count = 100000;
        startGid = 100001;
      }];
    };
  };
  environment.systemPackages = with pkgs; [
    emacs
    emacs28Packages.vterm
    git
    nixfmt
    rnix-lsp
    distrobox
  ];
  programs.command-not-found.enable = true; # Handle commands that aren't found
  networking.firewall.enable = false;
  # This value determines the NixOS release from which the default settings for stateful data, like file locations and database versions on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system. Before changing this value read the documentation for this option (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05";
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
