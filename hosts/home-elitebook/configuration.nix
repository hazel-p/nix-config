{
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix

    ./../../modules/nixos/base.nix
    ./../../modules/nixos/desktop.nix
    ./../../modules/nixos/gnome.nix

    ./../../services/tailscale.nix
  ];

  nixpkgs.config.permittedInsecurePackages = ["broadcom-sta-6.30.223.271-57-6.12.41"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
    users.hazel.imports = [
      ./../../modules/home-manager/base.nix
      ./../../modules/home-manager/desktop.nix
    ];
  };

  networking.hostName = "home-elitebook";
}
