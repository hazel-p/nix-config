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
    ./../../nixos/amdgpu.nix

    ./../../nixos/base.nix
    ./../../nixos/desktop.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Monitor Settings
  boot.kernelParams = ["video=HDMI-1:2560x1440@60"]; # Home PC

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs outputs;};
    users.hazel.imports = [
      ./../../hazel-home
      ./../../hazel-home/desktop
    ];
  };

  networking.hostName = "calliope";
}
