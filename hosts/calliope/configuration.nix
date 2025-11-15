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

    ./../../services/samba-client.nix
    ./../../services/tailscale.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Monitor Settings
  boot.kernelParams = ["video=HDMI-1:2560x1440@60"]; # Home PC

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
    users.hazel.imports = [
      ./../../home/hazel/base.nix
      ./../../home/hazel/desktop.nix
    ];
  };

  networking.hostName = "calliope";
}
