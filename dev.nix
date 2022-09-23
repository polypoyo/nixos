{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nodejs # node js runtime
    nodePackages.javascript-typescript-langserver # language server for js/ts
  ];
}
