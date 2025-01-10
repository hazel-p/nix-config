{ inputs, outputs, config, pkgs, ... }:

{
  imports =
    [ 
      inputs.home-manager.nixosModules.home-manager

      ./hardware-configuration.nix

      ./../../modules/nixos/base.nix
      ./../../modules/nixos/desktop.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs; };
    users.hazel = {
      imports = [
        ./../../modules/home-manager/base.nix
      ];
    };
  };

  networking.hostName = "dt1-hzl4";
}
