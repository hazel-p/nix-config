{ inputs, outputs, config, pkgs, ... }:

{
  imports =
    [ 
      inputs.home-manager.nixosModules.home-manager

      ./hardware-configuration.nix

      ./../../modules/nixos/base.nix
      ./../../modules/nixos/desktop.nix
      
      ./../../services/tailscale.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # AMD GPU settings
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

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

  networking.hostName = "home-desktop";
}
