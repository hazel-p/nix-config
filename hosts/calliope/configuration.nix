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
    ./../../system/hardware/amdgpu.nix

    ./../../system
    ./../../system/desktop
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Monitor Settings
  boot.kernelParams = ["video=DP-1:1920x1080@143.85"]; # Home PC

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
