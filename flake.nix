{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations = {
      epb-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./configuration.nix
          ./gui.nix
          ./basics.nix
          ./homes.nix
          ./entertainment.nix
          ./dev.nix
          ({ config, pkgs, ... }: { networking.hostName = "epb-desktop"; })
        ];
      };
      epb-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./configuration.nix
          ./gui.nix
          ./basics.nix
          ({ config, pkgs, ... }: {
            networking.hostName = "epb-laptop";
            services.sshd.enable = true;
          })
        ];
      };
    };
  };
}
