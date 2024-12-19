{ inputs, outputs, config, pkgs, ... }:

{
  imports =
    [ 
      inputs.home-manager.nixosModules.home-manager

      ./hardware-configuration.nix
      
      ./../../modules/nixos/base.nix
    ];
  
  networking.hostName = "ms1-hzl4"; # Define your hostname.


  services.getty.autologinUser = "hazel";

}
