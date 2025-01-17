{ inputs, outputs, config, pkgs, ... }:

{
  imports =
    [ 
      inputs.home-manager.nixosModules.home-manager

      ./hardware-configuration.nix

      ./../../modules/nixos/base.nix
      ./../../modules/nixos/desktop.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs; };
    users.hazel = {
      imports = [
        ./../../modules/home-manager/base.nix
        ./../../modules/home-manager/desktop.nix
      ];
    };
  };

  networking.hostName = "dt1-hzl4";
}
