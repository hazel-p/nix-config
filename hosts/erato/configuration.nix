{
  inputs,
  outputs,
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix

    ./../../nixos/base.nix
    ./../../nixos/desktop.nix
    ./../../nixos/powersave.nix
    ./../../nixos/amdgpu.nix

    ./../../services/samba-client.nix
    ./../../services/tailscale.nix
  ];

  nixpkgs.config.allowInsecurePredicate = pkg: builtins.elem (lib.getName pkg) ["broadcom-sta"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
    users.hazel.imports = [
      ./../../home/hazel/base.nix
      ./../../home/hazel/desktop.nix
    ];
  };

  networking.hostName = "erato";
}
