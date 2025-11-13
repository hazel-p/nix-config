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
    ./../../modules/nixos/amdgpu.nix

    ./../../modules/nixos/base.nix
    ./../../modules/nixos/desktop.nix
    ./../../modules/nixos/samba-client.nix

    ./../../services/tailscale.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Monitor Settings
  boot.kernelParams = "video=HDMI-1:2560x1440@60"; # Home PC

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
    users.hazel.imports = [
      ./../../modules/home-manager/base.nix
      ./../../modules/home-manager/desktop.nix
    ];
  };

  networking.hostName = "home-desktop";
}
