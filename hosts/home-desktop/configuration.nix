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
    ./../../modules/nixos/university.nix

    ./../../services/tailscale.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # AMD GPU settings
  hardware.graphics.enable = true;
  environment.systemPackages = with pkgs; [lact rocmPackages.rocm-smi];
  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  boot.kernelParams = ["amdgpu.ppfeaturemask=0xffffffff"];

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
