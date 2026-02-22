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

    ./../../system
    ./../../system/desktop
    ./../../hardware/powersave.nix
    ./../../hardware/amdgpu.nix
  ];

  nixpkgs.config.allowInsecurePredicate = pkg: builtins.elem (lib.getName pkg) ["broadcom-sta"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
    users.hazel.imports = [
      ./../../hazel-home
      ./../../hazel-home/desktop
    ];
  };

  networking.hostName = "erato";
}
